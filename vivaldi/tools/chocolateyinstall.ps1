$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
 
$packageArgs = @{
    packageName    = $packageName
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.2.0.1295.3.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = '47A2581C49BF38B601D5F5B0B9E07CADDDC9CA82F146504FED404B3AE3193371'
    checksumType   = 'sha256'
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.2.0.1295.3.x64.exe'
    checksum64     = 'EEB75EA1149748EE5CBE7DD0BC9F02069F7D59E489DEF8E15D0D835988432CE4'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs