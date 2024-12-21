
RegisterCommand('ouvrirMenuMedical', function()
    -- Déclenche l'ouverture du menu médical (F9)
    TriggerEvent('medical:ouvrirMenu')
end, false)

RegisterKeyMapping('ouvrirMenuMedical', 'Ouvrir le menu médical', 'keyboard', 'F9')

RegisterNetEvent('medical:ouvrirMenu')
AddEventHandler('medical:ouvrirMenu', function()
    local elements = {
        { label = "Dossier médical", value = "dossier_medical" },
        { label = "Prescription médicale", value = "prescription_medicale" },
        { label = "Certificat médical", value = "certificat_medical" },
        { label = "Arrêt de travail", value = "arret_travail" }
    }

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menu_medical', {
        title = "Menu Médical",
        align = 'top-left',
        elements = elements
    }, function(data, menu)
        if data.current.value == "dossier_medical" then
            ouvrirMenuDossierMedical()
        elseif data.current.value == "prescription_medicale" then
            ouvrirMenuPrescription()
        elseif data.current.value == "certificat_medical" then
            ouvrirMenuCertificatMedical()
        elseif data.current.value == "arret_travail" then
            ouvrirMenuArretTravail()
        end
    end, function(data, menu)
        menu.close()
    end)
end)

function ouvrirMenuDossierMedical()
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'dossier_nom', {
        title = "Nom du patient"
    }, function(data, menu)
        local nom = data.value
        if not nom then return end
        menu.close()

        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'dossier_prenom', {
            title = "Prénom du patient"
        }, function(data2, menu2)
            local prenom = data2.value
            if not prenom then return end
            menu2.close()

            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'dossier_date_naissance', {
                title = "Date de naissance du patient (JJ/MM/AAAA)"
            }, function(data3, menu3)
                local naissance = data3.value
                if not naissance then return end
                menu3.close()

                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'dossier_raison', {
                    title = "Raison de la consultation"
                }, function(data4, menu4)
                    local raison = data4.value
                    if not raison then return end
                    menu4.close()

                    TriggerServerEvent('medical:creerDossier', nom, prenom, naissance, raison)
                end, function(data4, menu4)
                    menu4.close()
                end)
            end, function(data3, menu3)
                menu3.close()
            end)
        end, function(data2, menu2)
            menu2.close()
        end)
    end, function(data, menu)
        menu.close()
    end)
end

function ouvrirMenuPrescription()
    -- Logique existante pour les prescriptions
end

function ouvrirMenuCertificatMedical()
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'certificat_nom', {
        title = "Nom du patient"
    }, function(data, menu)
        local nom = data.value
        if not nom then return end
        menu.close()

        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'certificat_prenom', {
            title = "Prénom du patient"
        }, function(data2, menu2)
            local prenom = data2.value
            if not prenom then return end
            menu2.close()

            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'certificat_date_naissance', {
                title = "Date de naissance du patient (JJ/MM/AAAA)"
            }, function(data3, menu3)
                local naissance = data3.value
                if not naissance then return end
                menu3.close()

                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'certificat_entreprise', {
                    title = "Entreprise"
                }, function(data4, menu4)
                    local entreprise = data4.value
                    if not entreprise then return end
                    menu4.close()

                    TriggerServerEvent('medical:creerCertificat', nom, prenom, naissance, entreprise)
                end, function(data4, menu4)
                    menu4.close()
                end)
            end, function(data3, menu3)
                menu3.close()
            end)
        end, function(data2, menu2)
            menu2.close()
        end)
    end, function(data, menu)
        menu.close()
    end)
end

function ouvrirMenuArretTravail()
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'arret_nom', {
        title = "Nom du patient"
    }, function(data, menu)
        local nom = data.value
        if not nom then return end
        menu.close()

        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'arret_prenom', {
            title = "Prénom du patient"
        }, function(data2, menu2)
            local prenom = data2.value
            if not prenom then return end
            menu2.close()

            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'arret_date_naissance', {
                title = "Date de naissance du patient (JJ/MM/AAAA)"
            }, function(data3, menu3)
                local naissance = data3.value
                if not naissance then return end
                menu3.close()

                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'arret_entreprise', {
                    title = "Entreprise"
                }, function(data4, menu4)
                    local entreprise = data4.value
                    if not entreprise then return end
                    menu4.close()

                    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'arret_date_fin', {
                        title = "Date de fin de l'arrêt (JJ/MM/AAAA)"
                    }, function(data5, menu5)
                        local dateFin = data5.value
                        if not dateFin then return end
                        menu5.close()

                        TriggerServerEvent('medical:creerArret', nom, prenom, naissance, entreprise, dateFin)
                    end, function(data5, menu5)
                        menu5.close()
                    end)
                end, function(data4, menu4)
                    menu4.close()
                end)
            end, function(data3, menu3)
                menu3.close()
            end)
        end, function(data2, menu2)
            menu2.close()
        end)
    end, function(data, menu)
        menu.close()
    end)
end
