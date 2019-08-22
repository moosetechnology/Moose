Trait {
	#name : #FamixTWithTypes,
	#instVars : [
		'#types => FMMany type: #FamixTType opposite: #typeContainer'
	],
	#category : #'Famix-Traits-Type'
}

{ #category : #meta }
FamixTWithTypes classSide >> annotation [

	<MSEClass: #TWithTypes super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #adding }
FamixTWithTypes >> addType: aType [ 
	types add: aType
]

{ #category : #accessing }
FamixTWithTypes >> allRecursiveTypes [
	"Retrieves all nested types recursively"
	
	| result |
	result := Set new.
	self allRecursiveTypesDo: [:each | result add: each ].
	^ result
]

{ #category : #accessing }
FamixTWithTypes >> allRecursiveTypesDo: aBlock [
	"Traverses all nested types recursively"

	self types do: [ :each | 
		aBlock value: each.
		each allRecursiveTypesDo: aBlock ]
]

{ #category : #metrics }
FamixTWithTypes >> fanOut [
	<MSEProperty: #fanOut type: #Number>
	<derived>
	<MSEComment: 'Number of provider classes'>
	^ self lookUpPropertyNamed: #fanOut computedAs: [ (self allProvidersAtScope: FamixTType) size ]
]

{ #category : #metrics }
FamixTWithTypes >> fanOut: aNumber [

	self privateState propertyAt: #fanOut put: aNumber
]

{ #category : #accessing }
FamixTWithTypes >> types [
	"Relation named: #types type: #FamixTType opposite: #typeContainer"

	<generated>
	<MSEComment: 'Types contained (declared) in this entity, if any.
#types is declared in ContainerEntity because different kinds of container can embed types. Types are usually contained in a Famix.Namespace. But types can also be contained in a Famix.Class or Famix.Method (in Java with inner classes for example). Famix.Function can also contain some types such as structs.'>
	^ types
]

{ #category : #accessing }
FamixTWithTypes >> types: anObject [

	<generated>
	types value: anObject

]
