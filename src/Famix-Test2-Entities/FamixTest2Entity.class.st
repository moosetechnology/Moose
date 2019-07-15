Class {
	#name : #FamixTest2Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2Entity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest2Entity class >> generatedSlotNames [
	<generated>
	'FamixTest2Entity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest2Entity class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTest2Entity class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTest2Generator) metamodel
]

{ #category : #meta }
FamixTest2Entity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FamixTest2Entity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest2Entity >> isType [

	<generated>
	^ false
]
