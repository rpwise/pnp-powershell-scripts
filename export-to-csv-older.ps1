# create array for export
$arrayVariable = @()

# create object for instance(s)
$customObject = New-Object -TypeName psobject
		$csvSite | Add-Member -MemberType NoteProperty -name 'Property1' -value $value1
		$csvSite | Add-Member -MemberType NoteProperty -name 'Property2' -value $value2
		$csvSite | Add-Member -MemberType NoteProperty -name 'Property3' -value $value3

# add instance to array
$arrayVariable += $customObject

# export array to csv
$arrayVariable | Export-Csv -NoTypeInformation -Encoding UTF8 -Path "C:\export.csv"