"
FAMIXType is a generic class representing a type. It has several specializations for specific kinds of types, the typical one being FAMIXClass.
A type is defined in a container (instance of FAMIXContainer). 
The container is typically a namespace (instance of FAMIXNamespace), but may also be a class (in the case of nested classes), or a method (in the case of anonymous classes).

A type can have multiple subtypes or supertypes. These are modelled by means of FAMIXInheritance instances.
"
Trait {
	#name : #FamixTType,
	#instVars : [
		'#typeContainer => FMOne type: #FamixTWithTypes opposite: #types'
	],
	#category : #'Famix-Traits-Type'
}

{ #category : #meta }
FamixTType classSide >> annotation [

	<MSEClass: #TType super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #groups }
FamixTType classSide >> famixTTypeRelatedGroup [

	<mooseGroup>
	
	^ FAMIXTypeGroup
]

{ #category : #generator }
FamixTType classSide >> generatedSlotNames [
	<generated>
	'FamixTType class>>#generatedSlotNames'.
	^ #(typeContainer)
]

{ #category : #generator }
FamixTType classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #'Famix-Extensions-nav All Dependencies' }
FamixTType >> clientTypes [
	<MSEProperty: #clientTypes type: #FamixTType>
	<multivalued>
	<derived>
	<MSEComment: 'All types that depend on (inherit, staticly access, or use some methods of) the receiver'>
	^ (self queryAllIncoming atScope: FamixTType) withoutSelfLoops
]

{ #category : #metrics }
FamixTType >> fanIn [
	<MSEProperty: #fanIn type: #Number>
	<derived>
	<MSEComment: 'Number of client classes'>

	^self
		lookUpPropertyNamed: #fanIn
		computedAs: [self clientTypes size]
]

{ #category : #metrics }
FamixTType >> fanIn: aNumber [

	self privateState propertyAt: #fanIn put: aNumber
]

{ #category : #testing }
FamixTType >> isType [

	<generated>
	^ true
]

{ #category : #metrics }
FamixTType >> numberOfAccessesToForeignData [
	<MSEProperty: #numberOfAccessesToForeignData type: #Number>
	<derived>
	<MSEComment: 'Number of accesses to foreign data'>
	
	^self
		lookUpPropertyNamed: #numberOfAccessesToForeignData
		computedAs: [self notExistentMetricValue]
]

{ #category : #metrics }
FamixTType >> numberOfAccessesToForeignData: aNumber [

	self privateState propertyAt: #numberOfAccessesToForeignData put: aNumber
]

{ #category : #metrics }
FamixTType >> numberOfDuplicatedLinesOfCodeInternally [
	<MSEProperty: #numberOfDuplicatedLinesOfCodeInternally type: #Number>
	<derived>
	<MSEComment: 'The number of duplicated lines of code internally'>		

	^self
		lookUpPropertyNamed: #numberOfDuplicatedLinesOfCodeInternally
		computedAs: [self notExistentMetricValue]
]

{ #category : #metrics }
FamixTType >> numberOfDuplicatedLinesOfCodeInternally: aNumber [

	self privateState propertyAt: #numberOfDuplicatedLinesOfCodeInternally put: aNumber
]

{ #category : #testing }
FamixTType >> realType [
	"All types except the alias ones are real"
	^ self 
]

{ #category : #accessing }
FamixTType >> typeContainer [

	<generated>
	<MSEComment: 'Container entity to which this type belongs to. Container is a namespace, not a package (Smalltalk).'>
	<container>

	^ typeContainer
]

{ #category : #accessing }
FamixTType >> typeContainer: anObject [

	typeContainer := anObject.
	self resetMooseName.

]

{ #category : #navigation }
FamixTType >> typeContainerGroup [

	<generated>
	<navigation: 'TypeContainer'>
	^ MooseGroup
			with: (self typeContainer)
]
