$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
 
$packageArgs = @{
    packageName    = $packageName
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.16.1246.7.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = '80368A5626879CC323ED290245080B101918F5E95B8B34E58DBEEB80512F9FBF'
    checksumType   = 'sha256'
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.16.1246.7.x64.exe'
    checksum64     = '6D2F91F1D2F94E7CDB3AE6F52B7AEF1F8865B641C835A964C7E095262E00CFEE'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs