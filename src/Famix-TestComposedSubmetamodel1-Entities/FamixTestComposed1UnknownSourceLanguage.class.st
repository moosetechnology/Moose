Class {
	#name : #FamixTestComposed1UnknownSourceLanguage,
	#superclass : #MooseEntity,
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1UnknownSourceLanguage class >> annotation [

	<MSEClass: #UnknownSourceLanguage super: #MooseEntity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTestComposed1UnknownSourceLanguage class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTestComposedSubmetamodel1Generator) metamodel
]

{ #category : #meta }
FamixTestComposed1UnknownSourceLanguage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FamixTestComposed1UnknownSourceLanguage >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1UnknownSourceLanguage >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1UnknownSourceLanguage >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1UnknownSourceLanguage >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1UnknownSourceLanguage >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1UnknownSourceLanguage >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1UnknownSourceLanguage >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1UnknownSourceLanguage >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1UnknownSourceLanguage >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1UnknownSourceLanguage >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1UnknownSourceLanguage >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1UnknownSourceLanguage >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1UnknownSourceLanguage >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1UnknownSourceLanguage >> isType [

	<generated>
	^ false
]
