$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.15.1147.19.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = 'AB1ED25A71F0044F02803C99697DFEFCBE861F6EC84A3D750F8253A117CB0AC9'
    checksumType   = 'sha256' #default is md5, can also be sha1
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.15.1147.19.x64.exe'
    checksum64     = '09E9B33CFEA6C4816F4980789F4DC697390CDF58B510843F029ACF44B9BEFC61'
    checksumType64 = 'sha256' #default is md5, can also be sha1
}

Install-ChocolateyPackage @packageArgs