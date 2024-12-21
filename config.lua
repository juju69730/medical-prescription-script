
Config = {}

-- URL du Webhook pour les notifications
Config.WebhookURL = "VOTRE_URL_WEBHOOK_DISCORD"

-- Grades autorisés pour les médecins
Config.AuthorizedGrades = {
    directeur_hopital = true,
    medecin = true,
    chef_medecin = true
}

-- Médicaments et leurs noms d'items
Config.Medications = {
    { name = "Paracétamol", item = "paracetamol" },
    { name = "Antibiotique", item = "antibiotique" },
    { name = "Magnésium", item = "magnesium" },
    { name = "Spasfon", item = "spasfon" },
    { name = "Morphine", item = "morphine" },
    { name = "Biseptine", item = "biseptine" },
    { name = "Xanax", item = "xanax" },
    { name = "Ibuprofène", item = "ibuprofene" },
    { name = "Sirop", item = "sirop" },
    { name = "Advil", item = "advil" },
    { name = "Sérum physiologique", item = "serum_physiologique" },
    { name = "Bétadine", item = "betadine" },
    { name = "Nurofen", item = "nurofen" }
}
