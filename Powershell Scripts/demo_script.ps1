# Connect to your Azure Account
Connect-AzAccount

# Uncomment to get a List all the subscriptions associated to your account
# Get-AzSubscription

# Select a subscription
Set-AzContext -SubscriptionId 7ad724aa-2f5b-49a1-a1b5-3f7d6ebe9a6e

#Set appropriate Directory
$dataLakeStorageGen1Name = "msrww-adhoc-c09"
$myrootdir = "/"

$files = get-azdatalakestorechilditem -AccountName $dataLakeStorageGen1Name -Path $myrootdir\local\teams\Keytruda\missing_dates

Foreach ($file in $files){

    $filename = "missing" + $file.name
    $filepath = $file.path
    Export-AzDataLakeStoreItem -AccountName $dataLakeStorageGen1Name `
   -Path $filepath `
   -Destination "C:\Users\v-kirdwivedi\Documents\GitHub\KEYTRUDA\Data\$filename" ` #You'll have to change the path here to the local path. 
   #-Force 


}
   
   #remove-item -force 'C:\Users\v-kirdwivedi\AppData\Local\Temp\.adl\Download\20dbab44fc3e98db5e1d0e462354e63f'