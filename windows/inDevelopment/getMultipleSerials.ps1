Get-Process | Export-Csv -Path .\Processes.csv -Delimiter :
$P = Import-Csv -Path .\Processes.csv -Delimiter :
$P | Format-Table