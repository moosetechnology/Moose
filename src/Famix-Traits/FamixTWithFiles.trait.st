Trait {
	#name : #FamixTWithFiles,
	#instVars : [
		'#containerFiles => FMMany type: #FamixTFile opposite: #entities'
	],
	#category : #'Famix-Traits-File'
}

{ #category : #meta }
FamixTWithFiles classSide >> annotation [

	<FMClass: #TWithFiles super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithFiles >> addContainerFile: anObject [
	containerFiles add: anObject

]

{ #category : #accessing }
FamixTWithFiles >> containerFiles [
	"Relation named: #containerFiles type: #FamixTFile opposite: #entities"

	<generated>
	<FMComment: 'List of files containing the entity'>
	^ containerFiles
]

{ #category : #accessing }
FamixTWithFiles >> containerFiles: anObject [

	<generated>
	containerFiles value: anObject
]
