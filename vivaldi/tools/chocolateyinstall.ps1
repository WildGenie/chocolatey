$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.15.1147.21.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = '083F26BB98C32E66211BF68FA1FF26E7A6570FE5310882AED5019993124D5C85'
    checksumType   = 'sha256' #default is md5, can also be sha1
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.15.1147.21.x64.exe'
    checksum64     = 'F660652A9443901E4B60BE30E4B68CEAE52994C8C2FF26896EBD5D6CD7D9A6BE'
    checksumType64 = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs