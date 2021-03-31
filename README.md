[![Continuous-development](https://github.com/moosetechnology/Moose/actions/workflows/continuous.yml/badge.svg)](https://github.com/moosetechnology/Moose/actions/workflows/continuous.yml)

Moose is an extensive platform for software and data analysis.

Moose is an open source software. It was started at the Software Composition Group from the University of Bern in 1996 and is currently contributed to and used by multiple partners. It offers multiple services ranging from importing and parsing data, to modeling, to measuring, querying, mining, and to building interactive and visual analysis tools.

## Documentation

Please refer to the [moose wiki](https://moosetechnology.github.io/moose-wiki/) for the documentation.

## Installation

### Get a built Moose Image

![Download Moose gif](https://moosetechnology.github.io/moose-wiki/Beginners/res/downloadMoose.gif)

### How to load

**Moose v7**

```smalltalk
Metacello new
  baseline: 'Moose';
  repository: 'github://moosetechnology/Moose:v7.x.x/src';
  load.
```

**Moose 8 (development)**

```smalltalk
Metacello new
  baseline: 'Moose';
  repository: 'github://moosetechnology/Moose:development/src';
  load.
```

### From Github Release

The previous build comes from our jenkins.
You wan also use the releases of github.


To add this project into the pharo launcher:

1. Download the PharoLauncher
2. Open PharoLauncher
3. Open a playground (Ctrl + O, Ctrl + W)
4. Execute the following piece of code

```Smalltalk
| sources |
sources := {
    PhLTemplateSource new
        type: #HttpListing;
        name: 'Moose';
        url: 'https://github.com/moosetechnology/Moose/releases';
        filterPattern: 'href="([^"]*/Pharo[0-9][^"]*.zip)"';
        templateNameFormat: '{6} ({5})' }.
PhLUserTemplateSources sourcesFile writeStreamDo: [ :s | 
    (STON writer on: s)
        newLine: String lf;
        prettyPrint: true;
        nextPut: sources ]
```

### Famix generators
- [Java](https://github.com/feenkcom/jdt2famix) 
- [C#](https://github.com/feenkcom/roslyn2famix) 
- [.NET](http://www.sharpmetrics.net/index.php/famix-generator)
- [SAP](https://github.com/RainerWinkler/Moose-FAMIX-SAP-Extractor)
- [Fortran](https://github.com/NicolasAnquetil/VerveineF.git)
- [C/C++](https://github.com/Synectique/VerveineC-Cpp.git)
