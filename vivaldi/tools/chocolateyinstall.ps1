$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
 
$packageArgs = @{
    packageName    = $packageName
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.2.0.1308.5.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = '2DEA325952CBC8905F84F40AF5F8E837D43BB0344BFF756A327BA0DB9357899D'
    checksumType   = 'sha256'
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.2.0.1308.5.x64.exe'
    checksum64     = 'CE8A03615214F0EE28DF9B5835DD14204AC9863F0D79F22F4CFE45F86CD5C1C4'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs