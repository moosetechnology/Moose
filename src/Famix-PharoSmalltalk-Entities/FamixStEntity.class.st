Class {
	#name : #FamixStEntity,
	#superclass : #MooseEntity,
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStEntity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStEntity class >> generatedSlotNames [
	<generated>
	'FamixStEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStEntity class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FamixStEntity class >> metamodel [

	<generated>
	^ (self class environment at: #FamixPharoSmalltalkGenerator) metamodel
]

{ #category : #meta }
FamixStEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixStEntity class >> resetMooseQueryCaches [
	"Here do nothing. Customize in subclasses."
]

{ #category : #testing }
FamixStEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FamixStEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixStEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
FamixStEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixStEntity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixStEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixStEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixStEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixStEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FamixStEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
FamixStEntity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixStEntity >> isType [

	<generated>
	^ false
]
