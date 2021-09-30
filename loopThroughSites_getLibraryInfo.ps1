
# variables
$libraries = @()

# get credentials
$creds = get-credential "user@domain.com"

# connect
connect-pnponline https://tenant.sharepoint.com -useweblogin

$sites = Get-PnPTenantSite
#$10sites = $sites | Select-Object -First 10

disconnect-pnponline

foreach ($site in $sites){
	
	try{
		
		write-host "connecting to " $site.url 
		#write-host $site.Title
		connect-pnponline $site.url -credentials $creds
		write-host "connected"
		
		$docLibs = Get-PnPList | Where-Object {$_.BaseTemplate -eq 101 -and $_.Hidden -eq $false} #Or $_.BaseType -eq "DocumentLibrary"
		
		foreach ($docLib in $docLibs){
		
			
			write-host $docLib.Title
			
			#build ps object
			$library = New-Object -TypeName psobject
			$library | Add-Member -MemberType NoteProperty -name 'SiteURL' -value $site.url
			$library | Add-Member -MemberType NoteProperty -name 'SiteTitle' -value $site.Title
			$library | Add-Member -MemberType NoteProperty -name 'LibraryName' -value $docLib.Title
			$library | Add-Member -MemberType NoteProperty -name 'ItemCount' -value $docLib.ItemCount
			$library | Add-Member -MemberType NoteProperty -name 'ForceCheckoutStatus' -value $docLib.ForceCheckout
			$library | Add-Member -MemberType NoteProperty -name 'MajorVersionLimit' -value $docLib.MajorVersionLimit
			
			# add folder to collection
			$libraries += $library;
		
		}
	}
	catch {

        write-host $_
		
		$library = New-Object -TypeName psobject
		$library | Add-Member -MemberType NoteProperty -name 'SiteURL' -value $site.url
		
		# add folder to collection
		$libraries += $library;
		
	}
	finally {
		write-host "disconnecting..."
		disconnect-pnponline
		write-host "disconnected"
	}

}

$libraries | Export-Csv -notype -Path "C:\SharePoint\Document Library Retention Settings.csv"
