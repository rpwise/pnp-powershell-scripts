# connect to tenant
connect-pnponline https://tenantname.sharepoint.com

# get content older than a certan date
$retentionDate = (get-date).AddDays(-4748).ToShortDateString();

# execute search query
$query = "LastModifiedTimeForRetention<" + $retentionDate;

# execute search query (paginated)
$results = submit-pnpsearchquery $query;

# execute search query (all)
#$results = submit-pnpsearchquery $query -all;

foreach ($result in $results.resultrows) {

    # do stuff here
    
}