# Connect to your Azure Account
Connect-AzAccount

# Uncomment to get a List all the subscriptions associated to your account
# Get-AzSubscription

# Select a subscription
Set-AzContext -SubscriptionId 7ad724aa-2f5b-49a1-a1b5-3f7d6ebe9a6e

$date_table = Import-Csv -Path C:\Users\v-kirdwivedi\Documents\GitHub\KEYTRUDA\Data\Dates5.csv

foreach ($i in $date_table) 
    {
        # submit job
        Write-Host $i.0
        $params = @{ FromDate = $i.0; ToDate = $i.0; }
        $job = Submit-CosmosScopeJob -ScriptPath C:\Users\v-kirdwivedi\GitHub\Medical_Journeys\Vaccine\SLAPI_Scripts\pharma_words.script -VC vc://cosmos09/MSRWW.adhoc -Parameters $params
    }