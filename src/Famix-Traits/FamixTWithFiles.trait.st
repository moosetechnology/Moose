Trait {
	#name : #FamixTWithFiles,
	#instVars : [
		'#containerFiles => FMMany type: #FamixTFile opposite: #entities'
	],
	#category : #'Famix-Traits-File'
}

{ #category : #meta }
FamixTWithFiles classSide >> annotation [

	<MSEClass: #TWithFiles super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithFiles classSide >> generatedSlotNames [
	<generated>
	'FamixTWithFiles class>>#generatedSlotNames'.
	^ #(containerFiles)
]

{ #category : #generator }
FamixTWithFiles classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithFiles >> containerFiles [

	<generated>
	<MSEComment: 'List of files containing the entity'>
	^ containerFiles
]

{ #category : #accessing }
FamixTWithFiles >> containerFiles: anObject [

	<generated>
	containerFiles value: anObject

]
