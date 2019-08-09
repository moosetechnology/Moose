Class {
	#name : #FamixJavaLocalVariable,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixJavaTStructuralEntity + FamixTLocalVariable',
	#classTraits : 'FamixJavaTStructuralEntity classTrait + FamixTLocalVariable classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaLocalVariable class >> annotation [

	<MSEClass: #LocalVariable super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixJavaLocalVariable >> belongsTo [

	<generated>
	^ self parentBehaviouralEntity

]

{ #category : #accessing }
FamixJavaLocalVariable >> belongsTo: anObject [

	<generated>
	self parentBehaviouralEntity: anObject

]

{ #category : #'as yet unclassified' }
FamixJavaLocalVariable >> mooseNameOn: stream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].
	self name ifNotNil: [stream nextPutAll: self name]
]

{ #category : #'as yet unclassified' }
FamixJavaLocalVariable >> printOn: stream [ 
	| parent |
	self name ifNotNil: [ stream nextPutAll: self name ].
	stream nextPutAll: ' (local variable'.
	parent := self parentBehaviouralEntity.
	parent ifNotNil: [
		stream nextPutAll: ' in '.
		parent printOn: stream ].
	stream nextPut: $)

]
