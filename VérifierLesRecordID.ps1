# Informations Cloudflare
$zone_id = "qwertty"  # Ton Zone ID
$api_token = "aSDFGH"  # Ton API token
$record_id = "ZXCVB"  # Le Record ID à vérifier

# URL API pour récupérer les informations de l'enregistrement DNS
$url = "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$record_id"

# Entête d'autorisation
$headers = @{
    "Authorization" = "Bearer $api_token"
    "Content-Type"  = "application/json"
}

# Envoyer la requête pour obtenir les détails de l'enregistrement DNS
$response = Invoke-RestMethod -Method GET -Uri $url -Headers $headers

# Afficher les détails de l'enregistrement
$response.result
