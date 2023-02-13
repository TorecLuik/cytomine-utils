# Cytomine Utils


## About <a name = "about"></a>

Utility scripts for Cytomine project.

## Usage <a name = "usage"></a>

### _Powershell Rename_
Run the ps1 script in Windows PowerShell to rename image mask files to a _\_lbl_ suffix.
Or any other suffix you want.

Use `. help <script-name.ps1> -Full` for more info.

Basic usage:
```
PS F:\workspace\test> ls


    Directory: F:\workspace\test


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----        13-02-2023     12:08              2 a.txt
-a----        13-02-2023     12:08              2 b.txt
-a----        13-02-2023     12:09              2 c.png
```

```
PS F:\workspace\test> . 'F:\workspace\cytomine-utils\powershell-rename.ps1' -folder .\
Filter extension, e.g. *.png , or use * process all files in .\: *
Congratulations! Executed successfully: .\ , _lbl added


    Directory: F:\workspace\test


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----        13-02-2023     12:08              2 a_lbl.txt
-a----        13-02-2023     12:08              2 b_lbl.txt
-a----        13-02-2023     12:09              2 c_lbl.png
```
You can undo your command with the `-undo` flag if you want.

```
PS F:\workspace\test> . 'F:\workspace\cytomine-utils\powershell-rename.ps1' -folder .\ -undo
Filter extension, e.g. *.png , or use * process all files in .\: *
Congratulations! Executed successfully: .\ , _lbl removed


    Directory: F:\workspace\test


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----        13-02-2023     12:08              2 a.txt
-a----        13-02-2023     12:08              2 b.txt
-a----        13-02-2023     12:09              2 c.png
```