Trait {
	#name : #FamixTWithEnumValues,
	#instVars : [
		'#enumValues => FMMany type: #FamixTEnumValue opposite: #parentEnum'
	],
	#category : #'Famix-Traits-EnumValue'
}

{ #category : #meta }
FamixTWithEnumValues classSide >> annotation [

	<MSEClass: #TWithEnumValues super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithEnumValues >> addEnumValue: anObject [
	enumValues add: anObject

]

{ #category : #accessing }
FamixTWithEnumValues >> enumValues [
	"Relation named: #enumValues type: #FamixTEnumValue opposite: #parentEnum"

	<generated>
	^ enumValues
]

{ #category : #accessing }
FamixTWithEnumValues >> enumValues: anObject [

	<generated>
	enumValues value: anObject

]
