Class {
	#name : #FamixJavaImplicitVariable,
	#superclass : #FamixJavaStructuralEntity,
	#traits : 'FamixTImplicitVariable',
	#classTraits : 'FamixTImplicitVariable classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaImplicitVariable class >> annotation [

	<MSEClass: #ImplicitVariable super: #FamixJavaStructuralEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaImplicitVariable class >> generatedSlotNames [
	<generated>
	'FamixJavaImplicitVariable class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaImplicitVariable class >> generatedTraitNames [
	<generated>
	^ #(FamixTImplicitVariable)
]

{ #category : #meta }
FamixJavaImplicitVariable class >> requirements [

	<generated>
	^ { FamixJavaMethod }
]

{ #category : #'as yet unclassified' }
FamixJavaImplicitVariable >> accept: aVisitor [
	aVisitor visitImplicitVariable: self
]

{ #category : #accessing }
FamixJavaImplicitVariable >> belongsTo [

	<generated>
	^ self parentBehaviouralEntity

]

{ #category : #accessing }
FamixJavaImplicitVariable >> belongsTo: anObject [

	<generated>
	self parentBehaviouralEntity: anObject

]

{ #category : #'as yet unclassified' }
FamixJavaImplicitVariable >> container [
	self deprecated: 'Please use parentBehaviouralEntity instead'.  
	^ self parentBehaviouralEntity
]

{ #category : #'as yet unclassified' }
FamixJavaImplicitVariable >> container: aBehaviouralEntity [
	self deprecated: 'Please use #parentBehaviouralEntity: instead'.
	^ self parentBehaviouralEntity: aBehaviouralEntity
]

{ #category : #'as yet unclassified' }
FamixJavaImplicitVariable >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	self container: (aVisitor visit: anEntity container).

]

{ #category : #'as yet unclassified' }
FamixJavaImplicitVariable >> isImplicitVariable [
	^true
]

{ #category : #'as yet unclassified' }
FamixJavaImplicitVariable >> mooseNameOn: stream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].

	self name ifNotNil: [ stream nextPutAll: self name ]
]

{ #category : #'as yet unclassified' }
FamixJavaImplicitVariable >> namespaceScope [
	^ self parentBehaviouralEntity namespaceScope
]

{ #category : #'as yet unclassified' }
FamixJavaImplicitVariable >> packageScope [
	^ self parentBehaviouralEntity packageScope
]

{ #category : #'as yet unclassified' }
FamixJavaImplicitVariable >> printOn: aStream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ aStream nextPutAll: parent name.
		  aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (ImplicitVariable)'
]

{ #category : #'as yet unclassified' }
FamixJavaImplicitVariable >> typeScope [
	^ self parentBehaviouralEntity typeScope
]
