# =================================================================================
# Somos TSS CO. | TESSA
# Tecnossystem Smart Setup Assistant
#
# Módulo: ConfigManager
# Versión: 1.0.0
# =================================================================================

Set-StrictMode -Version Latest

#region Variables Globales

$Script:TessaRoot = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent

$Script:PerfilActivo = "SIC"

$Script:ConfigPath = Join-Path `
    $TessaRoot `
    "Perfiles\$PerfilActivo\Configuracion"

#endregion

#region Funciones

function Get-TessaRoot {
    <#
        Obtiene la ruta raíz de TESSA.
    #>

    return $Script:TessaRoot
}

function Get-TessaProfile {
    <#
        Obtiene el perfil activo.
    #>

    return $Script:PerfilActivo
}

function Get-TessaConfigPath {
    <#
        Obtiene la ruta de configuración del perfil activo.
    #>

    return $Script:ConfigPath
}

function Get-TessaConfiguration {
    <#
        Carga un archivo JSON de configuración.

        Ejemplo:
        Get-TessaConfiguration -Name "Aplicaciones"
    #>

    param(
        [Parameter(Mandatory)]
        [string]$Name
    )

    $File = Join-Path `
        $Script:ConfigPath `
        "$Name.json"

    if (-not (Test-Path $File)) {
        throw "No existe el archivo de configuración: $File"
    }

    try {
        return Get-Content $File -Raw |
            ConvertFrom-Json
    }
    catch {
        throw "Error al procesar el archivo $File : $_"
    }
}

function Test-TessaConfiguration {
    <#
        Verifica la existencia de un archivo JSON.
    #>

    param(
        [Parameter(Mandatory)]
        [string]$Name
    )

    $File = Join-Path `
        $Script:ConfigPath `
        "$Name.json"

    return (Test-Path $File)
}

function Get-TessaConfigurationFiles {
    <#
        Lista todos los archivos JSON disponibles
        en el perfil activo.
    #>

    Get-ChildItem `
        -Path $Script:ConfigPath `
        -Filter "*.json" |
    Select-Object Name, FullName
}

#endregion

#region Carga Inicial

try {

    $Global:TESSA = @{
        RootPath   = Get-TessaRoot
        Profile    = Get-TessaProfile
        ConfigPath = Get-TessaConfigPath
    }

}
catch {

    throw "No fue posible inicializar ConfigManager: $_"

}

#endregion