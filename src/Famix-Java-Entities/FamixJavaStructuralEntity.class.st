Class {
	#name : #FamixJavaStructuralEntity,
	#superclass : #MooseEntity,
	#traits : 'FamixTStructuralEntity + FamixTWithDereferencedInvocations',
	#classTraits : 'FamixTStructuralEntity classTrait + FamixTWithDereferencedInvocations classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaStructuralEntity class >> annotation [

	<MSEClass: #StructuralEntity super: #MooseEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixJavaStructuralEntity class >> metamodel [

	<generated>
	^ (self class environment at: #FamixJavaGenerator) metamodel
]

{ #category : #testing }
FamixJavaStructuralEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaStructuralEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaStructuralEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaStructuralEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaStructuralEntity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaStructuralEntity >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaStructuralEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaStructuralEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaStructuralEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaStructuralEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaStructuralEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaStructuralEntity >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaStructuralEntity >> isReference [

	<generated>
	^ false
]

{ #category : #'as yet unclassified' }
FamixJavaStructuralEntity >> isSharedVariable [

	^ false
]

{ #category : #testing }
FamixJavaStructuralEntity >> isType [

	<generated>
	^ false
]

{ #category : #'as yet unclassified' }
FamixJavaStructuralEntity >> namespaceScope [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
FamixJavaStructuralEntity >> packageScope [

	| cs |
	cs := self typeScope.
	
	^ (cs isNil) ifTrue: [nil] ifFalse: [cs packageScope]
]

{ #category : #'as yet unclassified' }
FamixJavaStructuralEntity >> typeScope [

	^ self belongsTo typeScope 
]
