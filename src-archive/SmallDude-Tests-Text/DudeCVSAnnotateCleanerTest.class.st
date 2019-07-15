Class {
	#name : #DudeCVSAnnotateCleanerTest,
	#superclass : #TestCase,
	#category : #'SmallDude-Tests-Text'
}

{ #category : #testing }
DudeCVSAnnotateCleanerTest >> expectedFailures [
	^ #(testParseAnnoFromEmpty testParseAnnoFromNormal)
]

{ #category : #testing }
DudeCVSAnnotateCleanerTest >> testAnnoExtractionFromBad [ 
	 
	
]

{ #category : #testing }
DudeCVSAnnotateCleanerTest >> testAnnoExtractionFromEmpty [
	| cleaner code |
	code := OrderedCollection new.
	code add: ''.
	cleaner := DudeCVSAnnotateCleaner new.
	code := cleaner clean: code.
	self assert: (cleaner lineAnnotations at: 1) equals: ''.
	self assert: cleaner lineAnnotations size equals: 1
]

{ #category : #testing }
DudeCVSAnnotateCleanerTest >> testAnnoExtractionFromNormal [
	| code cleaner |
	code := OrderedCollection new.
	code add: '1.27         (conor    17-Jul-01):     public void setThreadContextLoader() {'.
	code add: '1.27         (conor    17-Jul-01):         if (isContextLoaderSaved) {'.
	code
		add: '1.27         (conor    17-Jul-01):             throw new BuildException("Context loader has not been reset");'.
	code add: '1.27         (conor    17-Jul-01):         }'.
	code add: '1.45         (conor    11-Mar-02):         if (LoaderUtils.isContextLoaderAvailable()) {'.
	code add: '1.45         (conor    11-Mar-02):             savedContextLoader = LoaderUtils.getContextClassLoader();'.
	code add: '1.46         (conor    12-Mar-02):             ClassLoader loader = this;'.
	code add: '1.64         (conor    24-Jan-03):             if (project != null'.
	code
		add:
			'1.53         (umagesh  01-Jun-02):                 && "only".equals(project.getProperty("build.sysclasspath"))) {'.
	code add: '1.46         (conor    12-Mar-02):                 loader = this.getClass().getClassLoader();'.
	code add: '1.46         (conor    12-Mar-02):             }'.
	code add: '1.46         (conor    12-Mar-02):             LoaderUtils.setContextClassLoader(loader);'.
	code add: '1.45         (conor    11-Mar-02):             isContextLoaderSaved = true;'.
	code add: '1.27         (conor    17-Jul-01):         }'.
	code add: '1.27         (conor    17-Jul-01):     }'.
	cleaner := DudeCVSAnnotateCleaner new.
	code := cleaner clean: code.
	self assert: (cleaner lineAnnotations at: 1) equals: '1.27         (conor    17-Jul-01)'.
	self assert: (cleaner lineAnnotations at: 2) equals: '1.27         (conor    17-Jul-01)'.
	self assert: (cleaner lineAnnotations at: 6) equals: '1.45         (conor    11-Mar-02)'.
	self assert: (cleaner lineAnnotations at: 9) equals: '1.53         (umagesh  01-Jun-02)'.
	self assert: (cleaner lineAnnotations at: 14) equals: '1.27         (conor    17-Jul-01)'.
	self assert: (cleaner lineAnnotations at: 15) equals: '1.27         (conor    17-Jul-01)'.
	self assert: cleaner lineAnnotations size equals: 15
]

{ #category : #testing }
DudeCVSAnnotateCleanerTest >> testParseAnnoFromEmpty [
	| cleaner code |
	code := OrderedCollection new.
	code add: ''.
	cleaner := DudeCVSAnnotateCleaner new.
	code := (cleaner clean: code) collect: [ :aLine | DudeSourceCodeLine newText: aLine inEntity: nil ].
	cleaner storeCVSInfoTo: code fromModel: DudeDummyModel new.
	self assert: (code at: 1) modifyingAuthor equals: ''.
	self assert: (code at: 1) modifyedVersion equals: '0.0'.
	self assert: (code at: 1) modificationDate equals: Date today
]

{ #category : #testing }
DudeCVSAnnotateCleanerTest >> testParseAnnoFromNormal [
	| code cleaner |
	code := OrderedCollection new.
	code add: '1.27         (conor    17-Jul-01):     public void setThreadContextLoader() {'.
	code add: '1.27         (conor    17-Jul-01):         if (isContextLoaderSaved) {'.
	code
		add: '1.27         (conor    17-Jul-01):             throw new BuildException("Context loader has not been reset");'.
	code add: '1.27         (conor    17-Jul-01):         }'.
	code add: '1.45         (conor    11-Mar-02):         if (LoaderUtils.isContextLoaderAvailable()) {'.
	code add: '1.45         (conor    11-Mar-92):             savedContextLoader = LoaderUtils.getContextClassLoader();'.
	code add: '1.46         (conor    12-Mar-02):             ClassLoader loader = this;'.
	code add: '1.64         (conor    24-Jan-03):             if (project != null'.
	code
		add:
			'1.53         (umagesh  01-Jun-02):                 && "only".equals(project.getProperty("build.sysclasspath"))) {'.
	code add: '1.46         (conor    12-Mar-02):                 loader = this.getClass().getClassLoader();'.
	code add: '1.46         (conor    12-Mar-02):             }'.
	code add: '1.46         (conor    12-Mar-02):             LoaderUtils.setContextClassLoader(loader);'.
	code add: '1.45         (conor    11-Mar-02):             isContextLoaderSaved = true;'.
	code add: '1.27         (conor    17-Jul-01):         }'.
	code add: '1.27         (conor    17-Jul-01):     }'.
	cleaner := DudeCVSAnnotateCleaner new.
	code := (cleaner clean: code) collect: [ :aLine | DudeSourceCodeLine newText: aLine ].
	cleaner storeCVSInfoTo: code fromModel: MooseModel new.
	self assert: (code at: 1) modifyingAuthor mooseName equals: 'conor'.
	self assert: (code at: 9) modifyingAuthor mooseName equals: 'umagesh'.
	self assert: (code at: 6) modifyedVersion equals: '1.45'.
	self assert: (code at: 15) modifyedVersion equals: '1.27'.
	self assert: (code at: 2) modificationDate equals: (Date newDay: 17 month: 'Jul' year: 2001).
	self assert: (code at: 6) modificationDate equals: (Date newDay: 11 month: 'Mar' year: 1992)
]

{ #category : #testing }
DudeCVSAnnotateCleanerTest >> testTextExtractionFromEmpty [
	| cleaner code |
	code := OrderedCollection new.
	code add: ''.
	cleaner := DudeCVSAnnotateCleaner new.
	code := cleaner clean: code.
	self assert: (code at: 1) equals: ''.
	self assert: code size equals: 1
]

{ #category : #testing }
DudeCVSAnnotateCleanerTest >> testTextExtractionFromNormal [
	| code cleaner |
	code := OrderedCollection new.
	code add: '1.27         (conor    17-Jul-01):     public void setThreadContextLoader() {'.
	code add: '1.27         (conor    17-Jul-01):         if (isContextLoaderSaved) {'.
	code
		add: '1.27         (conor    17-Jul-01):             throw new BuildException("Context loader has not been reset");'.
	code add: '1.27         (conor    17-Jul-01):         }'.
	code add: '1.45         (conor    11-Mar-02):         if (LoaderUtils.isContextLoaderAvailable()) {'.
	code add: '1.45         (conor    11-Mar-02):             savedContextLoader = LoaderUtils.getContextClassLoader();'.
	code add: '1.46         (conor    12-Mar-02):             ClassLoader loader = this;'.
	code add: '1.64         (conor    24-Jan-03):             if (project != null'.
	code
		add:
			'1.53         (umagesh  01-Jun-02):                 && "only".equals(project.getProperty("build.sysclasspath"))) {'.
	code add: '1.46         (conor    12-Mar-02):                 loader = this.getClass().getClassLoader();'.
	code add: '1.46         (conor    12-Mar-02):             }'.
	code add: '1.46         (conor    12-Mar-02):             LoaderUtils.setContextClassLoader(loader);'.
	code add: '1.45         (conor    11-Mar-02):             isContextLoaderSaved = true;'.
	code add: '1.27         (conor    17-Jul-01):         }'.
	code add: '1.27         (conor    17-Jul-01):     }'.
	cleaner := DudeCVSAnnotateCleaner new.
	code := cleaner clean: code.
	self assert: (code at: 1) equals: '    public void setThreadContextLoader() {'.
	self assert: (code at: 2) equals: '        if (isContextLoaderSaved) {'.
	self assert: (code at: 6) equals: '            savedContextLoader = LoaderUtils.getContextClassLoader();'.
	self assert: (code at: 9) equals: '                && "only".equals(project.getProperty("build.sysclasspath"))) {'.
	self assert: (code at: 14) equals: '        }'.
	self assert: (code at: 15) equals: '    }'.
	self assert: code size equals: 15
]
