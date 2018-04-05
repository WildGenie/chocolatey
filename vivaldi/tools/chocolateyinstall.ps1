$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.15.1146.5.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = '4883834DE55105D8DD4D34A373C00BBCB3793927328355C7BC6D8B3458B70D34'
    checksumType   = 'sha256' #default is md5, can also be sha1
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.15.1146.5.x64.exe'
    checksum64     = '6736A8B579507B0A52F44393D717903511192EF701282BFF80D5E7A75A983045'
    checksumType64 = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs