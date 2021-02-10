# note: these commands assume existing connection

# update person field
Set-PnPListItem -List $listName -Identity $listItem -Values @{"PersonFieldName" = "employee@contoso.com" }



# update multi person field
# create an array
$multipleEmployees = @()
$multipleEmployees += "employee1@contoso.com"
$multipleEmployees += "employee2@contoso.com"
$multipleEmployees += "employee3@contoso.com"

# update
Set-PnPListItem -List $sowConfigListName -Identity $configItem -Values @{"MultiplePersonFieldName" = $multipleEmployees }