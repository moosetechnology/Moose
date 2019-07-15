Trait {
	#name : #FamixTWithComments,
	#instVars : [
		'#comments => FMMany type: #FamixTComment opposite: #container'
	],
	#category : #'Famix-Traits-Comment'
}

{ #category : #meta }
FamixTWithComments classSide >> annotation [

	<MSEClass: #TWithComments super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithComments classSide >> generatedSlotNames [
	<generated>
	'FamixTWithComments class>>#generatedSlotNames'.
	^ #(comments)
]

{ #category : #generator }
FamixTWithComments classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTWithComments >> comments [

	<generated>
	<MSEComment: 'list of comments defined in the entity'>
	^ comments
]

{ #category : #accessing }
FamixTWithComments >> comments: anObject [

	<generated>
	comments value: anObject

]

{ #category : #testing }
FamixTWithComments >> hasComments [
	^ self comments isEmpty not
]

{ #category : #accessing }
FamixTWithComments >> numberOfComments [
	<MSEProperty: #numberOfComments type: #Number>
	<derived>
	<MSEComment: 'The number of comments in a class'>

	^ self lookUpPropertyNamed: #numberOfComments computedAs: [
		self comments size + 
		(self methods asArray inject: 0 into: [:sum : el| 
			el numberOfComments + sum ]) ]
]

{ #category : #accessing }
FamixTWithComments >> numberOfComments: aNumber [

	self privateState propertyAt: #numberOfComments put: aNumber
]

{ #category : #removing }
FamixTWithComments >> privateAddComment: aComment [
	self comments add: aComment 
]

{ #category : #removing }
FamixTWithComments >> removeComment: aComment [
	self comments remove: aComment
]
