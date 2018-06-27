$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
 
$packageArgs = @{
    packageName    = $packageName
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.16.1221.3.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = 'FE5F1BE99E15B934C76F041618741F7B437B82F00C775CAB7C23C62275985662'
    checksumType   = 'sha256'
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.16.1221.3.x64.exe'
    checksum64     = '79B0E6E795A7A4B3C1A7FB003811999E3141DE7139AD8CB1A7EAE927DDAA3913'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs