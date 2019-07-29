Class {
	#name : #FamixJavaImplicitVariable,
	#superclass : #MooseEntity,
	#traits : 'FamixJavaTStructuralEntity + FamixTImplicitVariable',
	#classTraits : 'FamixJavaTStructuralEntity classTrait + FamixTImplicitVariable classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaImplicitVariable class >> annotation [

	<MSEClass: #ImplicitVariable super: #MooseEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixJavaImplicitVariable class >> metamodel [

	<generated>
	^ (self class environment at: #FamixJavaGenerator) metamodel
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

{ #category : #testing }
FamixJavaImplicitVariable >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaImplicitVariable >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaImplicitVariable >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaImplicitVariable >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaImplicitVariable >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaImplicitVariable >> isImplicitVariable [
	^true
]

{ #category : #testing }
FamixJavaImplicitVariable >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaImplicitVariable >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaImplicitVariable >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaImplicitVariable >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaImplicitVariable >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaImplicitVariable >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaImplicitVariable >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaImplicitVariable >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaImplicitVariable >> isType [

	<generated>
	^ false
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
