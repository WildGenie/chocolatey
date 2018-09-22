$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
 
$packageArgs = @{
    packageName    = $packageName
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.2.0.1309.17.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = '1E9D70EF66C8EAB0F9F5406B418AE3373B089BE3C293FA1E1B2B4EF06F2EAA9D'
    checksumType   = 'sha256'
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.2.0.1309.17.x64.exe'
    checksum64     = '6CF8893CB91822A8465F301DC9866A591874672E81D989B4C34A51F71729EAC3'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs