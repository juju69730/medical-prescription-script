
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

MySQL.ready(function()
    -- Créer la table pour stocker les prescriptions si elle n'existe pas
    MySQL.Async.execute([[
        CREATE TABLE IF NOT EXISTS prescriptions (
            id INT AUTO_INCREMENT PRIMARY KEY,
            player_identifier VARCHAR(50) NOT NULL,
            item VARCHAR(50),
            quantity INT DEFAULT 1,
            date_fin DATE,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ]], {})
end)

-- Vérifier automatiquement les prescriptions expirées
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000) -- Vérification toutes les 60 secondes

        local currentDate = os.date('%Y-%m-%d')
        MySQL.Async.fetchAll('SELECT id, player_identifier, item, quantity FROM prescriptions WHERE date_fin < @currentDate', {
            ['@currentDate'] = currentDate
        }, function(results)
            for _, prescription in ipairs(results) do
                local xPlayer = ESX.GetPlayerFromIdentifier(prescription.player_identifier)
                if xPlayer then
                    xPlayer.removeInventoryItem(prescription.item, prescription.quantity)
                end
                MySQL.Async.execute('DELETE FROM prescriptions WHERE id = @id', { ['@id'] = prescription.id })
            end
        end)
    end
end)

-- Prescription d'un médicament ou d'un fauteuil roulant
RegisterServerEvent('medical:prescrire')
AddEventHandler('medical:prescrire', function(item, quantity, dateFin)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    local identifier = xPlayer.identifier

    MySQL.Async.execute('INSERT INTO prescriptions (player_identifier, item, quantity, date_fin) VALUES (@identifier, @item, @quantity, @dateFin)', {
        ['@identifier'] = identifier,
        ['@item'] = item,
        ['@quantity'] = quantity or 1,
        ['@dateFin'] = dateFin
    }, function(rowsChanged)
        if rowsChanged > 0 then
            xPlayer.addInventoryItem(item, quantity or 1)
            TriggerClientEvent('esx:showNotification', source, ('%s prescrit avec succès.'):format(item))
        else
            TriggerClientEvent('esx:showNotification', source, 'Erreur lors de la prescription.')
        end
    end)
end)
