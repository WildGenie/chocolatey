$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
 
$packageArgs = @{
    packageName    = $packageName
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.2.0.1296.4.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = '4BE4C72BCF097BB3C22994947C0DB1C359A4A07AE1AAAA0096D7F2760F152D37'
    checksumType   = 'sha256'
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.2.0.1296.4.x64.exe'
    checksum64     = 'F1C9BEB7B36E51E3E4A183B0391FA65A0FC85657E7C03BE46C89B1B3254E52FF'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs