
[![development](https://github.com/moosetechnology/Moose/actions/workflows/continuous.yml/badge.svg)](https://github.com/moosetechnology/Moose/actions/workflows/continuous.yml)
[![v8](https://github.com/moosetechnology/Moose/actions/workflows/continuous-v8.yml/badge.svg)](https://github.com/moosetechnology/Moose/actions/workflows/continuous-v8.yml)

Moose is an extensive platform for software and data analysis.

Moose is an open source software. It was started at the Software Composition Group from the University of Bern in 1996 and is currently contributed to and used by multiple partners. It offers multiple services ranging from importing and parsing data, to modeling, to measuring, querying, mining, and to building interactive and visual analysis tools.

## Documentation

Please refer to the [moose wiki](https://moosetechnology.github.io/moose-wiki/) for the documentation.

## Installation

### Get a built Moose Image from [Pharo launcher](https://github.com/pharo-project/pharo-launcher)

![Download Moose gif](ressources/Moose-launcher.gif)

### Load Moose in a Pharo image

#### Latest version: Moose 10

Execute this in a Pharo 10 image:

```smalltalk
Metacello new
    baseline: 'Moose';
    repository: 'github://moosetechnology/Moose:development/src';
    onWarningLog;
    load
```

#### Stable version: Moose 9

Execute this in a Pharo 9 image:
```smalltalk
[ Metacello new
    baseline: 'Moose';
    repository: 'github://moosetechnology/Moose:v9.x.x/src';
    load ]
    on: MCMergeOrLoadWarning
    do: [ :warning | warning load ]
```

#### Old stable version: Moose 8

Execute this in a Pharo 8 image:

```smalltalk
Metacello new
  baseline: 'Moose';
  repository: 'github://moosetechnology/Moose:v8.x.x/src';
  load.
```

### Famix generators
- Java [VerveineJ](https://modularmoose.org/moose-wiki/Developers/Parsers/VerveineJ) / [JDT2Famix](https://github.com/feenkcom/jdt2famix) 
- [C#](https://github.com/feenkcom/roslyn2famix) 
- [.NET](http://www.sharpmetrics.net/index.php/famix-generator)
- [SAP](https://github.com/RainerWinkler/Moose-FAMIX-SAP-Extractor)
- [Fortran](https://github.com/NicolasAnquetil/VerveineF.git)
- [C/C++](https://github.com/Synectique/VerveineC-Cpp.git)
