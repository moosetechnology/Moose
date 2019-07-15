Class {
	#name : #FamixStImplicitVariable,
	#superclass : #FamixStStructuralEntity,
	#traits : 'FamixTImplicitVariable',
	#classTraits : 'FamixTImplicitVariable classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStImplicitVariable class >> annotation [

	<MSEClass: #ImplicitVariable super: #FamixStStructuralEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStImplicitVariable class >> generatedSlotNames [
	<generated>
	'FamixStImplicitVariable class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStImplicitVariable class >> generatedTraitNames [
	<generated>
	^ #(FamixTImplicitVariable)
]

{ #category : #meta }
FamixStImplicitVariable class >> requirements [

	<generated>
	^ { FamixStMethod }
]

{ #category : #accessing }
FamixStImplicitVariable >> belongsTo [

	<generated>
	^ self parentBehaviouralEntity

]

{ #category : #accessing }
FamixStImplicitVariable >> belongsTo: anObject [

	<generated>
	self parentBehaviouralEntity: anObject

]

{ #category : #testing }
FamixStImplicitVariable >> isImplicitVariable [
	^true
]

{ #category : #testing }
FamixStImplicitVariable >> isSelf [
	^ self name = #self
]

{ #category : #testing }
FamixStImplicitVariable >> isSuper [
	^ self name == #super
]

{ #category : #testing }
FamixStImplicitVariable >> mooseNameOn: stream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].

	self name ifNotNil: [ stream nextPutAll: self name ]
]

{ #category : #testing }
FamixStImplicitVariable >> packageScope [
	^ self parentBehaviouralEntity packageScope
]

{ #category : #testing }
FamixStImplicitVariable >> typeScope [
	^ self parentBehaviouralEntity typeScope
]
