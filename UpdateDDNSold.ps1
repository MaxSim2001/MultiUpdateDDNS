# Script PowerShell : Mise � jour d'un enregistrement DNS Cloudflare

## Informations Cloudflare
$zone_id = "zxcvbn"       # Identifiant de la zone Cloudflare
$record_id = "asdfgh"     # Identifiant de l'enregistrement DNS
$api_token = "qwerty"     # Jeton API Cloudflare
$domain_name = "TheRisingCloud.com"  # Nom de domaine � mettre � jour

## R�cup�ration de l'IP publique
$ip = Invoke-RestMethod -Uri "https://api.ipify.org"

## URL API Cloudflare
$url = "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$record_id"

## Ent�tes d'autorisation
$headers = @{
    "Authorization" = "Bearer $api_token"
    "Content-Type"  = "application/json"
}

## Donn�es � envoyer pour mettre � jour l'enregistrement DNS
$body = @{
    "type"    = "A"            # Type d'enregistrement (A pour une adresse IPv4)
    "name"    = $domain_name   # Nom de domaine � mettre � jour
    "content" = $ip            # Nouvelle adresse IP publique
    "ttl"     = 120            # Temps de mise en cache (en secondes)
    "proxied" = $false         # Proxy Cloudflare d�sactiv� (mettre $true pour l'activer)
} | ConvertTo-Json -Depth 10

## Mise � jour de l'enregistrement DNS via l'API Cloudflare
$response = Invoke-RestMethod -Method PUT -Uri $url -Headers $headers -Body $body

## V�rification de la r�ponse
if ($response.success) {
    Write-Host "IP mise � jour avec succ�s : $ip"
} else {
    Write-Host "Erreur lors de la mise � jour : $($response.errors | ConvertTo-Json -Depth 10)"
}