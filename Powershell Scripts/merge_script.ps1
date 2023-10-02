# Connect to your Azure Account
Connect-AzAccount

# Uncomment to get a List all the subscriptions associated to your account
# Get-AzSubscription

# Select a subscription
Set-AzContext -SubscriptionId 7ad724aa-2f5b-49a1-a1b5-3f7d6ebe9a6e

# Set appropriate Directory
$dataLakeStorageGen1Name = "msrww-adhoc-c09"
$myrootdir = "/"

$files = get-azdatalakestorechilditem -AccountName $dataLakeStorageGen1Name -Path $myrootdir\local\teams\Keytruda\missing_dates

$bigList = $files.path

$counter = [pscustomobject] @{ Value = 0 }
$groupSize = 10
    
$groups = $bigList | Group-Object -Property { [math]::Floor($counter.Value++ / $groupSize) }

foreach ($group in $groups){
    Join-AzDataLakeStoreItem -AccountName $dataLakeStorageGen1Name `
    -Paths $group.Group -Destination "/local/teams/Keytruda/missing_dates/CombinedFiles_$($group.Name).tsv"

}

