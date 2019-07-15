Class {
	#name : #FamixStParameter,
	#superclass : #FamixStStructuralEntity,
	#traits : 'FamixTParameter',
	#classTraits : 'FamixTParameter classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStParameter class >> annotation [

	<MSEClass: #Parameter super: #FamixStStructuralEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStParameter class >> generatedSlotNames [
	<generated>
	'FamixStParameter class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStParameter class >> generatedTraitNames [
	<generated>
	^ #(FamixTParameter)
]

{ #category : #meta }
FamixStParameter class >> requirements [

	<generated>
	^ { FamixStMethod }
]

{ #category : #accessing }
FamixStParameter >> belongsTo [

	<generated>
	^ self parentBehaviouralEntity

]

{ #category : #accessing }
FamixStParameter >> belongsTo: anObject [

	<generated>
	self parentBehaviouralEntity: anObject

]

{ #category : #accessing }
FamixStParameter >> mooseNameOn: stream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].
	self name ifNotNil: [stream nextPutAll: self name]
]

{ #category : #accessing }
FamixStParameter >> packageScope [
	^ self parentBehaviouralEntity packageScope
]

{ #category : #accessing }
FamixStParameter >> typeScope [
	^ self parentBehaviouralEntity typeScope
]
