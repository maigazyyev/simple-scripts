Import-Module ActiveDirectory

$Domain="@domain.int"

$NewUsersList=Import-CSV "users.csv"     ### File should be located in current directory where script runs!

ForEach ($User in $NewUsersList) {

$fullname=$User.FullName
$givenname=$User.givenName
$email=$User.email
$displayName=$User.displayName
$userprincipalname=$User.userprincipalname
$samaccountname=$User.userprincipalname
$surname=$User.surname
$description=$User.description


New-ADUser -PassThru -Path "OU=Users,OU=CompanyName,OU=City,OU=Recipients,DC=domain,DC=int" -AccountPassword (ConvertTo-SecureString test@1234562 -AsPlainText -Force) -CannotChangePassword $False -DisplayName $fullname -GivenName $givenname -Name $fullname -SamAccountName $samaccountname -Surname $surname -email $email -UserPrincipalName $userprincipalname -Description $description

}



