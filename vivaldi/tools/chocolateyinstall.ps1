$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
 
$packageArgs = @{
    packageName    = $packageName
    fileType       = 'exe'
       
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.2.0.1307.3.exe'
    silentArgs     = '--vivaldi-silent --do-not-launch-chrome --vivaldi-update'
    
    checksum       = '40B5EF6261F2D863532CD04D556F21F4280F871FF45973C6871032EC3A369CD3'
    checksumType   = 'sha256'
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.2.0.1307.3.x64.exe'
    checksum64     = 'BC8D11DA4612E6ECC27965C48B7FA0EBA6D52DD4B6243A9004E1E4CDF3F74612'
    checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs