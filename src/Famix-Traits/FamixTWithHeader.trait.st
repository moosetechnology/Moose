Trait {
	#name : #FamixTWithHeader,
	#instVars : [
		'#header => FMOne type: #FamixTHeader opposite: #headerOwner'
	],
	#category : #'Famix-Traits-Header'
}

{ #category : #meta }
FamixTWithHeader classSide >> annotation [

	<MSEClass: #TWithHeader super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithHeader >> header [
	"Relation named: #header type: #FamixTHeader opposite: #headerOwner"

	<generated>
	<MSEComment: 'The header file that defines this module'>
	^ header
]

{ #category : #accessing }
FamixTWithHeader >> header: anObject [

	<generated>
	header := anObject

]
