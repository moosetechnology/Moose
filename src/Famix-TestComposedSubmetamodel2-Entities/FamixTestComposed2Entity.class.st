Class {
	#name : #FamixTestComposed2Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-TestComposedSubmetamodel2-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed2Entity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'Famix-TestComposedSubmetamodel2-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed2Entity class >> generatedSlotNames [
	<generated>
	'FamixTestComposed2Entity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed2Entity class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTestComposed2Entity class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTestComposedSubmetamodel2Generator) metamodel
]

{ #category : #meta }
FamixTestComposed2Entity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FamixTestComposed2Entity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2Entity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2Entity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2Entity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2Entity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2Entity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2Entity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2Entity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2Entity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2Entity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2Entity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed2Entity >> isType [

	<generated>
	^ false
]
