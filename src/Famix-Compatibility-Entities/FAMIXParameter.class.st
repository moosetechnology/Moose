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

{ #category : #generator }
FAMIXParameter class >> generatedSlotNames [
	<generated>
	'FAMIXParameter class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXParameter class >> generatedTraitNames [
	<generated>
	^ #(FamixTParameter)
]

{ #category : #meta }
FAMIXParameter class >> requirements [

	<generated>
	^ { FAMIXBehaviouralEntity }
]

{ #category : #'Famix-Extensions' }
FAMIXParameter >> accept: aVisitor [

	aVisitor visitParameter: self
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

{ #category : #'moosechef-scoping-filtering' }
FAMIXParameter >> namespaceScope [
	^ self parentBehaviouralEntity namespaceScope
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXParameter >> packageScope [
	^ self parentBehaviouralEntity packageScope
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

{ #category : #'moosechef-scoping-filtering' }
FAMIXParameter >> typeScope [
	^ self parentBehaviouralEntity typeScope
]
