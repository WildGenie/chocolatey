
$ErrorActionPreference = 'Stop';


$packageName= 'PhraseExpress.Install'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.phraseexpress.com/PhraseExpressBetaSetup.exe' 
$url64      = $url

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  silentArgs   = '/RESTARTAPPLICATIONS /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
  validExitCodes= @(0, 3010, 1641)

  softwareName  = 'PhraseExpress*'
  checksum      = 'F24281F5C60D392EC66FF9D641CF0F44DC8CEA374067C7A29E92455B8219A76F'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs