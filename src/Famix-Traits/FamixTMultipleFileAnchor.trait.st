Trait {
	#name : #FamixTMultipleFileAnchor,
	#instVars : [
		'allFiles'
	],
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTMultipleFileAnchor classSide >> annotation [

	<MSEClass: #TMultipleFileAnchor super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTMultipleFileAnchor classSide >> generatedSlotNames [
	<generated>
	'FamixTMultipleFileAnchor class>>#generatedSlotNames'.
	^ #(allFiles)
]

{ #category : #generator }
FamixTMultipleFileAnchor classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> allFiles [

	<MSEProperty: #allFiles type: #FamixTFileAnchor>
	<generated>
	<multivalued>
	<MSEComment: 'All source code definition files'>
	^ allFiles
]

{ #category : #accessing }
FamixTMultipleFileAnchor >> allFiles: anObject [

	<generated>
	allFiles := anObject

]
