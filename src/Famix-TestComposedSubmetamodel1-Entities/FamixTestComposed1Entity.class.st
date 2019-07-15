Class {
	#name : #FamixTestComposed1Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-TestComposedSubmetamodel1-Entities-Entities'
}

{ #category : #meta }
FamixTestComposed1Entity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'Famix-TestComposedSubmetamodel1-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTestComposed1Entity class >> generatedSlotNames [
	<generated>
	'FamixTestComposed1Entity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTestComposed1Entity class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixTestComposed1Entity class >> metamodel [

	<generated>
	^ (self class environment at: #FamixTestComposedSubmetamodel1Generator) metamodel
]

{ #category : #meta }
FamixTestComposed1Entity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
FamixTestComposed1Entity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1Entity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1Entity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1Entity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1Entity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1Entity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1Entity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1Entity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1Entity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1Entity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1Entity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixTestComposed1Entity >> isType [

	<generated>
	^ false
]
