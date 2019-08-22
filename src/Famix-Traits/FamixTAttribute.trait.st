"
FAMIXAttribute represents a field of a class. It is an attribute of the parent type.

"
Trait {
	#name : #FamixTAttribute,
	#instVars : [
		'#parentType => FMOne type: #FamixTWithAttributes opposite: #attributes'
	],
	#traits : 'FamixTStructuralEntity',
	#classTraits : 'FamixTStructuralEntity classTrait',
	#category : #'Famix-Traits-Attribute'
}

{ #category : #meta }
FamixTAttribute classSide >> annotation [

	<MSEClass: #TAttribute super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #testing }
FamixTAttribute >> isAttribute [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTAttribute >> parentType [
	"Relation named: #parentType type: #FamixTWithAttributes opposite: #attributes"

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
	^ MooseGroup with: self parentType
]
