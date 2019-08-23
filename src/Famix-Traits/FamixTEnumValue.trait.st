"
It models the values defined in an FAMIXEnum. These are attributes of enums with default values.

For example, the following Java code defines an Enum with seven EnumValues.

public enum Day {
    SUNDAY, MONDAY, TUESDAY, WEDNESDAY, 
    THURSDAY, FRIDAY, SATURDAY 
}

Instance Variables:
	parentEnum	<(MultivalueLink of: FAMIXEnum)>
"
Trait {
	#name : #FamixTEnumValue,
	#instVars : [
		'#parentEnum => FMOne type: #FamixTWithEnumValues opposite: #enumValues'
	],
	#category : #'Famix-Traits-EnumValue'
}

{ #category : #meta }
FamixTEnumValue classSide >> annotation [

	<MSEClass: #TEnumValue super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTEnumValue >> mooseNameOn: aStream [
	(self belongsTo isNotNil and: [ self belongsTo name isNotNil ])
		ifTrue: [ self belongsTo mooseNameOn: aStream.
			aStream << self mooseNameSeparator ].
	super mooseNameOn: aStream
]

{ #category : #accessing }
FamixTEnumValue >> mooseNameSeparator [
	^ '::'
]

{ #category : #accessing }
FamixTEnumValue >> parentEnum [
	"Relation named: #parentEnum type: #FamixTWithEnumValues opposite: #enumValues"

	<generated>
	<MSEComment: 'The Enum declaring this value. It offers the implementation of belongsTo'>
	<container>
	^ parentEnum
]

{ #category : #accessing }
FamixTEnumValue >> parentEnum: anObject [

	<generated>
	parentEnum := anObject

]

{ #category : #navigation }
FamixTEnumValue >> parentEnumGroup [
	<generated>
	<navigation: 'ParentEnum'>
	^ MooseGroup with: self parentEnum
]

{ #category : #accessing }
FamixTEnumValue >> parentType [ 

	^ self parentEnum
]
