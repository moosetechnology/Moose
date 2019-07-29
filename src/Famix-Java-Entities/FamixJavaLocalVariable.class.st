Class {
	#name : #FamixJavaLocalVariable,
	#superclass : #MooseEntity,
	#traits : 'FamixJavaTStructuralEntity + FamixTLocalVariable',
	#classTraits : 'FamixJavaTStructuralEntity classTrait + FamixTLocalVariable classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaLocalVariable class >> annotation [

	<MSEClass: #LocalVariable super: #MooseEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixJavaLocalVariable class >> metamodel [

	<generated>
	^ (self class environment at: #FamixJavaGenerator) metamodel
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

{ #category : #testing }
FamixJavaLocalVariable >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaLocalVariable >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaLocalVariable >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaLocalVariable >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaLocalVariable >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaLocalVariable >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaLocalVariable >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaLocalVariable >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaLocalVariable >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaLocalVariable >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaLocalVariable >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaLocalVariable >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaLocalVariable >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaLocalVariable >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaLocalVariable >> isType [

	<generated>
	^ false
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
