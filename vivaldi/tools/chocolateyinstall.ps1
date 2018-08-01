$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
 
$packageArgs = @{
    packageName    = $packageName
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.16.1259.3.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = 'A372C7DAF30A6A7B798CD3DDC7737417ECBD0BA17431223035D64CAFCC3CC934'
    checksumType   = 'sha256'
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.16.1259.3.x64.exe'
    checksum64     = '0064D9F1F438DC101A3B4E0C92AD84507995B44F2AF8FE9C51F6DDC61B48D01B'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs