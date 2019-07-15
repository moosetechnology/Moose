Class {
	#name : #FamixJavaLocalVariable,
	#superclass : #FamixJavaStructuralEntity,
	#traits : 'FamixTLocalVariable',
	#classTraits : 'FamixTLocalVariable classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaLocalVariable class >> annotation [

	<MSEClass: #LocalVariable super: #FamixJavaStructuralEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaLocalVariable class >> generatedSlotNames [
	<generated>
	'FamixJavaLocalVariable class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaLocalVariable class >> generatedTraitNames [
	<generated>
	^ #(FamixTLocalVariable)
]

{ #category : #meta }
FamixJavaLocalVariable class >> requirements [

	<generated>
	^ { FamixJavaMethod }
]

{ #category : #'as yet unclassified' }
FamixJavaLocalVariable >> accept: aVisitor [

	aVisitor visitLocalVariable: self
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
FamixJavaLocalVariable >> namespaceScope [
	^ self parentBehaviouralEntity namespaceScope
]

{ #category : #'as yet unclassified' }
FamixJavaLocalVariable >> packageScope [
	^ self parentBehaviouralEntity packageScope
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

{ #category : #'as yet unclassified' }
FamixJavaLocalVariable >> typeScope [
	^ self parentBehaviouralEntity typeScope
]
