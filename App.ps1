
#Created Credential Object to login Into Azure (Note: only for Windows)
$username = Get-Credential 
$Cred =New-Object System.Management.Automation.PSCredential($username.UserName , $username.Password)
Login-AzureRmAccount -Credential $Cred

<#
    1. Enter Resource Group Name and SQL Server Name
    2.Validates if RG Exists , if not it will create a new one and re-initilize variable
    3.Get public IP of this current host
    4.Create a Firewall Rule to allow this machine to use Azure SQL
#>
$RGName = read-host "Enter RGName"
$SQLServerName = Read-host "Enter SQL Server Name"

if(!$RGName){

    New-AzureRmResourceGroup -Name $RGName -Location "East US" 
}
$RG = Get-AzureRmResourceGroup | Where ResourceGroupName -eq $RGName

$DBServer = Get-AzureRmSqlServer -ResourceGroupName $RG.ResourceGroupName   

$DBName = Get-AzureRmSqlDatabase -ResourceGroupName $RG.ResourceGroupName -ServerName $DBServer.ServerName

#Getting Public Address 
$publicIp = (Invoke-WebRequest http://myexternalip.com/raw -UseBasicParsing).Content -replace "`n"

New-AzureRmSqlServerFirewallRule -FirewallRuleName "Allow IP" `
-StartIpAddress $publicIp -EndIpAddress $publicIp `
-ServerName $DBServer.ServerName `
-ResourceGroupName $RGName -Verbose











