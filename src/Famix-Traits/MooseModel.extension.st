Extension { #name : #MooseModel }

{ #category : #'*Famix-Traits' }
MooseModel >> allModelEntities [
	<navigation: 'All model entities'>

	^ self wantsAllEntitiesNavigation 
		ifTrue: [ self entityStorage elements ]
		ifFalse: [ nil ] "will be hidden by default"
]

{ #category : #'*Famix-Traits' }
MooseModel >> allSourceLanguages [

	^ self allUsing: FamixTSourceLanguage.

]

{ #category : #'*Famix-Traits' }
MooseModel >> averageCyclomaticComplexity [
	<MSEProperty: #averageCyclomaticComplexity type: #Number>
	<derived>
	<MSEComment: 'The average cyclomatic complexity for methods'>
	^ self lookUpPropertyNamed: #averageCyclomaticComplexity computedAs: [ (self allMethods collect: #cyclomaticComplexity) ifEmpty: [ 1 ] ifNotEmpty: #average ]
]

{ #category : #'*Famix-Traits' }
MooseModel >> numberOfClassesPerPackage [
	<MSEProperty: #numberOfClassesPerPackage type: #Number>
	<MSEComment: 'The number of methods per package in the model'>
	^ self
		lookUpPropertyNamed: #numberOfClassesPerPackage
		computedAs: [ self numberOfMethods / self numberOfClasses ]
]

{ #category : #'*Famix-Traits' }
MooseModel >> numberOfLinesOfCodePerMethod [
	<MSEProperty: #numberOfLinesOfCodePerMethod type: #Number>
	<MSEComment: 'The number of lines of code per method in the model'>
	^ self
		lookUpPropertyNamed: #numberOfLinesOfCodePerMethod
		computedAs: [ self numberOfLinesOfCode / self numberOfMethods ]
]

{ #category : #'*Famix-Traits' }
MooseModel >> numberOfLinesOfCodePerPackage [
	<MSEProperty: #numberOfLinesOfCodePerPackage type: #Number>
	<MSEComment: 'The number of lines of code per package in the model'>
	^ self
		lookUpPropertyNamed: #numberOfLinesOfCodePerPackage
		computedAs: [ self numberOfLinesOfCode / self numberOfPackages ]
]

{ #category : #'*Famix-Traits' }
MooseModel >> numberOfMethods [
	<MSEProperty: #numberOfMethods type: #Number>
	<MSEComment: 'The number of methods'>
	
	^self
		lookUpPropertyNamed: #numberOfMethods
		computedAs: [ self allMethods size ]
]

{ #category : #'*Famix-Traits' }
MooseModel >> numberOfMethodsPerPackage [
	<MSEProperty: #numberOfClassesPerPackage type: #Number>
	<MSEComment: 'The number of methods per package in the model'>
	^ self
		lookUpPropertyNamed: #numberOfMethodsPerPackage
		computedAs: [ self numberOfMethods / self numberOfPackages ]
]

{ #category : #'*Famix-Traits' }
MooseModel >> numberOfModelClasses [
	<MSEProperty: #numberOfModelClasses type: #Number>
	<MSEComment: 'The number of classes in the model'>
	
	^self
		lookUpPropertyNamed: #numberOfModelClasses
		computedAs: [ self allModelClasses size ]
]

{ #category : #'*Famix-Traits' }
MooseModel >> numberOfModelMethods [
	<MSEProperty: #numberOfModelMethods type: #Number>
	<MSEComment: 'The number of methods in the model'>
	
	^self
		lookUpPropertyNamed: #numberOfModelMethods
		computedAs: [ self allModelMethods size ]
]
