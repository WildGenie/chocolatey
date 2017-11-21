$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.13.1008.30.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = '5F399772C7B2A544820E9DEF21208EF595480BC37FF0DDAD9155D952408F9CE7'
    checksumType   = 'sha256' #default is md5, can also be sha1
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.13.1008.30.x64.exe'
    checksum64     = '970B34931A84CC4DECB3FA5CBC1C6783853CA53CF0232C6078E9839A7FB55FEA'
    checksumType64 = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs

Write-Host "Vivaldi has been installed with a silent installer. Any shortcuts you had to the previous portable installer's location will need to be re-generated." # REMOVE NEXT TIME