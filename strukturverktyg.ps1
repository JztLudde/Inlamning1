# strukturverktyg.ps1
# Detta program skapar en mappstruktur och loggar när den skapades.

# Skapar en funktion som gör allt arbete
function Skapa-Struktur {
    param ([string]$namn)  # Tar emot ett namn från användaren

    $datum = Get-Date -Format "yyyy-MM-dd"  # Hämtar dagens datum
    $tid = Get-Date -Format "yyyy-MM-dd HH:mm:ss"  # Hämtar tid med datum
    $huvudmapp = "./$namn"  # Sätter sökvägen för huvudmappen

    try {
        # Skapar huvudmappen (stoppar om den redan finns)
        New-Item "$huvudmapp" -ItemType Directory -ErrorAction Stop

        # Skapar undermapparna
        New-Item "$huvudmapp/logs" -ItemType Directory
        New-Item "$huvudmapp/scripts" -ItemType Directory
        New-Item "$huvudmapp/temp" -ItemType Directory

        # Skapar loggfil med dagens datum i namnet
        $loggfil = "$huvudmapp/logs/log-$datum.txt"

        # Skriver en rad i loggfilen med datum och tid
        Add-Content $loggfil "Struktur skapad: $tid"

        # Skriver ut att det är klart
        Write-Host "Klar."
    }
    catch {
        # Visar felmeddelande om något går fel
        Write-Host "Fel: $_"
    }
}

# Frågar användaren efter ett namn på mappen
$namn = Read-Host "Ange namn"

# Kör funktionen och skickar in användarens namn
Skapa-Struktur $namn
