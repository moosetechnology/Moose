Class {
	#name : #FAMIXLocalVariable,
	#superclass : #FAMIXStructuralEntity,
	#traits : 'FamixTLocalVariable',
	#classTraits : 'FamixTLocalVariable classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXLocalVariable class >> annotation [

	<MSEClass: #LocalVariable super: #FAMIXStructuralEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #meta }
FAMIXLocalVariable class >> requirements [

	<generated>
	^ { FAMIXBehaviouralEntity }
]

{ #category : #accessing }
FAMIXLocalVariable >> belongsTo [

	<generated>
	^ self parentBehaviouralEntity

]

{ #category : #accessing }
FAMIXLocalVariable >> belongsTo: anObject [

	<generated>
	self parentBehaviouralEntity: anObject

]

{ #category : #'Famix-Implementation' }
FAMIXLocalVariable >> mooseNameOn: stream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].
	self name ifNotNil: [stream nextPutAll: self name]
]

{ #category : #'Famix-Implementation' }
FAMIXLocalVariable >> printOn: stream [ 
	| parent |
	self name ifNotNil: [ stream nextPutAll: self name ].
	stream nextPutAll: ' (local variable'.
	parent := self parentBehaviouralEntity.
	parent ifNotNil: [
		stream nextPutAll: ' in '.
		parent printOn: stream ].
	stream nextPut: $)

]
