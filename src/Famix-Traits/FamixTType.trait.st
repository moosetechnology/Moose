"
FAMIXType is a generic class representing a type. It has several specializations for specific kinds of types, the typical one being FAMIXClass.
A type is defined in a container (instance of FAMIXContainer). 
The container is typically a namespace (instance of FAMIXNamespace), but may also be a class (in the case of nested classes), or a method (in the case of anonymous classes).

A type can have multiple subtypes or supertypes. These are modelled by means of FAMIXInheritance instances.
"
Trait {
	#name : #FamixTType,
	#instVars : [
		'#typeContainer => FMOne type: #FamixTWithTypes opposite: #types',
		'#typedEntities => FMMany type: #FamixTTypedEntity opposite: #declaredType'
	],
	#traits : 'FamixTReferenceable',
	#classTraits : 'FamixTReferenceable classTrait',
	#category : #'Famix-Traits-Type'
}

{ #category : #meta }
FamixTType classSide >> annotation [

	<FMClass: #TType super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #groups }
FamixTType classSide >> famixTTypeRelatedGroup [

	<mooseGroup>
	
	^ FAMIXTypeGroup
]

{ #category : #adding }
FamixTType >> addTypedEntity: anObject [
	<generated>
	^ self typedEntities add: anObject
]

{ #category : #deprecated }
FamixTType >> belongsTo [
	^ self parentPackage ifNil: [ self parents ifNotEmpty: #anyOne ifEmpty: [ nil ] ]
]

{ #category : #testing }
FamixTType >> entityHasIncomingTypeDeclarations [ 
	^ self typedEntities isNotEmpty.
]

{ #category : #metrics }
FamixTType >> fanIn [
	<FMProperty: #fanIn type: #Number>
	<derived>
	<FMComment: 'Number of client classes'>
	^ self lookUpPropertyNamed: #fanIn computedAs: [ (self allClientsAtScope: FamixTType) size ]
]

{ #category : #metrics }
FamixTType >> fanIn: aNumber [

	self privateState propertyAt: #fanIn put: aNumber
]

{ #category : #testing }
FamixTType >> incomingTypeDeclarations [  
	^ self typedEntities collect: [ :var | MooseQueryTypeDeclarationAssociation newFrom: var to: self ]
]

{ #category : #testing }
FamixTType >> isType [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTType >> mooseNameOn: aStream [
	self typeContainer
		ifNotNil: [ :parent | 
			parent mooseNameOn: aStream.
			aStream nextPutAll: '::' ].
	self name ifNotNil: [ :name | aStream nextPutAll: name ]
]

{ #category : #metrics }
FamixTType >> numberOfAccessesToForeignData [
	<FMProperty: #numberOfAccessesToForeignData type: #Number>
	<derived>
	<FMComment: 'Number of accesses to foreign data'>
	
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
	<FMProperty: #numberOfDuplicatedLinesOfCodeInternally type: #Number>
	<derived>
	<FMComment: 'The number of duplicated lines of code internally'>		

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
	"Relation named: #typeContainer type: #FamixTWithTypes opposite: #types"

	<generated>
	<FMComment: 'Container entity to which this type belongs to. Container is a namespace, not a package (Smalltalk).'>
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
	^ MooseGroup with: self typeContainer
]

{ #category : #accessing }
FamixTType >> typedEntities [
	"Relation named: #typedEntities type: #FamixTTypedEntity opposite: #declaredType"

	<generated>
	<FMComment: 'Entities that have this type as declaredType'>
	<derived>
	^ typedEntities
]

{ #category : #accessing }
FamixTType >> typedEntities: anObject [

	<generated>
	typedEntities value: anObject
]
