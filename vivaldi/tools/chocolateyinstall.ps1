$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
 
$packageArgs = @{
    packageName    = $packageName
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.2.0.1309.25.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = 'FA0625DCF2DE5CDF384A3B683A4E95B2F8D3E55300DA75E4044AEA20762CFEB2'
    checksumType   = 'sha256'
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.2.0.1309.25.x64.exe'
    checksum64     = 'BDB0FB9AD5EAC88240A6ED43FB9A1353F5926D91AAC57E3185EC64F2AB1FBA56'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs