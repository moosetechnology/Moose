Class {
	#name : #FamixJavaParameter,
	#superclass : #MooseEntity,
	#traits : 'FamixJavaTStructuralEntity + FamixTParameter',
	#classTraits : 'FamixJavaTStructuralEntity classTrait + FamixTParameter classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParameter class >> annotation [

	<MSEClass: #Parameter super: #MooseEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixJavaParameter class >> metamodel [

	<generated>
	^ (self class environment at: #FamixJavaGenerator) metamodel
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

{ #category : #testing }
FamixJavaParameter >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaParameter >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaParameter >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaParameter >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaParameter >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaParameter >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaParameter >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaParameter >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaParameter >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaParameter >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaParameter >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaParameter >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaParameter >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaParameter >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaParameter >> isType [

	<generated>
	^ false
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
