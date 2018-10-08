"
builder := FamixMetamodelBuilder new.
builder 
	prefix: 'FamixTest';
	packageName: 'FamixTest'.

comment := builder newClassNamed: #Comment.
method := builder newClassNamed: #Method.
package := builder newClassNamed: #Package.

(package <>- comment)
	from
	




builder := FamixMetamodelBuilder new.

rel := builder newRelation 
	between: #TAccess and: #TWithAccesses;
	fromOne: #accessor toMany: #accesses.
	
	
rel := builder newRelation 
	between: #TAccess and: #TWithAccesses;
	fromOne: #accessor toMany: #accesses.
	
rel := builder newRelation
	from: [ :side |
		side name: #accessor;
			traitName: #TAccess;
			container;
			comment: 'some comment';
			one	 ];
	to: [ :opposite |
		opposite 	name: #accesses;
			traitName: #TWithAccesses;
			comment: 'ohter comment';
			many ].
		
	



"
Class {
	#name : #FamixMetamodelBuilder,
	#superclass : #Object,
	#instVars : [
		'environment',
		'prefix',
		'packageName',
		'packageNameForAnnotations',
		'classes',
		'traits',
		'relations',
		'classTag',
		'traitTag',
		'basicSuperclassName',
		'basicTraitName',
		'traitsFlattening',
		'generator',
		'generateImportingContext',
		'testingSelectorsMapping'
	],
	#category : #'Famix-MetamodelBuilder-Core-Basic'
}

