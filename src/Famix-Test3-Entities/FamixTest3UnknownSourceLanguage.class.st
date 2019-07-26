Class {
	#name : #FamixTest3UnknownSourceLanguage,
	#superclass : #MooseEntity,
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3UnknownSourceLanguage class >> annotation [

	<MSEClass: #UnknownSourceLanguage super: #MooseEntity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest3UnknownSourceLanguage class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTest3Generator) metamodel
]

{ #category : #testing }
FamixTest3UnknownSourceLanguage >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3UnknownSourceLanguage >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3UnknownSourceLanguage >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3UnknownSourceLanguage >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3UnknownSourceLanguage >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3UnknownSourceLanguage >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3UnknownSourceLanguage >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3UnknownSourceLanguage >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3UnknownSourceLanguage >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3UnknownSourceLanguage >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3UnknownSourceLanguage >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3UnknownSourceLanguage >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3UnknownSourceLanguage >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3UnknownSourceLanguage >> isType [

	<generated>
	^ false
]
