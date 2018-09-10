Class {
	#name : #FAMIXImplicitVariable,
	#superclass : #FAMIXStructuralEntity,
	#traits : 'FamixTImplicitVariable',
	#classTraits : 'FamixTImplicitVariable classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXImplicitVariable class >> annotation [

	<MSEClass: #ImplicitVariable super: #FAMIXStructuralEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #generator }
FAMIXImplicitVariable class >> generatedSlotNames [
	<generated>
	'FAMIXImplicitVariable class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXImplicitVariable class >> generatedTraitNames [
	<generated>
	^ #(FamixTImplicitVariable)
]

{ #category : #meta }
FAMIXImplicitVariable class >> requirements [

	<generated>
	^ { FAMIXBehaviouralEntity }
]

{ #category : #'Famix-Extensions' }
FAMIXImplicitVariable >> accept: aVisitor [
	aVisitor visitImplicitVariable: self
]

{ #category : #accessing }
FAMIXImplicitVariable >> belongsTo [

	<generated>
	^ self parentBehaviouralEntity

]

{ #category : #accessing }
FAMIXImplicitVariable >> belongsTo: anObject [

	<generated>
	self parentBehaviouralEntity: anObject

]

{ #category : #accessing }
FAMIXImplicitVariable >> container [
	self deprecated: 'Please use parentBehaviouralEntity instead'.  
	^ self parentBehaviouralEntity
]

{ #category : #accessing }
FAMIXImplicitVariable >> container: aBehaviouralEntity [
	self deprecated: 'Please use #parentBehaviouralEntity: instead'.
	^ self parentBehaviouralEntity: aBehaviouralEntity
]

{ #category : #'Famix-Extensions' }
FAMIXImplicitVariable >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	self container: (aVisitor visit: anEntity container).

]

{ #category : #'Famix-Implementation' }
FAMIXImplicitVariable >> isImplicitVariable [
	^true
]

{ #category : #'Famix-Implementation' }
FAMIXImplicitVariable >> isSelf [
	^ self name = #self
]

{ #category : #'Famix-Implementation' }
FAMIXImplicitVariable >> isSuper [
	^ self name == #super
]

{ #category : #'Famix-Implementation' }
FAMIXImplicitVariable >> mooseNameOn: stream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].

	self name ifNotNil: [ stream nextPutAll: self name ]
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXImplicitVariable >> namespaceScope [
	^ self parentBehaviouralEntity namespaceScope
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXImplicitVariable >> packageScope [
	^ self parentBehaviouralEntity packageScope
]

{ #category : #'Famix-Implementation' }
FAMIXImplicitVariable >> printOn: aStream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ aStream nextPutAll: parent name.
		  aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (ImplicitVariable)'
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXImplicitVariable >> typeScope [
	^ self parentBehaviouralEntity typeScope
]
