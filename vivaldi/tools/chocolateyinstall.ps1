$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.16.1195.3.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = '852FDC3F908CFE52409EA8617CD288A961CF35DC7C9B36AC09425ACAE260AFE1'
    checksumType   = 'sha256' #default is md5, can also be sha1
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.16.1195.3.x64.exe'
    checksum64     = '39F1E8D96454213C57081FB930C28C4958D180FE103E077498C88B56EA20E9C3'
    checksumType64 = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs