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

	<FMClass: #TTypeAlias super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTTypeAlias >> aliasedType [
	"Relation named: #aliasedType type: #FamixTWithTypeAliases opposite: #typeAliases"

	<generated>
	<FMComment: 'Points to the actual type.'>
	^ aliasedType
]

{ #category : #accessing }
FamixTTypeAlias >> aliasedType: anObject [

	<generated>
	aliasedType := anObject
]
