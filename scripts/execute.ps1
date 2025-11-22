#!/usr/bin/env pwsh

param (
     [Parameter(Mandatory = $true)]
     [System.String] $File
)

if (-not (Test-Path -Path (Join-Path $PWD build\hasher.exe))) {
    Write-Host "[ERROR] " -NoNewline -ForegroundColor Red ;
    Write-Host "There is no compiled program to execute." ;
    exit 1 ;
}

function Execute {
    [CmdletBinding()]
    [OutputType([System.Void])]
    param ()

    & (Join-Path $PWD build\hasher.exe) $File ;
}

Execute ;
