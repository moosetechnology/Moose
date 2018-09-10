Class {
	#name : #FamixJavaParameter,
	#superclass : #FamixJavaStructuralEntity,
	#traits : 'FamixTParameter',
	#classTraits : 'FamixTParameter classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParameter class >> annotation [

	<MSEClass: #Parameter super: #FamixJavaStructuralEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaParameter class >> generatedSlotNames [
	<generated>
	'FamixJavaParameter class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaParameter class >> generatedTraitNames [
	<generated>
	^ #(FamixTParameter)
]

{ #category : #meta }
FamixJavaParameter class >> requirements [

	<generated>
	^ { FamixJavaMethod }
]

{ #category : #'as yet unclassified' }
FamixJavaParameter >> accept: aVisitor [

	aVisitor visitParameter: self
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
FamixJavaParameter >> namespaceScope [
	^ self parentBehaviouralEntity namespaceScope
]

{ #category : #'as yet unclassified' }
FamixJavaParameter >> packageScope [
	^ self parentBehaviouralEntity packageScope
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

{ #category : #'as yet unclassified' }
FamixJavaParameter >> typeScope [
	^ self parentBehaviouralEntity typeScope
]
