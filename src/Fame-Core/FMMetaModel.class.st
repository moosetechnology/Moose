"
A FMMetaRepository is a repository containing descriptions of the classes used in a repository.

So an FM3Repository contains instances (ie instance of FamixClass or RPGHero)
and its associated FMMetaRepository contains instance of describing the classes of the 
FM3Repository elements.

Instance Variables
	classDict:		<Object>
	nameDict:		<Object>
	packageDict:		<Object>

classDict
	- Smalltalk class to its description

nameDict
	- Primitive object names to their description instance

packageDict
	- Package names to their description instance

"
Class {
	#name : #FMMetaModel,
	#superclass : #FMModel,
	#instVars : [
		'classDict',
		'nameDict'
	],
	#category : #'Fame-Core-Models'
}

{ #category : #accessing }
FMMetaModel >> classes [
	^ self elements select: [ :each | each isFM3Class ]
]

{ #category : #accessing }
FMMetaModel >> concreteClasses [
	"Return all the FM3 classes whose implementing class is a class and not a trait."

	^ self classes reject: [ :fm3Class | fm3Class implementingClass isTrait ]
]

{ #category : #initialization }
FMMetaModel >> defaultMetamodel [
	^ FMMetaMetaModel new
]

{ #category : #accessing }
FMMetaModel >> descriptionOf: smalltalkClass [ 
	self flag: 'it should not return nil by default'.
	^ classDict 
		at: smalltalkClass 
		ifAbsent: [ 
			nameDict 
				at: smalltalkClass name 
				ifAbsent: [ nil ] ]
]

{ #category : #accessing }
FMMetaModel >> descriptionOf: smalltalkClass ifAbsent: elseBlock [ 
	^ classDict 
		at: smalltalkClass
		ifAbsent: elseBlock
]

{ #category : #accessing }
FMMetaModel >> elementNamed: aString [
	^ self elementNamed: aString ifAbsent: [ self error: 'Element ''' , aString , ''' not found.' ]
]

{ #category : #accessing }
FMMetaModel >> elementNamed: aString ifAbsent: exceptionBlock [
	^ nameDict at: aString ifAbsent: exceptionBlock
]

{ #category : #ui }
FMMetaModel >> gtInspectorClassesIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite fastList
		title: 'Classes';
		display: [ self classes sorted: [:x :y | x fullName < y fullName] ];
		format: [ :each | 
			each isAbstract 
				ifTrue: [ Text string: each fullName attribute: TextEmphasis italic ]
				ifFalse: [ Text fromString: each fullName ] ];
		tags: [ :each | 
					each package isNil
						ifTrue: [ #() ]
						ifFalse: [ each package name ] ];
		morphicSelectionAct: [ :list | list selection implementingClass browse ] 
							icon: GLMUIThemeExtraIcons glamorousBrowse 
							on: $b
							entitled: 'Browse implementation'
]

{ #category : #ui }
FMMetaModel >> gtInspectorHierarchiesIn: composite [
	<gtInspectorPresentationOrder: 2>
	^ composite tree
		title: 'Hierarchies';
		display: [ (self classes select: [ :each | each superclass = FM3Class object ]) sorted: [:x :y | x fullName < y fullName] ];
		children: [ :c | c subclasses sorted: [:x :y | x fullName < y fullName] ];
		format: [ :each | 
			each isAbstract 
				ifTrue: [ Text string: each fullName attribute: TextEmphasis italic ]
				ifFalse: [ Text fromString: each fullName ] ];
		tags: [ :each | 
					each package isNil
						ifTrue: [ #() ]
						ifFalse: [ each package name ] ];
		morphicSelectionAct: [ :list | list selection implementingClass browse ] 
							icon: GLMUIThemeExtraIcons glamorousBrowse 
							on: $b
							entitled: 'Browse implementation'
]

{ #category : #ui }
FMMetaModel >> gtInspectorPackagesIn: composite [
	<gtInspectorPresentationOrder: 1>
	^ composite fastList
		title: 'Packages';
		display: [ self packages sorted: [:x :y | x fullName < y fullName] ];
		format: [ :each | each fullName ]
]

{ #category : #ui }
FMMetaModel >> gtInspectorPropertiesIn: composite [
	<gtInspectorPresentationOrder: 5>
	^ composite table
		title: 'Properties';
		display: [ self properties sorted: [:x :y | x fullName < y fullName] ];
		column: 'Name' evaluated: [ :each | each gtDisplayString ] tags: [ :each | 
					each package isNil
						ifTrue: [ #() ]
						ifFalse: [ each package name ] ];
		column: 'Type' evaluated: [ :each | each gtTypeString ];
		morphicSelectionAct: [ :list | list selection implementingClass browse ] 
							icon: GLMUIThemeExtraIcons glamorousBrowse 
							on: $b
							entitled: 'Browse implementation'
]

{ #category : #ui }
FMMetaModel >> gtSpotterClassesFor: aStep [
	<spotterOrder: 10>
	aStep listProcessor
		title: 'Classes';
		allCandidates: [ self classes ];
		itemName: [ :class | class fullName ];
		filter: GTFilterSubstring
]

{ #category : #ui }
FMMetaModel >> gtSpotterPackagesFor: aStep [
	<spotterOrder: 20>
	aStep listProcessor
		title: 'Packages';
		allCandidates: [ self packages ];
		itemName: [ :example | example fullName ];
		filter: GTFilterSubstring
]

{ #category : #testing }
FMMetaModel >> includes: element [
	"Here we use the elements inst var instead of the getter to not cast the elements as array. It improve the perf a lot."

	^ (element isFM3Class and: [ element isBuiltIn ]) or: [ elements includes: element ]
]

{ #category : #initialization }
FMMetaModel >> initialize [
	super initialize.
	self updateCache
]

{ #category : #testing }
FMMetaModel >> isMetamodel [
	^ true
]

{ #category : #accessing }
FMMetaModel >> packageNamed: name [
	^ nameDict at: name
]

{ #category : #accessing }
FMMetaModel >> packageNamed: name ifAbsentPut: aBlock [
	^ nameDict at: name ifAbsentPut: aBlock
]

{ #category : #accessing }
FMMetaModel >> packages [
	^ self elements select: [ :each | each isFM3Package ]
]

{ #category : #private }
FMMetaModel >> postAdd: element [
	self updateCacheWith: element
]

{ #category : #accessing }
FMMetaModel >> properties [
	^ self elements select: [ :each | each isFM3Property ]
]

{ #category : #private }
FMMetaModel >> updateCache [
	nameDict := (FM3Constant constants collect: [ :const | const name asString -> const ]) asDictionary.
	classDict := (FM3Constant constants collect: [ :const | const class -> const ]) asDictionary.
	self elements do: [ :each | self updateCacheWith: each ]
]

{ #category : #private }
FMMetaModel >> updateCacheWith: element [
	element fullName ifNotNil: [ :fullName | nameDict at: fullName put: element ].
	element isFM3Class ifTrue: [ element implementingClass ifNotNil: [ :class | classDict at: class put: element ] ]
]
