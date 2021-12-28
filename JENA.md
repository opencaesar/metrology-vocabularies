# Apache Jena

## Starting the server

```
.\fuseki-server --set "tdb:unionDefaultGraph=true"
```

## Create a dataset

```
.\create-dataset.ps1 -dbName metrology-vocabularies -dbType tdb2
```

## Load data

```
.\gradlew.bat owlLoadIso80000
```
