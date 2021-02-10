# connecto to pnp site
connect-pnponline https://tenantname.sharepoint.com

# get all site collections in tenant
$sites = get-pnptenantsite

# loop through first 10 sites in collection
foreach ($site in ($sites | Select-Object -First 10)){
    
    # TODO

}