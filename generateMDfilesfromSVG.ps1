# Get all SVG drawings
$drawings = Get-ChildItem -Recurse -Filter *.drawio.svg

foreach ($file in $drawings) {
    # Define the name for the new Markdown file (e.g., my-diagram.md)
    $mdPath = $file.FullName -replace '\.drawio\.svg$', '.md'
    
    # Create the content for the Markdown file
    $content = @"
# $($file.BaseName)

**Location:** $($file.FullName.Replace('C:\repos\architecture-visual-assets\', ''))
**Last Updated:** $($file.LastWriteTime)

![Diagram](./$($file.Name))

---
### Description
Add notes here about what this architecture represents.
"@

    # Save the file only if it doesn't already exist
    if (!(Test-Path $mdPath)) {
        $content | Out-File -FilePath $mdPath -Encoding utf8
    }
}