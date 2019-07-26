Class {
	#name : #FamixTest2UnknownSourceLanguage,
	#superclass : #MooseEntity,
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2UnknownSourceLanguage class >> annotation [

	<MSEClass: #UnknownSourceLanguage super: #MooseEntity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest2UnknownSourceLanguage class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTest2Generator) metamodel
]

{ #category : #meta }
FamixTest2UnknownSourceLanguage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FamixTest2UnknownSourceLanguage >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2UnknownSourceLanguage >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2UnknownSourceLanguage >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2UnknownSourceLanguage >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2UnknownSourceLanguage >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2UnknownSourceLanguage >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2UnknownSourceLanguage >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2UnknownSourceLanguage >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2UnknownSourceLanguage >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2UnknownSourceLanguage >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2UnknownSourceLanguage >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2UnknownSourceLanguage >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2UnknownSourceLanguage >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2UnknownSourceLanguage >> isType [

	<generated>
	^ false
]
