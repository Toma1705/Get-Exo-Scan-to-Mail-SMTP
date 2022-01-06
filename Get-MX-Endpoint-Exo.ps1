$Domain = Read-Host "Domainname"
#Leerzeichen entfernen
$Domain = $Domain.Trim()
Clear-Host
#www. Entfernen
if($Domain.Contains("www."))
{
  $Domain = $Domain.TrimStart("www.")
}
try
{
  $MX = Resolve-DnsName -Name $Domain -Type MX | Select-Object NameExchange
  if($MX.NameExchange.Contains("mail.protection.outlook.com"))
  {
    "SMTP-Adresse: " + $MX.NameExchange
    "Port: 25"
    "Mail(Beispiel): scan@$Domain"
  }
} catch
{
}