{ #category : #'instance creation' }
FamixMetamodelBuilder class >> forGenerator: aGenerator [

	^ self new
		generator: aGenerator;
		yourself.
]

{ #category : #visitor }
FamixMetamodelBuilder >> acceptVisitor: aVisitor [

	^ aVisitor visitBuilder: self.
]

{ #category : #accessing }
FamixMetamodelBuilder >> apply [

	self environment apply
]

{ #category : #accessing }
FamixMetamodelBuilder >> baseImportingContextName [

	^ #FmxImportingContext
]

{ #category : #settings }
FamixMetamodelBuilder >> basicSuperclassName [

	^ basicSuperclassName ifNil: [ basicSuperclassName := self defaultBasicSuperclassName ]
]

{ #category : #accessing }
FamixMetamodelBuilder >> basicSuperclassName: anObject [
	basicSuperclassName := anObject
]

{ #category : #settings }
FamixMetamodelBuilder >> basicTraitName [

	^ basicTraitName ifNil: [ basicTraitName := self defaultBasicTraitName ]
]

{ #category : #accessing }
FamixMetamodelBuilder >> basicTraitName: anObject [
	basicTraitName := anObject
]

{ #category : #accessing }
FamixMetamodelBuilder >> behaviorsCount [

	^ self traits size + self sortedClasses size
]

{ #category : #settings }
FamixMetamodelBuilder >> classTag [

	^ classTag ifNil: [ classTag := self defaultClassTag ]
]

{ #category : #settings }
FamixMetamodelBuilder >> classTag: aSymbol [

	classTag := aSymbol
]

{ #category : #accessing }
FamixMetamodelBuilder >> classes [
	^ classes
]

{ #category : #accessing }
FamixMetamodelBuilder >> classesThatDirectlyUse: aTrait [

	^ self classes select: [ :each | each allLocalTraits includes: aTrait ].
]

{ #category : #accessing }
FamixMetamodelBuilder >> classesThatUse: aTrait [

	^ self classes select: [ :each | each allTraitsInHierarchy includes: aTrait ].
]

{ #category : #accessing }
FamixMetamodelBuilder >> classesToGenerate [ 

	^ self classes select: #willGenerate
]

{ #category : #accessing }
FamixMetamodelBuilder >> containerRequirementsOf: aClass [

	|  usedBehaviors |
	
	usedBehaviors := aClass containerProperties collect: [ :e | e relation oppositeSide relatedEntity].
	^ usedBehaviors flatCollect: [:aBehavior |
		aBehavior isMetamodelTrait
			ifTrue: [ self classes select: [ :e | e hasTraitGeneralization: aBehavior ]]
			ifFalse: [ {aBehavior} ]]
]

{ #category : #'settings - default' }
FamixMetamodelBuilder >> defaultBasicSuperclassName [

	^ #MooseEntity
]

{ #category : #'settings - default' }
FamixMetamodelBuilder >> defaultBasicTraitName [

	^ #Trait
]

{ #category : #'settings - default' }
FamixMetamodelBuilder >> defaultClassTag [

	^ #Entities
]

{ #category : #'settings - default' }
FamixMetamodelBuilder >> defaultTraitTag [

	^ #Traits
]

{ #category : #accessing }
FamixMetamodelBuilder >> doNotGenerateCurrent [

	self classes do: [ :each | each willGenerate: false ].
	self traits do: [ :each | each willGenerate: false ].
	
]

{ #category : #initialization }
FamixMetamodelBuilder >> ensureClassNamed: aString [

	| candidates |
	
	candidates := self classes select: [ :each | each name = aString].
	
	self assert: (candidates size <= 1).
	
	^ (candidates size = 1)
		ifTrue: [ candidates anyOne ]
		ifFalse: [ self newClassNamed: aString ]
	

]

{ #category : #initialization }
FamixMetamodelBuilder >> ensureLocalTraitNamed: aString [

	^ self traits detect: [ :each | each name = aString and: [each prefix = self prefix]] ifNone: [ self newTraitNamed: aString ]

]

{ #category : #initialization }
FamixMetamodelBuilder >> ensureTraitNamed: aString [

	| candidates |
	
	candidates := self traits select: [ :each | each name = aString].
	
	self assert: (candidates size <= 1).
	
	^ (candidates size = 1)
		ifTrue: [ candidates anyOne ]
		ifFalse: [ self newTraitNamed: aString ]
	
]

{ #category : #accessing }
FamixMetamodelBuilder >> environment [
	^ environment
]

{ #category : #accessing }
FamixMetamodelBuilder >> environment: anObject [
	environment := anObject
]

{ #category : #generating }
FamixMetamodelBuilder >> generate [

	self resolveRequirementsFromContainers.

	self registerPackages.

	self traits do: [ :each | 
		self testingSelectorsMapping addAll: each testingSelectors. ].
	self sortedClasses do: [ :each | 
		self testingSelectorsMapping addAll: each testingSelectors. ].

	self traits do: [ :each | each generate ] displayingProgress: 'generating traits'.
	self sortedClasses do: [ :each | each generate ] displayingProgress: 'generating classes'.

	self sortedClasses do: [ :each | each generateNavigationGroups ] displayingProgress: 'generating navigation groups'.

	self behaviorsCount > 0
		ifTrue: [ self generateImportingContext ].
		
	self apply
]

{ #category : #generating }
FamixMetamodelBuilder >> generateImportIn: contextClass [

	| source |

	self sortedClasses do: [ :each | 
		source := String streamContents: [ :s |
			s	nextPutAll: 'import'; nextPutAll: each name; cr;
				cr;
				tab; nextPutAll: '<generated>'; cr;
				tab; nextPutAll: '^ self import: '; nextPutAll: each fullName ].
		 self environment compile: source in: contextClass classified: 'testing' ] 

]

{ #category : #generating }
FamixMetamodelBuilder >> generateImportingContext [

	| contextClass |
	
	self wantsToGenerateImportingContext ifFalse: [ ^ self ].

	contextClass := self environment createImportingcontextClassNamed: self importingContextName in: self packageName.
	
	self generateShouldImportIn: contextClass.
	self generateImportIn: contextClass
]

{ #category : #accessing }
FamixMetamodelBuilder >> generateImportingContext: anObject [
	generateImportingContext := anObject
]

{ #category : #generating }
FamixMetamodelBuilder >> generateShouldImportIn: contextClass [

	| source |

	self sortedClasses do: [ :each | 
		source := String streamContents: [ :s |
			s	nextPutAll: 'shouldImport'; nextPutAll: each name; cr;
				cr;
				tab; nextPutAll: '<generated>'; cr;
				tab; nextPutAll: '^ self shouldImport: '; nextPutAll: each fullName ].
		 self environment compile: source in: contextClass classified: 'testing' ] 

]

{ #category : #accessing }
FamixMetamodelBuilder >> generator [
	^ generator
]

{ #category : #accessing }
FamixMetamodelBuilder >> generator: aGenerator [

	<ignoreForCoverage>
	generator := aGenerator.

]

{ #category : #accessing }
FamixMetamodelBuilder >> importingContextName [

	^ (self prefix, 'ImportingContext') asSymbol
]

{ #category : #initialization }
FamixMetamodelBuilder >> initialize [

	environment := FmxMBRealRingEnvironment for: self.

	classes := OrderedCollection new.
	traits := OrderedCollection new.
	relations := OrderedCollection new.
	testingSelectorsMapping := Set new.
	
	generateImportingContext := false.
	
	
	
]

{ #category : #initialization }
FamixMetamodelBuilder >> newClass [

	| aClass |
	
	aClass := FmxMBClass new.
	aClass builder: self.
	aClass prefix: self prefix.
	aClass packageName: self packageName.
	self classes add: aClass.
	^ aClass
	
]

{ #category : #initialization }
FamixMetamodelBuilder >> newClassNamed: aClassName [

	| candidates |
	
	candidates := self classes select: [ :each | each name = aClassName].
	candidates isEmpty ifFalse: [ FmxMBEntityAlreadyExists signal ].

	^ self newClass name: aClassName.
	
]

{ #category : #initialization }
FamixMetamodelBuilder >> newClassNamed: aClassName comment: aString [

	^ (self newClassNamed: aClassName)
		comment: aString;
		yourself
	
]

{ #category : #initialization }
FamixMetamodelBuilder >> newRelation [

	| aRelation |
	
	aRelation := FmxMBRelation new.
	aRelation builder: self.
	self relations add: aRelation.
	^ aRelation
]

{ #category : #initialization }
FamixMetamodelBuilder >> newTrait [ 

	| aTrait |
	
	aTrait := FmxMBTrait new.
	aTrait builder: self.
	aTrait prefix: self prefix.
	aTrait packageName: self packageName.
	self traits add: aTrait.
	^ aTrait
	
]

{ #category : #initialization }
FamixMetamodelBuilder >> newTraitNamed: aTraitName [

	| candidates |
	
	candidates := self traits select: [ :each | each name = aTraitName].
	candidates isEmpty ifFalse: [ FmxMBEntityAlreadyExists signal ].

	^ self newTrait name: aTraitName.

]

{ #category : #initialization }
FamixMetamodelBuilder >> newTraitNamed: aClassName comment: aString [

	^ (self newTraitNamed: aClassName)
		comment: aString;
		yourself
	
]

{ #category : #accessing }
FamixMetamodelBuilder >> packageName [
	^ packageName ifNil: [ packageName := #'FamixMetamodelBulder-Generated' ]
]

{ #category : #accessing }
FamixMetamodelBuilder >> packageName: anObject [
	packageName := anObject
]

{ #category : #accessing }
FamixMetamodelBuilder >> packageNameForAnnotations [
	^ packageNameForAnnotations ifNil: [ self packageName ].
]

{ #category : #accessing }
FamixMetamodelBuilder >> packageNameForAnnotations: anObject [
	packageNameForAnnotations := anObject
]

{ #category : #accessing }
FamixMetamodelBuilder >> prefix [
	^ prefix ifNil: [ prefix := '' ]
]

{ #category : #accessing }
FamixMetamodelBuilder >> prefix: anObject [
	prefix := anObject
]

{ #category : #generating }
FamixMetamodelBuilder >> registerPackages [
	
	self environment registerPackage: self packageName.
	
]

{ #category : #accessing }
FamixMetamodelBuilder >> relations [
	^ relations
]

{ #category : #generating }
FamixMetamodelBuilder >> resolveRequirementsFromContainers [

	self classes do: [ :each |
		| req |
		req := self containerRequirementsOf: each.
		each requires: (self containerRequirementsOf: each) ].

]

{ #category : #accessing }
FamixMetamodelBuilder >> safeAnnotationPackageName [
	
	| aName |
	
	aName := self packageNameForAnnotations.
	
	^ aName isLiteralSymbol
		ifTrue: [ ^ '#', aName ]
		ifFalse: [ ^ '#''', aName, '''' ]
]

{ #category : #accessing }
FamixMetamodelBuilder >> sortedClasses [

	^ self classes sorted: [ :a :b |
		a allClassGeneralizations size <= b allClassGeneralizations size ].

]

{ #category : #accessing }
FamixMetamodelBuilder >> sortedTraits [

	^ self traits sorted: [ :a :b | a name <= b name].

]

{ #category : #'tests support' }
FamixMetamodelBuilder >> testingEnvironment [

	^ self environment ringEnvironment
]

{ #category : #accessing }
FamixMetamodelBuilder >> testingSelectorsMapping [
	^ testingSelectorsMapping
]

{ #category : #initialization }
FamixMetamodelBuilder >> traitNamed: aTraitName [

	^ self traits detect: [ :each | each name = aTraitName].
]

{ #category : #settings }
FamixMetamodelBuilder >> traitTag [

	^ traitTag ifNil: [ traitTag := self defaultTraitTag ]
]

{ #category : #settings }
FamixMetamodelBuilder >> traitTag: aSymbol [

	traitTag := aSymbol
]

{ #category : #accessing }
FamixMetamodelBuilder >> traits [
	^ traits
]

{ #category : #accessing }
FamixMetamodelBuilder >> traitsToGenerate [ 

	^ self traits select: #willGenerate
]

{ #category : #accessing }
FamixMetamodelBuilder >> wantsToGenerateImportingContext [
	^ generateImportingContext
]

{ #category : #accessing }
FamixMetamodelBuilder >> withImportingContext [

	self generateImportingContext: true
]
