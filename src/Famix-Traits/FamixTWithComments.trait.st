Trait {
	#name : #FamixTWithComments,
	#instVars : [
		'#comments => FMMany type: #FamixTComment opposite: #container'
	],
	#category : #'Famix-Traits-Comment'
}

{ #category : #meta }
FamixTWithComments classSide >> annotation [

	<FMClass: #TWithComments super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #removing }
FamixTWithComments >> addComment: aComment [
	self flag: #todo.	"Cyril: Remove next check after some time. This is for a transition. 10 august 2019."
	aComment isString ifTrue: [ self error: 'It is not possible to add a string as a comment anymore. Please create a comment entity to add.' ].
	self comments add: aComment
]

{ #category : #accessing }
FamixTWithComments >> comments [
	"Relation named: #comments type: #FamixTComment opposite: #container"

	<generated>
	<FMComment: 'list of comments defined in the entity'>
	<derived>
	^ comments
]

{ #category : #accessing }
FamixTWithComments >> comments: anObject [

	<generated>
	comments value: anObject
]

{ #category : #testing }
FamixTWithComments >> hasComments [
	^ self comments isNotEmpty
]

{ #category : #accessing }
FamixTWithComments >> numberOfComments [
	<FMProperty: #numberOfComments type: #Number>
	<derived>
	<MSEComment: 'The number of comments in a class'>
	^ self
		lookUpPropertyNamed: #numberOfComments
		computedAs: [ self comments size
				+
					(self children asArray
						inject: 0
						into: [ :sum :el | el numberOfComments + sum ]) ]

]

{ #category : #accessing }
FamixTWithComments >> numberOfComments: aNumber [
	self privateState propertyAt: #numberOfComments put: aNumber
]

{ #category : #removing }
FamixTWithComments >> removeComment: aComment [
	self comments remove: aComment
]
