$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
 
$packageArgs = @{
    packageName    = $packageName
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.16.1230.3.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = 'C9B07B4ED4C05FA415EFB43A452273164DDFC930495B76E28B0E214AF4DC862C'
    checksumType   = 'sha256'
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.16.1230.3.x64.exe'
    checksum64     = '2B00873AF62760A12D97754F6E4355E05F343274EB74F8D618588CA198E6ACAD'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs