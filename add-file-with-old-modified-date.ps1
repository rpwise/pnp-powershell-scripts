# connect to SharePoint site collection
connect-pnponline https://tenantname.sharepoint.com

# add file setting the modified date
# path - local document
# folder - document library
add-pnpfile -path .\file_name.docx -folder "Shared Documents" -Values @{Modified="01/01/2021"}