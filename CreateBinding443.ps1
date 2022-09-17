$existSSL = Get-WebBinding -Port 443

if($existSSL.Length -gt 0)
{
    Write-Host 'Ok!.'
}
else
{
    Write-Host 'NO Existe el Binding 443'

    $manager = Get-IISServerManager
    $sites = $manager.Sites.Item(0)
    $cert = Get-ChildItem Cert:\LocalMachine\My | where{$_.Subject -eq "CN=localhost"}


    Write-Host 'Creando el Binding...'
    New-WebBinding -Name $sites.Name -IPAddress "*" -Port 443 -Protocol "https"
        
    Write-Host 'Asignando el certificado...'
    (Get-WebBinding -Name $sites.Name -Port 443 -Protocol "https").AddSslCertificate($cert.Thumbprint, "my")
}
