#!/usr/bin/env pwsh

param ()

if (-not (Test-Path -Path "source/main.c")) {
    Write-Host "[ERROR] " -NoNewline -ForegroundColor Red ;
    Write-Host "The specified source file does not exist." ;
    exit 1 ;
}

function Compile {
    [CmdletBinding()]
    [OutputType([System.Void])]
    param ()

    if (-not (Test-Path -Path "obj")) {
        New-Item -ItemType Directory -Path "./" -Name "obj" ;
    }

    nasm -f win64 source/crc32_step.asm -o obj/crc32_step.obj ;
    clang source/main.c source/crc32.c obj/crc32_step.obj -o build/hasher.exe ;

    Write-Host "[SUCCESS] " -NoNewline -ForegroundColor Green ;
    Write-Host "Successfully compiled the main.c source file." ;
}

Compile ;
