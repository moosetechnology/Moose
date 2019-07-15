"
FAMIXType is a generic class representing a type. It has several specializations for specific kinds of types, the typical one being FAMIXClass.
A type is defined in a container (instance of FAMIXContainer). 
The container is typically a namespace (instance of FAMIXNamespace), but may also be a class (in the case of nested classes), or a method (in the case of anonymous classes).

A type can have multiple subtypes or supertypes. These are modelled by means of FAMIXInheritance instances.
"
Class {
	#name : #FAMIXType,
	#superclass : #FAMIXContainerEntity,
	#instVars : [
		'incomingReferences',
		'subInheritances',
		'methods',
		'container',
		'superInheritances',
		'attributes',
		'behavioursWithDeclaredType',
		'structuresWithDeclaredType',
		'outgoingTraitUsages'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXType class >> annotation [
	<MSEClass: #Type super: #FAMIXContainerEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXType >> addAttribute: anAttribute [
	attributes add: anAttribute
]

{ #category : #accessing }
FAMIXType >> addBehaviourWithDeclaredType: aBehaviour [
	behavioursWithDeclaredType add: aBehaviour
]

{ #category : #accessing }
FAMIXType >> addIncomingReference: aReference [ 
	incomingReferences add: aReference
]

{ #category : #accessing }
FAMIXType >> addMethod: aMethod [
	methods add: aMethod
]

{ #category : #accessing }
FAMIXType >> addOutgoingTraitUsage: aTraitUsage [
	self outgoingTraitUsages add: aTraitUsage
]

{ #category : #accessing }
FAMIXType >> addStructureWithDeclaredType: aStructuralEntity [
	structuresWithDeclaredType add: aStructuralEntity
]

{ #category : #accessing }
FAMIXType >> addSubInheritance: anInheritance [ 
	subInheritances add: anInheritance
]

{ #category : #accessing }
FAMIXType >> addSuperInheritance: anInheritance [ 
	superInheritances add: anInheritance
]

{ #category : #accessing }
FAMIXType >> addTraitUsage: aTraitUsage [
	
]

{ #category : #accessing }
FAMIXType >> allRecursiveTypes [
	"Retrieves all nested types recursively (including directly nested types and those nested in methods)"
	
	| result |
	result := Set new.
	self allRecursiveTypesDo: [:each | result add: each ].
	^ result
]

{ #category : #accessing }
FAMIXType >> allRecursiveTypesDo: aBlock [
	"Traverses all nested types recursively (including directly nested types and those nested in methods)"

	self types do: [ :each | 
		aBlock value: each.
		each allRecursiveTypesDo: aBlock ].
	self methods do: [ :each | each allRecursiveTypesDo: aBlock ]
]

{ #category : #accessing }
FAMIXType >> attributes [
	<MSEProperty: #attributes type: #FAMIXAttribute opposite: #parentType> <multivalued> <derived>
	<MSEComment: 'List of attributes declared by this type.'>
	
	^attributes
]

{ #category : #accessing }
FAMIXType >> attributes: anAttribute [
	attributes value: anAttribute
]

{ #category : #accessing }
FAMIXType >> behavioursWithDeclaredType [
	<MSEProperty: #behavioursWithDeclaredType type: #FamixBehaviouralEntity opposite: #declaredType> <multivalued> <derived>
	<MSEComment: 'Behavioral entities that have this type as declaredType'>

	^ behavioursWithDeclaredType
]

{ #category : #accessing }
FAMIXType >> behavioursWithDeclaredType: aCollectionOfBehaviours [
	behavioursWithDeclaredType value: aCollectionOfBehaviours
]

{ #category : #accessing }
FAMIXType >> belongsTo [
	^ self container ifNil: [ self parentPackage ]
]

{ #category : #accessing }
FAMIXType >> belongsTo: aContainer [
	self container: aContainer 
]

{ #category : #accessing }
FAMIXType >> container [
	<MSEProperty: #container type: #FAMIXContainerEntity opposite: #types>
	<MSEComment: 'Container entity to which this type belongs to. Container is a namespace, not a package (Smalltalk).'>
	<container>
	
	^container
]

{ #category : #accessing }
FAMIXType >> container: aContainerEntity [
	container := FMMultivalueLink on: self
					update: #types
					from: self container
					to: aContainerEntity.
	self resetMooseName
]

{ #category : #accessing }
FAMIXType >> incomingReferences [
	<MSEProperty: #incomingReferences type: #FAMIXReference opposite: #target> <multivalued> <derived>
	<MSEComment: 'References to this entity by other entities.'>
	
	^incomingReferences
]

{ #category : #accessing }
FAMIXType >> incomingReferences: aReference [
	incomingReferences value: aReference
]

{ #category : #'moosequery-queries-incoming' }
FAMIXType >> incomingTypeDeclarations [
	^ self structuresWithDeclaredType , self behavioursWithDeclaredType collect: [ :var | MooseChefTypeDeclarationAssociation newFrom: var to: self ]
]

{ #category : #'initialize-release' }
FAMIXType >> initialize [
	super initialize.
	subInheritances := FMNullMultivalueLink on: self opposite: #superclass: selector: #subInheritances.
	methods := FMNullMultivalueLink on: self opposite: #parentType: selector: #methods.
	superInheritances := FMNullMultivalueLink on: self opposite: #subclass: selector: #superInheritances.
	attributes := FMNullMultivalueLink on: self opposite: #parentType: selector: #attributes.
	behavioursWithDeclaredType := FMNullMultivalueLink on: self opposite: #declaredType: selector: #behavioursWithDeclaredType.
	structuresWithDeclaredType := FMNullMultivalueLink on: self opposite: #declaredType: selector: #structuresWithDeclaredType.
	incomingReferences := FMNullMultivalueLink on: self opposite: #target: selector: #incomingReferences.
	outgoingTraitUsages := FMNullMultivalueLink on: self opposite: #user: selector: #outgoingTraitUsages
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXType >> methodScope [
	"This only makes sense to reject self loops in #collectAtScope:"

	^ self methods
]

{ #category : #accessing }
FAMIXType >> methods [
	<MSEProperty: #methods type: #FAMIXMethod opposite: #parentType> <multivalued> <derived>
	<MSEComment: 'Methods declared by this type.'>
	
	^methods
]

{ #category : #accessing }
FAMIXType >> methods: aMethod [
	methods value: aMethod
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXType >> namespaceScope [
	"we ask the container for the namespaceScope
	because we can have classes in methods or in other classes.
	Thus, we need to traverse recursively until we reach a namespace"
	
	^ self container 
		ifNotNil: [ self container namespaceScope ]
]

{ #category : #accessing }
FAMIXType >> outgoingTraitUsages [
	<MSEProperty: #outgoingTraitUsages type: #FAMIXTraitUsage opposite: #user> <multivalued> <derived>
	^ outgoingTraitUsages
]

{ #category : #accessing }
FAMIXType >> outgoingTraitUsages: aCollectionOfTraitUsages [
	outgoingTraitUsages value: aCollectionOfTraitUsages
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXType >> packageScope [

	^ self parentPackage
]

{ #category : #accessing }
FAMIXType >> structuresWithDeclaredType [
	<MSEProperty: #structuresWithDeclaredType type: #FAMIXStructuralEntity opposite: #declaredType> <multivalued> <derived>
	<MSEComment: 'Structural entities that have this type as declaredType'>

	^ structuresWithDeclaredType
]

{ #category : #accessing }
FAMIXType >> structuresWithDeclaredType: aCollectionOfStructuralEntities [
	structuresWithDeclaredType value: aCollectionOfStructuralEntities
]

{ #category : #accessing }
FAMIXType >> subInheritances [
	<MSEProperty: #subInheritances type: #FAMIXInheritance opposite: #superclass> <multivalued> <derived>
	<MSEComment: 'Subinheritance relationships, i.e. known subclasses of this type.'>
	
	^subInheritances
]

{ #category : #accessing }
FAMIXType >> subInheritances: anInheritance [
	subInheritances value: anInheritance
]

{ #category : #accessing }
FAMIXType >> superInheritances [
	<MSEProperty: #superInheritances type: #FAMIXInheritance opposite: #subclass> <multivalued> <derived>
	<MSEComment: 'Superinheritance relationships, i.e. known superclasses of this type.'>

	^superInheritances
]

{ #category : #accessing }
FAMIXType >> superInheritances: anInheritance [
	superInheritances value: anInheritance
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXType >> typeScope [
	"all types are not classes. Redefined in FamixClass"

	^ self
]
