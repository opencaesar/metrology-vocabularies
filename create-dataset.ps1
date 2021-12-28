#!/usr/bin/env pwsh
<#
  .Synopsis
  Creates a dataset on a running Jena Fuseki server

  .Parameter server
  The Jena Fuseki server

  .Parameter dataset
  The dataset assembler specification

  .Parameter dbName
  The dataset name

  .Parameter dbType
  The dataset type
#>

# https://jena.apache.org/documentation/fuseki2/fuseki-server-protocol.html#datasets-and-services

Param(
    [string] $server = "http://localhost:3030", `
    [string] $dataset = $PSScriptRoot + "./src/jena/dataset.ttl", `
    [string] $dbName, `
    [string] $dbType
)


Write-Host "server=$server"
$body = [io.file]::ReadAllText($dataset)

$uri = "$server/$/datasets?dbName=$dbName&dbType=$dbType"
Write-Host "uri=$uri"

Invoke-WebRequest `
    -Uri $uri `
    -Method Post `
    -Body $body
