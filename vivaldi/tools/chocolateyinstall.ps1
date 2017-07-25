$ErrorActionPreference = 'Stop';

$packageName = 'vivaldi'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
 
$packageArgs = @{
    packageName    = $packageName
    FileFullPath   = Join-Path $toolsDir 'vivaldi-downloaded.zip'
 
    url            = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.11.915.3.exe'
    checksum       = 'AC1DED7979498F28AA9AD5224AEE44FE0DA3B72924F53A394C9CDF79C10E6C65'
    checksumType   = 'sha256' #default is md5, can also be sha1
 
    url64bit       = 'https://downloads.vivaldi.com/snapshot/Vivaldi.1.11.915.3.x64.exe'
    checksum64     = 'CCDE9090331596EB2F30F8F5E3F309A65A6392248E1C3508986049C997F846FC'
    checksumType64 = 'sha256' #default is md5, can also be sha1
}
 
$downloadedFile = Get-ChocolateyWebFile @packageArgs
 
Write-Host 'Unpacking vivaldi installer like an archive...'
& 7z x -aoa -bb0 -bso0 -o"$($toolsDir)\$($packageName)" $downloadedFile
Get-ChocolateyUnzip "$($toolsDir)\$($packageName)\vivaldi.7z" "$($toolsDir)\$($packageName)"
 
Write-Host 'Creating *.ignore files to avoid making shims for other exes'
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\crash_service.exe.ignore" -type file -force | Out-Null
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\wow_helper.exe.ignore" -type file -force | Out-Null
New-Item "$($toolsDir)\$($packageName)\Vivaldi-bin\update_notifier.exe.ignore" -type file -force | Out-Null