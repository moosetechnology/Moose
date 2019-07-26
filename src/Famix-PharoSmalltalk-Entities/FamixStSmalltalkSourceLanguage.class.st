Class {
	#name : #FamixStSmalltalkSourceLanguage,
	#superclass : #MooseEntity,
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStSmalltalkSourceLanguage class >> annotation [

	<MSEClass: #SmalltalkSourceLanguage super: #MooseEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixStSmalltalkSourceLanguage class >> metamodel [

	<generated>
	^ (self class environment at: #FamixPharoSmalltalkGenerator) metamodel
]

{ #category : #meta }
FamixStSmalltalkSourceLanguage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FamixStSmalltalkSourceLanguage >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixStSmalltalkSourceLanguage >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixStSmalltalkSourceLanguage >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixStSmalltalkSourceLanguage >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixStSmalltalkSourceLanguage >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixStSmalltalkSourceLanguage >> isImplicitVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixStSmalltalkSourceLanguage >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixStSmalltalkSourceLanguage >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixStSmalltalkSourceLanguage >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixStSmalltalkSourceLanguage >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixStSmalltalkSourceLanguage >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixStSmalltalkSourceLanguage >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixStSmalltalkSourceLanguage >> isSmalltalk [
	^ true
]

{ #category : #testing }
FamixStSmalltalkSourceLanguage >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixStSmalltalkSourceLanguage >> isType [

	<generated>
	^ false
]

{ #category : #testing }
FamixStSmalltalkSourceLanguage >> isUnknown [
	^false
]
