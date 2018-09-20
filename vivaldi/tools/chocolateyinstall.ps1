$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
 
$packageArgs = @{
    packageName    = $packageName
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.2.0.1309.3.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = 'A01F5A7B17CFB87A727FB81C04C6F99BA130F283EF4AA8D32A60357526E573BF'
    checksumType   = 'sha256'
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.2.0.1309.3.x64.exe'
    checksum64     = '6F2EC3CDFD760BF8A5C04D1307CC0BA479FD42F2492113D41A2D870CFF283CEA'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs