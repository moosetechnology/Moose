Class {
	#name : #FamixJavaParameter,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixJavaTStructuralEntity + FamixTParameter',
	#classTraits : 'FamixJavaTStructuralEntity classTrait + FamixTParameter classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParameter class >> annotation [

	<MSEClass: #Parameter super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixJavaParameter >> belongsTo [

	<generated>
	^ self parentBehaviouralEntity

]

{ #category : #accessing }
FamixJavaParameter >> belongsTo: anObject [

	<generated>
	self parentBehaviouralEntity: anObject

]

{ #category : #'as yet unclassified' }
FamixJavaParameter >> mooseNameOn: stream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].
	self name ifNotNil: [stream nextPutAll: self name]
]

{ #category : #'as yet unclassified' }
FamixJavaParameter >> parentType [
	^self parentBehaviouralEntity parentType
]

{ #category : #'as yet unclassified' }
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
