<#

1. Find and install the SQLCMD2 module if not present



#>

$publicIp = (Invoke-WebRequest http://myexternalip.com/raw).Content -replace "`n"

Login-AzureRmAccount -Credential (Get-Credential -UserName glent@rectron.co.za -Message "login")
$db = Get-AzureRmSqlServer -ResourceGroupName testing





$params = @{
	'Database' = 'rctsql'
	'ServerInstance' = 'rctdemo.database.windows.net'
	'Username' = 'Glen'
	'Password' = 'Morolong1993'
	'Query' = 'SELECT * FROM salesLT.EmployeeName'
}
Invoke-Sqlcmd @params

