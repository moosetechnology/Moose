Class {
	#name : #FAMIXParameter,
	#superclass : #FAMIXStructuralEntity,
	#traits : 'FamixTParameter',
	#classTraits : 'FamixTParameter classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXParameter class >> annotation [

	<MSEClass: #Parameter super: #FAMIXStructuralEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #meta }
FAMIXParameter class >> requirements [

	<generated>
	^ { FAMIXBehaviouralEntity }
]

{ #category : #accessing }
FAMIXParameter >> belongsTo [

	<generated>
	^ self parentBehaviouralEntity

]

{ #category : #accessing }
FAMIXParameter >> belongsTo: anObject [

	<generated>
	self parentBehaviouralEntity: anObject

]

{ #category : #'Famix-Implementation' }
FAMIXParameter >> mooseNameOn: stream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].
	self name ifNotNil: [stream nextPutAll: self name]
]

{ #category : #'Famix-Extensions' }
FAMIXParameter >> parentType [
	^self parentBehaviouralEntity parentType
]

{ #category : #'Famix-Implementation' }
FAMIXParameter >> printOn: stream [ 
	| parent |
	self name ifNotNil: [ stream nextPutAll: self name ].
	stream nextPutAll: ' (parameter'.
	parent := self parentBehaviouralEntity.
	parent ifNotNil: [
		stream nextPutAll: ' in '.
		parent printOn: stream ].
	stream nextPut: $)

]
