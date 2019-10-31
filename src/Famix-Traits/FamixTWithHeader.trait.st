Trait {
	#name : #FamixTWithHeader,
	#instVars : [
		'#header => FMOne type: #FamixTHeader opposite: #headerOwner'
	],
	#category : #'Famix-Traits-Header'
}

{ #category : #meta }
FamixTWithHeader classSide >> annotation [

	<FMClass: #TWithHeader super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithHeader >> header [
	"Relation named: #header type: #FamixTHeader opposite: #headerOwner"

	<generated>
	<FMComment: 'The header file that defines this module'>
	<derived>
	^ header
]

{ #category : #accessing }
FamixTWithHeader >> header: anObject [

	<generated>
	header := anObject
]
