"
This entity models a typedef in C.

Instance Variables:
	aliasedType	<ProtoObject | PseudoContext>
"
Trait {
	#name : #FamixTTypeAlias,
	#instVars : [
		'#aliasedType => FMOne type: #FamixTWithTypeAliases opposite: #typeAliases'
	],
	#category : #'Famix-Traits-TypeAlias'
}

{ #category : #meta }
FamixTTypeAlias classSide >> annotation [

	<MSEClass: #TTypeAlias super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTTypeAlias classSide >> generatedSlotNames [
	<generated>
	'FamixTTypeAlias class>>#generatedSlotNames'.
	^ #(aliasedType)
]

{ #category : #generator }
FamixTTypeAlias classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTTypeAlias >> aliasedType [

	<generated>
	<MSEComment: 'Points to the actual type.'>
	^ aliasedType
]

{ #category : #accessing }
FamixTTypeAlias >> aliasedType: anObject [

	<generated>
	aliasedType := anObject

]
