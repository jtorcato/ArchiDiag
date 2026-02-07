$rootPath = Get-Location
$sidebarFile = Join-Path $rootPath "_sidebar.md"
$mediaFolder = "media"
$mediaCatalogFile = Join-Path $rootPath "media_catalog.md"

# 1. Create MD Bridge Files for Search
$drawings = Get-ChildItem -Recurse -Filter *.drawio.svg
foreach ($file in $drawings) {
    $mdPath = $file.FullName -replace '\.drawio\.svg$', '.md'
    if (!(Test-Path $mdPath)) {
        $content = "# $($file.BaseName)`n`n![Diagram](./$($file.Name))`n`n---`n**Path:** $($file.FullName.Replace($rootPath.Path, ''))"
        $content | Out-File -FilePath $mdPath -Encoding utf8
    }
}

# 2. NEW: Generate Media Icon Grid
if (Test-Path (Join-Path $rootPath $mediaFolder)) {
    $mediaContent = "# 🎨 Media Icon Library`n`n"
    $mediaContent += "This is a grid of all icons and assets stored in the /$mediaFolder folder.`n`n"
    $mediaContent += "<div style='display: flex; flex-wrap: wrap; gap: 10px;'>`n"

    # Find images including subfolders in media
    $icons = Get-ChildItem -Path (Join-Path $rootPath $mediaFolder) -Recurse -Include *.png, *.jpg, *.webp, *.svg | Where-Object { $_.Name -notlike "*.drawio.svg" }

    foreach ($icon in $icons) {
        # Create relative path for the web
        $relPath = $icon.FullName.Replace($rootPath.Path, "").Replace("\", "/").TrimStart("/")
        $mediaContent += "  <div style='text-align: center; width: 100px; border: 1px solid #eee; padding: 5px;'>`n"
        $mediaContent += "    <img src='$relPath' width='50' height='50' style='object-fit: contain;' title='$($icon.Name)'><br>`n"
        $mediaContent += "    <small style='font-size: 10px; display: block; overflow: hidden; text-overflow: ellipsis;'>$($icon.Name)</small>`n"
        $mediaContent += "  </div>`n"
    }
    $mediaContent += "</div>"
    $mediaContent | Out-File -FilePath $mediaCatalogFile -Encoding utf8
}

# 3. Rebuild Sidebar
$sidebarContent = "* [🏠 Home](README.md)`n"

# Add the Media Link at the top or bottom
if (Test-Path $mediaCatalogFile) {
    $sidebarContent += "* [🎨 Media Library](media_catalog.md)`n"
}

$dirs = Get-ChildItem -Path $rootPath -Directory | Where-Object { $_.Name -notlike ".*" -and $_.Name -ne "media" -and $_.Name -ne "media2" }

foreach ($dir in $dirs) {
    $sidebarContent += "* **$($dir.Name.ToUpper())**`n"
    $mdFiles = Get-ChildItem -Path $dir.FullName -Filter *.md
    foreach ($file in $mdFiles) {
        $relativePath = "$($dir.Name)/$($file.Name)"
        $displayName = $file.BaseName -replace '-', ' ' -replace '_', ' '
        $sidebarContent += "  * [$displayName]($relativePath)`n"
    }
}

$sidebarContent | Out-File -FilePath $sidebarFile -Encoding utf8
Write-Host "Success! Catalog, Sidebar, and Media Grid updated." -ForegroundColor Green