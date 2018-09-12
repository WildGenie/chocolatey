$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
 
$packageArgs = @{
    packageName    = $packageName
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.2.0.1300.5.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = 'DC03EFDE7DFD4ACE81B0D64AF79239AC0433BD0EBBB0291C10542EED8EBAF566'
    checksumType   = 'sha256'
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.2.0.1300.5.x64.exe'
    checksum64     = '932E10544534C638F39A8B91BB6BA4E974BC2D549C654EFACED5F028F62C994D'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs