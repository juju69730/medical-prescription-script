
# Script de Prescription Médicale et Gestion des Patients

Ce script offre des fonctionnalités médicales avancées pour les serveurs FiveM, y compris les prescriptions, les certificats médicaux, la gestion des patients, et plus encore. Il est compatible avec les frameworks ESX et OX, et s'intègre avec `brutal_ambulancejob`.

## Fonctionnalités

- **Prescriptions Médicales** : Permet au personnel médical autorisé de prescrire des médicaments et des objets comme des fauteuils roulants.
- **Gestion des Patients** : Créez et gérez les dossiers des patients pour les consultations futures.
- **Certificats Médicaux** : Génération de certificats pour les besoins professionnels ou les arrêts de travail temporaires.
- **Expiration des Objets** : Suppression automatique des prescriptions et objets (comme les fauteuils roulants) après leur durée prescrite.
- **Intégration Webhook** : Notifications des webhooks pour des événements tels que la délivrance de prescriptions ou la récupération d'objets.

## Installation

### Étape 1 : Extraction des Fichiers
1. Téléchargez et extrayez le script dans le dossier `resources` de votre serveur.

### Étape 2 : Ajouter au `server.cfg`
Ajoutez la ligne suivante à votre fichier `server.cfg` :
```plaintext
ensure medical_script_combined_update
```

### Étape 3 : Importer le SQL
Importez le fichier SQL fourni dans votre base de données pour ajouter les items et tables nécessaires.

### Étape 4 : Configurer le Script
Modifiez le fichier `config.lua` pour personnaliser les paramètres, tels que les grades autorisés, les URL des webhooks, etc.

## Commandes par Défaut

- **F9** : Ouvre le menu médical, permettant de :
  - Gérer les dossiers des patients.
  - Écrire des prescriptions médicales.
  - Créer des certificats médicaux ou des arrêts de travail.

## Prérequis

- Framework ESX ou OX
- `brutal_ambulancejob` pour les restrictions basées sur les grades.

## Images et Ressources

Assurez-vous que toutes les images des items (par exemple, `Paracétamol.png`, `Fauteuil_roulant.png`) sont placées dans le bon répertoire conformément aux instructions.

## Notes

- Seuls les grades autorisés (par exemple, `medecin`, `chef_medecin`, `directeur_hopital`) peuvent utiliser les fonctionnalités médicales.
- Les objets tels que la morphine et les fauteuils roulants nécessitent une prescription valide pour être récupérés.

## Support

En cas de problème ou pour une personnalisation supplémentaire, n'hésitez pas à demander de l'aide.

## Auteur

**Enzo Rossy**
