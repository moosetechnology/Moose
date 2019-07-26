Class {
	#name : #FamixTestComposed2UnknownSourceLanguage,
	#superclass : #MooseEntity,
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2UnknownSourceLanguage class >> annotation [

	<MSEClass: #UnknownSourceLanguage super: #MooseEntity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTestComposed2UnknownSourceLanguage class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTestComposedSubmetamodel2Generator) metamodel
]

{ #category : #testing }
FamixTestComposed2UnknownSourceLanguage >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2UnknownSourceLanguage >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2UnknownSourceLanguage >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2UnknownSourceLanguage >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2UnknownSourceLanguage >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2UnknownSourceLanguage >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2UnknownSourceLanguage >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2UnknownSourceLanguage >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2UnknownSourceLanguage >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2UnknownSourceLanguage >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2UnknownSourceLanguage >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2UnknownSourceLanguage >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2UnknownSourceLanguage >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2UnknownSourceLanguage >> isType [

	<generated>
	^ false
]
