
#Created Credential Object to login Into Azure (Note: only for Windows)
$username = Get-Credential 
$Cred =New-Object System.Management.Automation.PSCredential($username.UserName , $username.Password)
Login-AzureRmAccount -Credential $Cred


$RGName = read-host "Enter RGName"
$SQLServerName = Read-host "Enter SQL Server Name"

if(!$RGName){

    New-AzureRmResourceGroup -Name $RGName -Location "East US" 
}
$RG = Get-AzureRmResourceGroup | Where ResourceGroupName -eq $RGName

$DBServer = Get-AzureRmSqlServer -ResourceGroupName $RGName -ServerName "$SQLServerName.database.windows.net"         

#Getting Public Address 
$publicIp = (Invoke-WebRequest http://myexternalip.com/raw -UseBasicParsing).Content -replace "`n"

New-azurermsql

$cred = New-Object System.Management.Automation.


$params = @{
	'Database' = 'rctsql'
	'ServerInstance' = 'rctdemo.database.windows.net'
	'Username' = 'Glen'
	'Password' = 'Morolong1993'
	'Query' = 'SELECT * FROM salesLT.EmployeeName'
}
Invoke-Sqlcmd @params

