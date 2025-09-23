[![Development](https://github.com/moosetechnology/Moose/actions/workflows/test-and-release.yml/badge.svg)](https://github.com/moosetechnology/Moose/actions/workflows/test-and-release.yml)
[![Stable](https://github.com/moosetechnology/Moose/actions/workflows/release.yml/badge.svg)](https://github.com/moosetechnology/Moose/actions/workflows/release.yml)

Moose is an extensive platform for software and data analysis.

Moose is an open-source software. It was started at the Software Composition Group of the University of Bern in 1996 and is currently contributed to and used by several partners. It provides a variety of services such as importing and parsing data, modeling, measuring, querying, mining, and building interactive and visual analysis tools.

## Documentation

Please refer to the [moose wiki](https://modularmoose.org/beginners/install-moose/) for the documentation.

## Installation

### Get a built Moose Image from [Pharo launcher](https://github.com/pharo-project/pharo-launcher)

![Download Moose gif](ressources/Moose-launcher.gif)

### Load Moose in a Pharo image

#### Latest version: Moose 12

Execute this in a Pharo 12 or 13 image:

```smalltalk
Metacello new
    baseline: 'Moose';
    repository: 'github://moosetechnology/Moose:development/src';
    onWarningLog;
    load
```

#### Stable version: Moose 11

Execute this in a Pharo 11 or 12 image:
```smalltalk
[ Metacello new
    baseline: 'Moose';
    repository: 'github://moosetechnology/Moose:v11.x.x/src';
    load ]
    on: MCMergeOrLoadWarning
    do: [ :warning | warning load ]
```

#### Old stable version: Moose 10

Execute this in a Pharo 10 image:

```smalltalk
[ Metacello new
    baseline: 'Moose';
    repository: 'github://moosetechnology/Moose:v10.x.x/src';
    load ]
    on: MCMergeOrLoadWarning
    do: [ :warning | warning load ]
```

### Famix generators
- Java [VerveineJ](https://modularmoose.org/developers/parsers/verveinej/) / [JDT2Famix](https://github.com/feenkcom/jdt2famix) 
- [C#](https://github.com/feenkcom/roslyn2famix) 
- [.NET](http://www.sharpmetrics.net/index.php/famix-generator)
- [SAP](https://github.com/RainerWinkler/Moose-FAMIX-SAP-Extractor)
- [Fortran](https://github.com/NicolasAnquetil/VerveineF.git)
- [C/C++](https://modularmoose.org/developers/parsers/verveinec-cpp/)
