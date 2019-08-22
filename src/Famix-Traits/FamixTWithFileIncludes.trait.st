Trait {
	#name : #FamixTWithFileIncludes,
	#instVars : [
		'#incomingIncludeRelations => FMMany type: #FamixTFileInclude opposite: #target',
		'#outgoingIncludeRelations => FMMany type: #FamixTFileInclude opposite: #source'
	],
	#category : #'Famix-Traits-FileInclude'
}

{ #category : #meta }
FamixTWithFileIncludes classSide >> annotation [

	<MSEClass: #TWithFileIncludes super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTWithFileIncludes >> addIncomingIncludeRelation: anObject [
	incomingIncludeRelations add: anObject

]

{ #category : #accessing }
FamixTWithFileIncludes >> addOutgoingIncludeRelation: anObject [
	outgoingIncludeRelations add: anObject

]

{ #category : #accessing }
FamixTWithFileIncludes >> incomingIncludeRelations [

	<generated>
	<MSEComment: 'The include entities that have this file as a target.'>
	"Relation named: #incomingIncludeRelations type: #FamixTFileInclude opposite: #target"

	^ incomingIncludeRelations
]

{ #category : #accessing }
FamixTWithFileIncludes >> incomingIncludeRelations: anObject [

	<generated>
	incomingIncludeRelations value: anObject

]

{ #category : #accessing }
FamixTWithFileIncludes >> outgoingIncludeRelations [

	<generated>
	<MSEComment: 'The include entities that have this file as a source.'>
	"Relation named: #outgoingIncludeRelations type: #FamixTFileInclude opposite: #source"

	^ outgoingIncludeRelations
]

{ #category : #accessing }
FamixTWithFileIncludes >> outgoingIncludeRelations: anObject [

	<generated>
	outgoingIncludeRelations value: anObject

]
