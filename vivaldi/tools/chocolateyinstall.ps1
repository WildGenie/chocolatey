$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.14.1030.3.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = 'CF8E24C3F996024BDCB2A1C7F645D9FD57EEA0E1279BFEE399C96CCF099E8DDB'
    checksumType   = 'sha256' #default is md5, can also be sha1
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.14.1030.3.x64.exe'
    checksum64     = '5E6D11579F19BB499F3E0F9B024405D10E1E29159CC213F7B0DC4697804EE6DC'
    checksumType64 = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs

Write-Host "Vivaldi has been installed with a silent installer. Any shortcuts you had to the previous portable installer's location will need to be re-generated." # REMOVE NEXT TIME