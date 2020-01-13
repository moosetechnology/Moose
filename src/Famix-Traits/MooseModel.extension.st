Extension { #name : #MooseModel }

{ #category : #'*Famix-Traits' }
MooseModel >> allModelEntities [
	<navigation: 'All model entities'>
	^ self
		lookUpPropertyNamed: #allModelEntities
		computedAs: [ self entities reject: #isStub ]
]

{ #category : #'*Famix-Traits' }
MooseModel >> allSourceLanguages [

	^ self allUsing: FamixTSourceLanguage.

]

{ #category : #'*Famix-Traits' }
MooseModel >> averageCyclomaticComplexity [
	<FMProperty: #averageCyclomaticComplexity type: #Number>
	<derived>
	<FMComment: 'The average cyclomatic complexity for methods'>
	^ self lookUpPropertyNamed: #averageCyclomaticComplexity computedAs: [ (self allMethods collect: #cyclomaticComplexity) ifEmpty: [ 1 ] ifNotEmpty: #average ]
]

{ #category : #'*Famix-Traits' }
MooseModel >> numberOfClassesPerPackage [
	<FMProperty: #numberOfClassesPerPackage type: #Number>
	<FMComment: 'The number of methods per package in the model'>
	^ self
		lookUpPropertyNamed: #numberOfClassesPerPackage
		computedAs: [ self numberOfMethods / self numberOfClasses ]
]

{ #category : #'*Famix-Traits' }
MooseModel >> numberOfLinesOfCodePerMethod [
	<FMProperty: #numberOfLinesOfCodePerMethod type: #Number>
	<FMComment: 'The number of lines of code per method in the model'>
	^ self
		lookUpPropertyNamed: #numberOfLinesOfCodePerMethod
		computedAs: [ self numberOfLinesOfCode / self numberOfMethods ]
]

{ #category : #'*Famix-Traits' }
MooseModel >> numberOfLinesOfCodePerPackage [
	<FMProperty: #numberOfLinesOfCodePerPackage type: #Number>
	<FMComment: 'The number of lines of code per package in the model'>
	^ self
		lookUpPropertyNamed: #numberOfLinesOfCodePerPackage
		computedAs: [ self numberOfLinesOfCode / self numberOfPackages ]
]

{ #category : #'*Famix-Traits' }
MooseModel >> numberOfMethods [
	<FMProperty: #numberOfMethods type: #Number>
	<FMComment: 'The number of methods'>
	
	^self
		lookUpPropertyNamed: #numberOfMethods
		computedAs: [ self allMethods size ]
]

{ #category : #'*Famix-Traits' }
MooseModel >> numberOfMethodsPerPackage [
	<FMProperty: #numberOfClassesPerPackage type: #Number>
	<FMComment: 'The number of methods per package in the model'>
	^ self
		lookUpPropertyNamed: #numberOfMethodsPerPackage
		computedAs: [ self numberOfMethods / self numberOfPackages ]
]

{ #category : #'*Famix-Traits' }
MooseModel >> numberOfModelClasses [
	<FMProperty: #numberOfModelClasses type: #Number>
	<FMComment: 'The number of classes in the model'>
	
	^self
		lookUpPropertyNamed: #numberOfModelClasses
		computedAs: [ self allModelClasses size ]
]

{ #category : #'*Famix-Traits' }
MooseModel >> numberOfModelMethods [
	<FMProperty: #numberOfModelMethods type: #Number>
	<FMComment: 'The number of methods in the model'>
	
	^self
		lookUpPropertyNamed: #numberOfModelMethods
		computedAs: [ self allModelMethods size ]
]

{ #category : #'*Famix-Traits' }
MooseModel >> sourceLanguage [
	<FMProperty: #sourceLanguage type: #FamixTSourceLanguage>
	<FMComment: 'Source of the Language to which the model corresponds'>
	^ self privateState
		propertyAt: #sourceLanguage
		ifAbsentPut: [ self allSourceLanguages detect: [ :each | each isAttached not ] ifNone: [ nil ] ]
]

{ #category : #'*Famix-Traits' }
MooseModel >> sourceLanguage: aSymbol [
	self privateState propertyAt: #sourceLanguage put: aSymbol
]
