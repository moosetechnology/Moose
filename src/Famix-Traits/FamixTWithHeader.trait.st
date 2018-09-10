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
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithHeader classSide >> generatedSlotNames [
	<generated>
	'FamixTWithHeader class>>#generatedSlotNames'.
	^ #(header)
]

{ #category : #generator }
FamixTWithHeader classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithHeader >> header [

	<generated>
	<MSEComment: 'The header file that defines this module'>
	^ header
]

{ #category : #accessing }
FamixTWithHeader >> header: anObject [

	<generated>
	header := anObject

]
