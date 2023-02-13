<# 

.Synopsis
    Script to add suffixes to filenames.
    Setup for labels in Cytomine format: <image>_lbl<.ext> suffix.

.DESCRIPTION
    This script allows you to rename (all) files in a certain folder by adding or removing a suffix.
    By default it is setup to work for the Cytomine label format, where we want to add '_lbl' to all mask images.
    You can filter with the -extension to only alter one filetype.
    You can undo your operation, or just remove a suffix, with the -undo flag.
    You can change the suffix by providing that parameter, default = _lbl.

.EXAMPLE
    . .\powershell-rename.ps1 -folder .\

    Filter extension, e.g. *.png , or use * process all files in .\: *
    Congratulations! Executed successfully: .\ , _lbl added


        Directory: F:\workspace\test


    Mode                 LastWriteTime         Length Name
    ----                 -------------         ------ ----
    -a----        13-02-2023     12:08              2 a_lbl.txt
    -a----        13-02-2023     12:08              2 b_lbl.txt
    -a----        13-02-2023     12:09              2 c_lbl.png

.EXAMPLE
    . .\powershell-rename.ps1 -folder .\ -suffix _mysuffix -extension *.txt 

    Congratulations! Executed successfully: .\ , _mysuffix added


        Directory: F:\workspace\test


    Mode                 LastWriteTime         Length Name
    ----                 -------------         ------ ----
    -a----        13-02-2023     12:08              2 a_mysuffix.txt
    -a----        13-02-2023     12:08              2 b_mysuffix.txt
    -a----        13-02-2023     12:09              2 c.png

.EXAMPLE
    . .\powershell-rename.ps1 -folder .\ -suffix _mysuffix -extension *.txt -undo

    Congratulations! Executed successfully: .\ , _mysuffix removed


        Directory: F:\workspace\test


    Mode                 LastWriteTime         Length Name
    ----                 -------------         ------ ----
    -a----        13-02-2023     12:08              2 a.txt
    -a----        13-02-2023     12:08              2 b.txt
    -a----        13-02-2023     12:09              2 c.png

.NOTES
    Version:        1.0
    Author:         Torec Luik
    Creation Date:  13 feb 2023
    Modified Date:  
    Purpose/Change: Init
    Link:           https://github.com/TorecLuik/cytomine-utils.git       
#>
param 
(
    # Folder to apply script to, use ./ for current folder
    [Parameter(Mandatory)] $folder, 
    # Suffix to be appended or removed from files in folder
    [string] $suffix="_lbl", 
    # Filter for extensions to apply script to, use * for all files
    $extension, 
    # Flag to reverse this process, i.e. remove this suffix from files in folder
    [switch] $undo
)

if ($null -eq $extension) {
    $extension = read-host -Prompt "Filter extension, e.g. *.png , or use * process all files in $folder" 
}
if ( $undo ) {
    (Get-ChildItem -File $folder -Filter $extension) | Rename-Item -NewName {($_.Name).Replace($suffix,"")}
    Write-Host "Congratulations! Executed successfully: $folder , $suffix removed"
    (Get-ChildItem -File $folder)
} else {
    (Get-ChildItem -File $folder -Filter $extension) | Rename-Item -NewName {$_.BaseName + $suffix + $_.Extension}    
    Write-Host "Congratulations! Executed successfully: $folder , $suffix added"
    (Get-ChildItem -File $folder)
}

