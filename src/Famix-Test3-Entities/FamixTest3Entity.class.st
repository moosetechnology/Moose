Class {
	#name : #FamixTest3Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Entity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest3Entity class >> generatedSlotNames [
	<generated>
	'FamixTest3Entity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest3Entity class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTest3Entity class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTest3Generator) metamodel
]

{ #category : #meta }
FamixTest3Entity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FamixTest3Entity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Entity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Entity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Entity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Entity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Entity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Entity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Entity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Entity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Entity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Entity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3Entity >> isType [

	<generated>
	^ false
]
