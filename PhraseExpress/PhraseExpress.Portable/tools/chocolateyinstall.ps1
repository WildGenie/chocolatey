
$ErrorActionPreference = 'Stop';


$packageName= 'PhraseExpress.Portable'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.phraseexpress.com/PhraseExpressBeta_USB.zip' 
$url64      = $url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'ZIP'
  url           = $url
  url64bit      = $url64


  softwareName  = 'PhraseExpress.Portable*'
  checksum      = '1E8ABBAB807BB3F1B4D9056231F5BBC176ECC3E38D876D4ADB06DF9B65FDF632'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs