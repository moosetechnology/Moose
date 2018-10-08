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
		'subordinate'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #visitor }
FmxMBRelationSide >> acceptVisitor: aVisitor [

	^ aVisitor visitRelationSide: self.
]

{ #category : #converting }
FmxMBRelationSide >> asRelationSideNamed: aPropertyName [

	"ignore the proposed name"
	^ self 
]

{ #category : #generating }
FmxMBRelationSide >> asSlot [
	
	| slotName opposite |

	self hasRelation 
		ifFalse: [ FmxMBIncompletePropertyDefiniton signal ].
	
	slotName := self name.
	opposite := self otherSide.
	
	^ self builder environment 
		slotNamed: slotName asSymbol 
		cardinality: self cardinality 
		type: (self builder prefix, opposite relatedEntityName) asSymbol 
		opposite: opposite name asSymbol

	
	
	
		
	
	
	
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

	| methodSource commentDefinition |
	
	commentDefinition := self comment
		ifNotEmpty: [ '<MSEComment: {1}>' format: { self comment printString } ].

	methodSource := String streamContents: [ :s |
		s nextPutAll: self name; cr; cr.
		s tab; nextPutAll: '<generated>'; cr.
		commentDefinition  
			ifNotEmpty: [ s tab; nextPutAll: commentDefinition; cr].
			self isContainer ifTrue: [ 
				s tab; nextPutAll: '<container>'; cr; cr ].
			self isDerived ifTrue: [ 
				s tab; nextPutAll: '<derived>'; cr; cr ].
			self isSource ifTrue: [ 
				s tab; nextPutAll: '<source>'; cr; cr ].
			self isTarget ifTrue: [ 
				s tab; nextPutAll: '<target>'; cr; cr ].
		s tab; nextPutAll: '^ ';
			nextPutAll: self name.].
		
	self builder environment compile: methodSource in: aClassOrTrait classified: 'accessing'.	
	

	
]

{ #category : #generating }
FmxMBRelationSide >> generateSetterIn: aClassOrTrait [

	| methodSource |
	
	methodSource := String streamContents: [ :s |
		s nextPutAll: self name; nextPutAll: ': anObject'; cr; cr.
		s tab; nextPutAll: '<generated>'; cr.
		(self cardinality = #one)
			ifTrue: [ s tab; nextPutAll: self name, ' := anObject'; cr ]
			ifFalse: [ s tab; nextPutAll: self name, ' value: anObject'; cr ] ].
		
	self builder environment compile: methodSource in: aClassOrTrait classified: 'accessing'.	

	
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
FmxMBRelationSide >> otherSide [

	| aFromSide |
	
	aFromSide := self relation from.

	^ (aFromSide == self)
		ifTrue: [ self relation to ]
		ifFalse: [ aFromSide ]		
]

{ #category : #private }
FmxMBRelationSide >> ownerPropertyName [

	^ self name
]

{ #category : #private }
FmxMBRelationSide >> pluralPropertyName [

	^ self name
]

{ #category : #properties }
FmxMBRelationSide >> primaryContainer [
	
	container := true.
	additionalProperties at: #primaryContainer put: true
]

{ #category : #private }
FmxMBRelationSide >> propertyName [

	^ self name
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

	^ trait ifNil: [ ^ relatedClass ]
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

{ #category : #private }
FmxMBRelationSide >> relationWith: aRelationSide [

	| aRelation |
	
	aRelation := self builder newRelation
		side: self;
		oppositeSide: aRelationSide;
		builder: self builder;
		yourself.	
		
	self relation: aRelation.	
	aRelationSide relation: aRelation.

	self relatedClass ifNotNil: [ 
		self relatedClass addRelation: aRelation with: aRelationSide relatedEntity ].
	
	^ aRelation

]

{ #category : #'name conversion' }
FmxMBRelationSide >> singularPropertyName [

	| normalizedName uncapitalized |
	
	normalizedName := ((self name size >= 2) 
		and: [ ((self name first:2) allSatisfy: #isUppercase)
		and: [ self name beginsWith: 'T' ] ])
			ifTrue: [ self name withoutPrefix: 'T' ]
			ifFalse: [ self name ].	
	
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
FmxMBRelationSide >> traitName [

	^ self trait name
]

{ #category : #accessing }
FmxMBRelationSide >> traitName: aString [

	trait := self builder ensureLocalTraitNamed: aString

]
