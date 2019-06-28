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

{ #category : #accessing }
FamixTWithFiles >> addContainerFile: anObject [
	containerFiles add: anObject

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
