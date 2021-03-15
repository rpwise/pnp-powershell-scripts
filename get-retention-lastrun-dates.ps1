# connect to SharePoint site collection
connect-pnponline https://tenantname.sharepoint.com

# get property bag date stamp for when Retention Policy last executed
get-pnppropertybag -key "dlc_expirationlastrunv2"

# get property bag value for when Retention policy was last evaluated on content
get-pnppropertybag -key "dlc_policyupdatelastrun"