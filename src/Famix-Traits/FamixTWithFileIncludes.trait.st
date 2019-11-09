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

	<FMClass: #TWithFileIncludes super: #Object>
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
	"Relation named: #incomingIncludeRelations type: #FamixTFileInclude opposite: #target"

	<generated>
	<FMComment: 'The include entities that have this file as a target.'>
	<derived>
	^ incomingIncludeRelations
]

{ #category : #accessing }
FamixTWithFileIncludes >> incomingIncludeRelations: anObject [

	<generated>
	incomingIncludeRelations value: anObject
]

{ #category : #accessing }
FamixTWithFileIncludes >> outgoingIncludeRelations [
	"Relation named: #outgoingIncludeRelations type: #FamixTFileInclude opposite: #source"

	<generated>
	<FMComment: 'The include entities that have this file as a source.'>
	<derived>
	^ outgoingIncludeRelations
]

{ #category : #accessing }
FamixTWithFileIncludes >> outgoingIncludeRelations: anObject [

	<generated>
	outgoingIncludeRelations value: anObject
]
