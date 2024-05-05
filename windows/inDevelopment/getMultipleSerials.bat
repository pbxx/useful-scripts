@echo off

set /P "user=Enter username in Win2k format (DOMAIN\user): "

echo %user%

wmic /NODE:"your.domain.hostname" /USER:"%user%" BIOS GET serialnumber