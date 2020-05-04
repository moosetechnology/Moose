Class {
	#name : #FamixJavaParameter,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixTParameter',
	#classTraits : 'FamixTParameter classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParameter class >> annotation [

	<FMClass: #Parameter super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #printing }
FamixJavaParameter >> mooseNameOn: stream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].
	self name ifNotNil: [stream nextPutAll: self name]
]

{ #category : #accessing }
FamixJavaParameter >> parentType [
	^self parentBehaviouralEntity parentType
]

{ #category : #printing }
FamixJavaParameter >> printOn: stream [ 
	| parent |
	self name ifNotNil: [ stream nextPutAll: self name ].
	stream nextPutAll: ' (parameter'.
	parent := self parentBehaviouralEntity.
	parent ifNotNil: [
		stream nextPutAll: ' in '.
		parent printOn: stream ].
	stream nextPut: $)

]
