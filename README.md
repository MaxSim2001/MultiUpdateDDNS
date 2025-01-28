# README : Script PowerShell pour mise à jour DNS Cloudflare

Ce script met à jour automatiquement l'adresse IP publique associée à un enregistrement DNS sur Cloudflare.

## Fonctionnalités principales
- Récupération de l'IP publique via l'API `https://api.ipify.org`.
- Mise à jour de l'enregistrement DNS (type A) via l'API Cloudflare.
- Gestion du proxy Cloudflare (activé ou désactivé).

## Prérequis
1. Un jeton API Cloudflare avec les autorisations nécessaires (Zone > DNS > Modifier).
2. Les identifiants suivants :
   - `zone_id` : Identifiant de la zone Cloudflare.
   - `record_id` : Identifiant de l'enregistrement DNS.
   - `api_token` : Jeton d'accès API.
3. PowerShell installé sur votre machine.

## Instructions
1. Remplissez les informations Cloudflare dans le script :
   ```powershell
   $zone_id = "Votre Zone ID"
   $record_id = "Votre Record ID"
   $api_token = "Votre API Token"
   $domain_name = "Votre Nom de Domaine"
   ```
2. Exécutez le script dans PowerShell.

## Résultat
- Si la mise à jour réussit :
  ```
  IP mise à jour avec succès : [Nouvelle IP]
  ```
- En cas d'erreur, un message détaillé sera affiché.

## Note
- Le script désactive par défaut le proxy Cloudflare (modifiable avec `$body.proxied = $true`).


 
