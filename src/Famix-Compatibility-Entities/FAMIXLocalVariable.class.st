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

{ #category : #generator }
FAMIXLocalVariable class >> generatedSlotNames [
	<generated>
	'FAMIXLocalVariable class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXLocalVariable class >> generatedTraitNames [
	<generated>
	^ #(FamixTLocalVariable)
]

{ #category : #meta }
FAMIXLocalVariable class >> requirements [

	<generated>
	^ { FAMIXBehaviouralEntity }
]

{ #category : #'Famix-Extensions' }
FAMIXLocalVariable >> accept: aVisitor [

	aVisitor visitLocalVariable: self
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

{ #category : #'moosechef-scoping-filtering' }
FAMIXLocalVariable >> namespaceScope [
	^ self parentBehaviouralEntity namespaceScope
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXLocalVariable >> packageScope [
	^ self parentBehaviouralEntity packageScope
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

{ #category : #'moosechef-scoping-filtering' }
FAMIXLocalVariable >> typeScope [
	^ self parentBehaviouralEntity typeScope
]
