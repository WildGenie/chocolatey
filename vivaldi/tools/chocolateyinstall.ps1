$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.13.1008.19.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = '0B0495D7F5CF18102DC3E121D090CAF44AFAF9FEB93052A338C30212C731DF38'
    checksumType   = 'sha256' #default is md5, can also be sha1
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.13.1008.19.x64.exe'
    checksum64     = '5DF762DDE7467DA9A4E279A622E3E0D9A28960A5BC3C3B22E0DBB41CD3C35B93'
    checksumType64 = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs

Write-Host "Vivaldi has been installed with a silent installer. Any shortcuts you had to the previous portable installer's location will need to be re-generated." # REMOVE NEXT TIME