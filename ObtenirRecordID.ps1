# Informations Cloudflare
$zone_id = "asdfgh"  # Remplace par ton Zone ID
$api_token = "qwerty"  # Remplace par ton API token
$domain_name = "TheRisingCloud.com"  # Nom du domaine

# URL API pour récupérer les enregistrements DNS
$url = "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records"

# Entête d'autorisation
$headers = @{
    "Authorization" = "Bearer $api_token"
    "Content-Type"  = "application/json"
}

# Envoyer la requête pour obtenir les enregistrements DNS
$response = Invoke-RestMethod -Method GET -Uri $url -Headers $headers

# Filtrer pour trouver le Record ID de l'enregistrement avec le nom de domaine spécifié
$dns_record = $response.result | Where-Object { $_.name -eq $domain_name }

if ($dns_record) {
    Write-Host "Record ID pour $domain_name : $($dns_record.id)"
} else {
    Write-Host "Enregistrement DNS pour $domain_name non trouvé."
}
