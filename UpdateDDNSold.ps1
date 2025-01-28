# Script PowerShell : Mise à jour d'un enregistrement DNS Cloudflare

## Informations Cloudflare
$zone_id = "zxcvbn"       # Identifiant de la zone Cloudflare
$record_id = "asdfgh"     # Identifiant de l'enregistrement DNS
$api_token = "qwerty"     # Jeton API Cloudflare
$domain_name = "TheRisingCloud.com"  # Nom de domaine à mettre à jour

## Récupération de l'IP publique
$ip = Invoke-RestMethod -Uri "https://api.ipify.org"

## URL API Cloudflare
$url = "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$record_id"

## Entêtes d'autorisation
$headers = @{
    "Authorization" = "Bearer $api_token"
    "Content-Type"  = "application/json"
}

## Données à envoyer pour mettre à jour l'enregistrement DNS
$body = @{
    "type"    = "A"            # Type d'enregistrement (A pour une adresse IPv4)
    "name"    = $domain_name   # Nom de domaine à mettre à jour
    "content" = $ip            # Nouvelle adresse IP publique
    "ttl"     = 120            # Temps de mise en cache (en secondes)
    "proxied" = $false         # Proxy Cloudflare désactivé (mettre $true pour l'activer)
} | ConvertTo-Json -Depth 10

## Mise à jour de l'enregistrement DNS via l'API Cloudflare
$response = Invoke-RestMethod -Method PUT -Uri $url -Headers $headers -Body $body

## Vérification de la réponse
if ($response.success) {
    Write-Host "IP mise à jour avec succès : $ip"
} else {
    Write-Host "Erreur lors de la mise à jour : $($response.errors | ConvertTo-Json -Depth 10)"
}