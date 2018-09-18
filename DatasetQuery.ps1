
#Created a function used to Insert data into AZURE SQL with a data generator
function insertdata {

$DateCaptured = get-date
$City = @(
    "Bloemfontein" ,
    "Cape town" ,
    "Johannesburg" ,
    "Durban" ,
    "Nelson Mandela bay"
)  

$City1 = Get-Random -InputObject $City 
$OrderAmount = Get-Random -Minimum 50 -Maximum 5000
$pass = ConvertTo-SecureString -AsPlainText "P@ssw0rd" -force
$cred = New-Object System.Management.Automation.PSCredential("Glen", $pass)
$Query = "Insert Into Orders (DateCaptured , City , TotalOrderAmount) values ('$DateCaptured' , '$city1', '$OrderAmount')"

Invoke-Sqlcmd2 -ServerInstance "LobDB.database.windows.net" -Database "LobDB" -Query $Query -Credential $Cred -Verbose 
}


#This will loop for every 5 seconds to generate new random Data
while ($true){
Start-Sleep -Seconds 5 
    insertdata 
}

