Class {
	#name : #FamixStLocalVariable,
	#superclass : #FamixStStructuralEntity,
	#traits : 'FamixTLocalVariable',
	#classTraits : 'FamixTLocalVariable classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStLocalVariable class >> annotation [

	<MSEClass: #LocalVariable super: #FamixStStructuralEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStLocalVariable class >> generatedSlotNames [
	<generated>
	'FamixStLocalVariable class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStLocalVariable class >> generatedTraitNames [
	<generated>
	^ #(FamixTLocalVariable)
]

{ #category : #meta }
FamixStLocalVariable class >> requirements [

	<generated>
	^ { FamixStMethod }
]

{ #category : #accessing }
FamixStLocalVariable >> belongsTo [

	<generated>
	^ self parentBehaviouralEntity

]

{ #category : #accessing }
FamixStLocalVariable >> belongsTo: anObject [

	<generated>
	self parentBehaviouralEntity: anObject

]

{ #category : #accessing }
FamixStLocalVariable >> mooseNameOn: stream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].
	self name ifNotNil: [stream nextPutAll: self name]
]

{ #category : #accessing }
FamixStLocalVariable >> packageScope [
	^ self parentBehaviouralEntity packageScope
]
