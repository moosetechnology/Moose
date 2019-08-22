Trait {
	#name : #FamixTFileInclude,
	#instVars : [
		'#source => FMOne type: #FamixTWithFileIncludes opposite: #outgoingIncludeRelations',
		'#target => FMOne type: #FamixTWithFileIncludes opposite: #incomingIncludeRelations'
	],
	#category : #'Famix-Traits-FileInclude'
}

{ #category : #meta }
FamixTFileInclude classSide >> annotation [

	<MSEClass: #TFileInclude super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTFileInclude >> source [

	<generated>
	<MSEComment: 'The file that is including'>
	"Relation named: #source type: #FamixTWithFileIncludes opposite: #outgoingIncludeRelations"

	^ source
]

{ #category : #accessing }
FamixTFileInclude >> source: anObject [

	<generated>
	source := anObject

]

{ #category : #accessing }
FamixTFileInclude >> target [

	<generated>
	<MSEComment: 'The file that is included'>
	"Relation named: #target type: #FamixTWithFileIncludes opposite: #incomingIncludeRelations"

	^ target
]

{ #category : #accessing }
FamixTFileInclude >> target: anObject [

	<generated>
	target := anObject

]
