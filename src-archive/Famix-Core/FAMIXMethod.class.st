"
FAMIXMethod represents a behaviour in an object-oriented language.

A FAMIXMethod is always contained in a parentType.
"
Class {
	#name : #FAMIXMethod,
	#superclass : #FAMIXBehaviouralEntity,
	#instVars : [
		'kind',
		'parentType',
		'hasClassScope'
	],
	#classVars : [
		'ShouldSearchForSmalltalkCodeInImage'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXMethod class >> annotation [
	<MSEClass: #Method super: #FAMIXBehaviouralEntity>
	<package: #FAMIX>
]

{ #category : #accessing }
FAMIXMethod class >> shouldSearchForSmalltalkCodeInImage [
	^ ShouldSearchForSmalltalkCodeInImage ifNil: [ ShouldSearchForSmalltalkCodeInImage := true ]
]

{ #category : #accessing }
FAMIXMethod class >> shouldSearchForSmalltalkCodeInImage: anObject [
	ShouldSearchForSmalltalkCodeInImage := anObject
]

{ #category : #accessing }
FAMIXMethod >> allRecursiveTypes [
	"Retrieves all nested types recursively"
	
	| result |
	result := Set new.
	self allRecursiveTypesDo: [:each | result add: each ].
	^ result
]

{ #category : #accessing }
FAMIXMethod >> allRecursiveTypesDo: aBlock [
	"Traverses all nested types recursively"

	self types do: [ :each | 
		aBlock value: each.
		each allRecursiveTypesDo: aBlock ]
]

{ #category : #accessing }
FAMIXMethod >> belongsTo [
	^ self parentType
]

{ #category : #accessing }
FAMIXMethod >> belongsTo: aType [
	self parentType
]

{ #category : #accessing }
FAMIXMethod >> hasClassScope [
	<MSEProperty: #hasClassScope type: #Boolean>
	<MSEComment: 'True if class-side method'>

	^ hasClassScope

	
]

{ #category : #accessing }
FAMIXMethod >> hasClassScope: aBoolean [
	hasClassScope := aBoolean
]

{ #category : #'initialize-release' }
FAMIXMethod >> initialize [
	super initialize.
	hasClassScope := false
]

{ #category : #accessing }
FAMIXMethod >> kind [
	<MSEProperty: #kind type: #String>
	<MSEComment: 'Tag indicating a setter, getter, constant, constructor, or abstract method'>
	
	^ kind
]

{ #category : #accessing }
FAMIXMethod >> kind: aSymbol [
	"Set the kind of method, one of #getter #setter ot nil"

	| kindSymbol |
	kindSymbol := aSymbol ifNotNil: [aSymbol asSymbol].
"	[#(nil #setter #getter #constant #constructor)
		includes: kindSymbol] assert."
	^kind := kindSymbol
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXMethod >> methodScope [
"This is a special case, only meaningful when using #withoutSelfLoops. Rejecting self loops with a method means rejecting recursive calls."

	^ self
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXMethod >> namespaceScope [
	^ self parentType namespaceScope
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXMethod >> packageScope [

	^ self parentPackage ifNil:[ 
		|cl|
		cl := self parentType.
		cl isNil 
			ifTrue:[nil]
			ifFalse:[cl packageScope]
	]
]

{ #category : #accessing }
FAMIXMethod >> parentType [
	<MSEProperty: #parentType type: #FAMIXType opposite: #methods>
	<MSEComment: 'Type declaring the method. It provides the implementation for belongsTo.'>
	<container>
	
	^ parentType
]

{ #category : #accessing }
FAMIXMethod >> parentType: aType [ 
	parentType := FMMultivalueLink 
		on: self
		update: #methods
		from: self parentType
		to: aType.
	self resetMooseName
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXMethod >> typeScope [

	^ self parentType 
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXMethod >> yourScope [

	^ #methodScope
]
