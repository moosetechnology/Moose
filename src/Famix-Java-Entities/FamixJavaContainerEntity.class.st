Class {
	#name : #FamixJavaContainerEntity,
	#superclass : #MooseEntity,
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaContainerEntity class >> annotation [

	<MSEClass: #ContainerEntity super: #MooseEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixJavaContainerEntity class >> metamodel [

	<generated>
	^ (self class environment at: #FamixJavaGenerator) metamodel
]

{ #category : #meta }
FamixJavaContainerEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixJavaContainerEntity >> accept: aVisitor [

	aVisitor visitContainerEntity: self
]

{ #category : #'as yet unclassified' }
FamixJavaContainerEntity >> addClass: aClass [
	
	types add: aClass
]

{ #category : #'as yet unclassified' }
FamixJavaContainerEntity >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	anEntity types do: [:t|
		self addType: (aVisitor visit: t) ].

	
]

{ #category : #testing }
FamixJavaContainerEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaContainerEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaContainerEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaContainerEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaContainerEntity >> isContainerEntity [

	<generated>
	^ true
]

{ #category : #testing }
FamixJavaContainerEntity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaContainerEntity >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaContainerEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaContainerEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaContainerEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaContainerEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaContainerEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaContainerEntity >> isPrimitiveType [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaContainerEntity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaContainerEntity >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixJavaContainerEntity >> isType [

	<generated>
	^ false
]

{ #category : #'as yet unclassified' }
FamixJavaContainerEntity >> mooseNameWithDots [
	^ self mooseName ifNotNil: [ '.' join: (self mooseName substrings: '::') ]
]

{ #category : #'as yet unclassified' }
FamixJavaContainerEntity >> numberOfChildren [
	<MSEProperty: #numberOfChildren type: #Number>
	<MSEComment: 'Number of direct children entities in the containment tree.'>
	<derived>
	
	^ self children size
]
