Class {
	#name : #FamixStStructuralEntity,
	#superclass : #MooseEntity,
	#traits : 'FamixTStructuralEntity + FamixTTypedStructure',
	#classTraits : 'FamixTStructuralEntity classTrait + FamixTTypedStructure classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStStructuralEntity class >> annotation [

	<MSEClass: #StructuralEntity super: #MooseEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixStStructuralEntity class >> metamodel [

	<generated>
	^ (self class environment at: #FamixPharoSmalltalkGenerator) metamodel
]

{ #category : #meta }
FamixStStructuralEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'Famix-Implementation' }
FamixStStructuralEntity >> entityHasOutgoingTypeDeclarations [
	^ self declaredType isNotNil
]

{ #category : #testing }
FamixStStructuralEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixStStructuralEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixStStructuralEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixStStructuralEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixStStructuralEntity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixStStructuralEntity >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixStStructuralEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixStStructuralEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixStStructuralEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixStStructuralEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixStStructuralEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixStStructuralEntity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixStStructuralEntity >> isSharedVariable [

	^ false
]

{ #category : #testing }
FamixStStructuralEntity >> isType [

	<generated>
	^ false
]

{ #category : #'Famix-Implementation' }
FamixStStructuralEntity >> outgoingTypeDeclarations [
	^ self declaredType ifNil: [ {} ] ifNotNil: [ :dt | {(MooseQueryTypeDeclarationAssociation newFrom: self to: dt)} ]
]
