# create array for export
$arrayVariable = @()

# create object for instance(s)
$customObject = [PSCustomObject]@{
'Property1' = $value1
'Property2' = $value2
'Property3' = $value3
}

# add instance to array
$arrayVariable += $customObject

# export array to csv
$arrayVariable | Export-Csv -NoTypeInformation -Encoding UTF8 -Path "C:\export.csv"