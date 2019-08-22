"
FamixMetamodelBuilderRelationSide
"
Class {
	#name : #FmxMBRelationSide,
	#superclass : #FmxMBProperty,
	#traits : 'FmxMBRelationSideTrait',
	#classTraits : 'FmxMBRelationSideTrait classTrait',
	#instVars : [
		'cardinality',
		'trait',
		'container',
		'relation',
		'relatedClass',
		'derived',
		'source',
		'target',
		'subordinate',
		'generationStrategy'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #visitor }
FmxMBRelationSide >> acceptVisitor: aVisitor [

	<ignoreForCoverage>
	^ aVisitor visitRelationSide: self.
]

{ #category : #converting }
FmxMBRelationSide >> asRelationSideNamed: aPropertyName [

	"ignore the proposed name"
	^ self 
]

{ #category : #generating }
FmxMBRelationSide >> asSlot [
	self hasRelation ifFalse: [ FmxMBIncompletePropertyDefiniton signal ].

	^ self builder environment
		slotNamed: self name asSymbol
		cardinality: self cardinality
		type: self oppositeType
		opposite: self oppositeName
]

{ #category : #accessing }
FmxMBRelationSide >> cardinality [
	^ cardinality
]

{ #category : #accessing }
FmxMBRelationSide >> cardinality: anObject [
	cardinality := anObject
]

{ #category : #properties }
FmxMBRelationSide >> container [
	
	self withNavigationOf: self relation.
	container := true
]

{ #category : #properties }
FmxMBRelationSide >> container: anObject [
	container := anObject
]

{ #category : #properties }
FmxMBRelationSide >> derived [
	derived := true
]

{ #category : #properties }
FmxMBRelationSide >> derived: anObject [
	derived := anObject
]

{ #category : #accessing }
FmxMBRelationSide >> from [

	^ self relation from
]

{ #category : #generating }
FmxMBRelationSide >> generateExtendedContainerMethodsIn: aClassOrTrait [

	| methodSource |
	
	methodSource := String streamContents: [ :s |
		s nextPutAll: 'belongsTo'; cr; cr.
		s tab; nextPutAll: '<generated>'; cr.
		s tab; nextPutAll: '^ self '; nextPutAll: self name; cr ].
		
	self builder environment compile: methodSource in: aClassOrTrait classified: 'accessing'.	

	methodSource := String streamContents: [ :s |
		s nextPutAll: 'belongsTo: anObject'; cr; cr.
		s tab; nextPutAll: '<generated>'; cr.
		s tab; nextPutAll: 'self '; nextPutAll: self name; nextPutAll: ': anObject'; cr ].
		
	self builder environment compile: methodSource in: aClassOrTrait classified: 'accessing'.	


]

{ #category : #generating }
FmxMBRelationSide >> generateExtendedContainersIn: aClassOrTrait [

	(self additionalProperties at: #primaryContainer ifAbsent: [ false ])
		ifTrue: [ 
			self generateExtendedContainerMethodsIn: aClassOrTrait ]
]

{ #category : #generating }
FmxMBRelationSide >> generateGetterIn: aClassOrTrait [

	^ generationStrategy generateGetterIn: aClassOrTrait for: self
]

{ #category : #generating }
FmxMBRelationSide >> generateSetterIn: aClassOrTrait [

	self generationStrategy generateSetterIn: aClassOrTrait for: self

	
]

{ #category : #accessing }
FmxMBRelationSide >> generationStrategy [
	^ generationStrategy
]

{ #category : #accessing }
FmxMBRelationSide >> generationStrategy: anObject [
	generationStrategy := anObject
]

{ #category : #testing }
FmxMBRelationSide >> hasRelation [

	^ self relation notNil
]

{ #category : #accessing }
FmxMBRelationSide >> initialize [

	super initialize.	

	cardinality := #one.
	container := false.
	derived := false.
	subordinate := false.
	target := false.
	source := false.
	
	self makeStandard.

]

{ #category : #properties }
FmxMBRelationSide >> isContainer [

	^ container
]

{ #category : #properties }
FmxMBRelationSide >> isDerived [

	^ derived
]

{ #category : #testing }
FmxMBRelationSide >> isMany [

	^ self cardinality = #many
]

{ #category : #testing }
FmxMBRelationSide >> isOne [

	^ self cardinality = #one
]

{ #category : #testing }
FmxMBRelationSide >> isRemote [

	^ self relatedClass isRemote
]

{ #category : #properties }
FmxMBRelationSide >> isSource [

	^ source
]

{ #category : #properties }
FmxMBRelationSide >> isSubordinate [

	^ subordinate
]

{ #category : #properties }
FmxMBRelationSide >> isTarget [

	^ target
]

{ #category : #converting }
FmxMBRelationSide >> makeNonremote [

	self generationStrategy: (FmxMBNonremoteRelationSideGenerationStrategy for: self)
]

{ #category : #converting }
FmxMBRelationSide >> makeRemote [

	self generationStrategy: (FmxMBRemoteRelationSideGenerationStrategy for: self).
	self isRemote: true.
]

{ #category : #converting }
FmxMBRelationSide >> makeStandard [

	self generationStrategy: (FmxMBStandardRelationSideGenerationStrategy for: self)
]

{ #category : #accessing }
FmxMBRelationSide >> many [

	cardinality := #many
]

{ #category : #properties }
FmxMBRelationSide >> noContainer [
	
	container := false
]

{ #category : #properties }
FmxMBRelationSide >> notDerived [
	
	derived := false
]

{ #category : #accessing }
FmxMBRelationSide >> one [

	cardinality := #one
]

{ #category : #accessing }
FmxMBRelationSide >> oppositeName [
	^ self otherSide name asSymbol
]

{ #category : #accessing }
FmxMBRelationSide >> oppositeType [
	^ (self builder configuration prefix , self otherSide relatedEntityName) asSymbol
]

{ #category : #accessing }
FmxMBRelationSide >> otherSide [
	| aFromSide |
	aFromSide := self relation from.
	^ aFromSide == self
		ifTrue: [ self relation to ]
		ifFalse: [ aFromSide ]
]

{ #category : #private }
FmxMBRelationSide >> pluralPropertyName [

	^ self propertyName
]

{ #category : #printing }
FmxMBRelationSide >> producesSlot [

	^ self generationStrategy producesSlot
]

{ #category : #private }
FmxMBRelationSide >> propertyName [

	^ self relatedClass propertyName
]

{ #category : #testing }
FmxMBRelationSide >> providesPrimaryContainer [

	^ self additionalProperties at: #providesPrimaryContainer ifAbsent: [ true ]
	
]

{ #category : #accessing }
FmxMBRelationSide >> relatedClass [
	^ relatedClass
]

{ #category : #accessing }
FmxMBRelationSide >> relatedClass: anObject [
	relatedClass := anObject
]

{ #category : #accessing }
FmxMBRelationSide >> relatedEntity [

	^ trait ifNil: [ relatedClass ]
]

{ #category : #accessing }
FmxMBRelationSide >> relatedEntity: anEntity [

	anEntity isMetamodelClass ifTrue: [ 
		relatedClass := anEntity.
		trait := nil.
		^ self ].

	anEntity isMetamodelTrait ifTrue: [ 
		relatedClass := nil.
		trait := anEntity.
		^ self ].

	"alias"
	relatedClass := nil.
	trait := anEntity trait.
]

{ #category : #accessing }
FmxMBRelationSide >> relatedEntityName [

	^ self relatedEntity name
]

{ #category : #accessing }
FmxMBRelationSide >> relation [
	^ relation
]

{ #category : #accessing }
FmxMBRelationSide >> relation: anObject [
	relation := anObject
]

{ #category : #accessing }
FmxMBRelationSide >> remoteBuilderDo: aBlock [

	self relatedEntity additionalProperties at: #remoteBuilder ifPresent: aBlock
]

{ #category : #'name conversion' }
FmxMBRelationSide >> singularPropertyName [

	| normalizedName uncapitalized aName |
	
	aName := self propertyName.
	
	normalizedName := ((aName size >= 2) 
		and: [ ((aName first:2) allSatisfy: #isUppercase)
		and: [ aName beginsWith: 'T' ] ])
			ifTrue: [ aName withoutPrefix: 'T' ]
			ifFalse: [ aName ].	
	
	uncapitalized := normalizedName uncapitalized.
	
	^ uncapitalized

]

{ #category : #properties }
FmxMBRelationSide >> source [

	source := true.
]

{ #category : #properties }
FmxMBRelationSide >> source: anObject [
	source := anObject
]

{ #category : #properties }
FmxMBRelationSide >> subordinate [
	subordinate := true
]

{ #category : #properties }
FmxMBRelationSide >> subordinate: anObject [
	subordinate := anObject
]

{ #category : #properties }
FmxMBRelationSide >> target [

	target := true.
]

{ #category : #properties }
FmxMBRelationSide >> target: anObject [
	target := anObject
]

{ #category : #accessing }
FmxMBRelationSide >> to [

	^ self relation to
]

{ #category : #accessing }
FmxMBRelationSide >> trait [
	^ trait
]

{ #category : #accessing }
FmxMBRelationSide >> trait: anObject [

	self relatedEntity ifNotNil: [ :aRelatedEntity |
		aRelatedEntity removeRelationSide: self ].
	trait := anObject.
	trait addRelationSide: self
]

{ #category : #accessing }
FmxMBRelationSide >> traitName: aString [

	trait := self builder ensureLocalTraitNamed: aString

]
