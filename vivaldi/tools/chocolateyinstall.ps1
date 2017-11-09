$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.13.1008.11.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = 'FA1EF6AA7F2F8584A01E3B8A6CAA741F33F20DD764551B883E66578DA048AD19'
    checksumType   = 'sha256' #default is md5, can also be sha1
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.13.1008.11.x64.exe'
    checksum64     = '3B72938D47765BD9A13636C0F5052515EC9D1CF6CC1803798392204A36F0DEF2'
    checksumType64 = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs

Write-Host 'Vivaldi has been installed with a silent installer. Any shortcuts you had will need to be re-generated.' # REMOVE NEXT TIME