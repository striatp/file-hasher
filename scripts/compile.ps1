#!/usr/bin/env pwsh

param (
    [Parameter(Mandatory = $false)]
    [System.String] $Source = "./source/main.c",

    [Parameter(Mandatory = $false)]
    [System.String] $Output = "./build/output.exe"
)

if (-not $Source) {
    Write-Host "[ERROR] " -NoNewline -ForegroundColor Red ;
    Write-Host "A source file must be specified for compilation to occur." ;
    exit 1 ;
}

if (-not $Output) {
    Write-Host "[ERROR] " -NoNewline -ForegroundColor Red ;
    Write-Host "An output file must be specified for compilation to occur." ;
    exit 1 ;
}

if (-not (Test-Path -Path $Source)) {
    Write-Host "[ERROR] " -NoNewline -ForegroundColor Red ;
    Write-Host "The specified source file does not exist." ;
    exit 1 ;
}

#if (-not (Test-Path -Path $Output)) {
#    Write-Host "[ERROR] " -NoNewline -ForegroundColor Red ;
#    Write-Host "The specified output file does not exist." ;
#    exit 1 ;
#}

function Compile {
    [CmdletBinding()]
    [OutputType([System.Void])]
    param (
        [Parameter(Mandatory = $true)]
        [string] $Source,

        [Parameter(Mandatory = $true)]
        [string] $Output

    )

    gcc $Source -o $Output ;

    Write-Host "Compiled" ;
}

Compile -Source $Source -Output $Output ;
