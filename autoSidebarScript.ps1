$rootPath = "C:\repos\architecture-visual-assets"
$sidebarFile = Join-Path $rootPath "_sidebar.md"

# Start the sidebar with a Home link
$sidebarContent = "* [🏠 Home](README.md)`n"

# Get all directories, excluding hidden ones (like .git)
$dirs = Get-ChildItem -Path $rootPath -Directory | Where-Object { $_.Name -notlike ".*" }

foreach ($dir in $dirs) {
    # Add the folder name as a bold category
    $sidebarContent += "* **$($dir.Name.ToUpper())**`n"
    
    # Get all .md files in this folder
    $mdFiles = Get-ChildItem -Path $dir.FullName -Filter *.md
    foreach ($file in $mdFiles) {
        # Create a relative link for Docsify
        $relativePath = "$($dir.Name)/$($file.Name)"
        $displayName = $file.BaseName -replace '-', ' ' -replace '_', ' '
        $sidebarContent += "  * [$displayName]($relativePath)`n"
    }
}

$sidebarContent | Out-File -FilePath $sidebarFile -Encoding utf8