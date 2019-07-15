"
FAMIXAttribute represents a field of a class. It is an attribute of the parent type.

"
Trait {
	#name : #FamixTAttribute,
	#instVars : [
		'#parentType => FMOne type: #FamixTWithAttributes opposite: #attributes'
	],
	#category : #'Famix-Traits-Attribute'
}

{ #category : #meta }
FamixTAttribute classSide >> annotation [

	<MSEClass: #TAttribute super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTAttribute classSide >> generatedSlotNames [
	<generated>
	'FamixTAttribute class>>#generatedSlotNames'.
	^ #(parentType)
]

{ #category : #generator }
FamixTAttribute classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #testing }
FamixTAttribute >> isAttribute [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTAttribute >> parentType [

	<generated>
	<MSEComment: 'Type declaring the attribute. belongsTo implementation'>
	<container>

	^ parentType
]

{ #category : #accessing }
FamixTAttribute >> parentType: anObject [

	parentType := anObject.
	self resetMooseName.

]

{ #category : #navigation }
FamixTAttribute >> parentTypeGroup [

	<generated>
	<navigation: 'ParentType'>
	^ MooseGroup
			with: (self parentType)
]
