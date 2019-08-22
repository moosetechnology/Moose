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
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTTypeAlias >> aliasedType [

	<generated>
	<MSEComment: 'Points to the actual type.'>
	"Relation named: #aliasedType type: #FamixTWithTypeAliases opposite: #typeAliases"

	^ aliasedType
]

{ #category : #accessing }
FamixTTypeAlias >> aliasedType: anObject [

	<generated>
	aliasedType := anObject

]
