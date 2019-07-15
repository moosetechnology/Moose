"
FAMIXComment represents one instance of a comment (in the sense of programming language comments) for any Famix sourced entity. The commented sourced entity is called the container in the FAMIX model.
"
Trait {
	#name : #FamixTComment,
	#instVars : [
		'#container => FMOne type: #FamixTWithComments opposite: #comments',
		'#content'
	],
	#category : #'Famix-Traits-Comment'
}

{ #category : #meta }
FamixTComment classSide >> annotation [

	<MSEClass: #TComment super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #'instance creation' }
FamixTComment classSide >> content: aString [
	^ self new
		content: aString;
		yourself
]

{ #category : #generator }
FamixTComment classSide >> generatedSlotNames [
	<generated>
	'FamixTComment class>>#generatedSlotNames'.
	^ #(container content)
]

{ #category : #generator }
FamixTComment classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTComment >> container [

	<generated>
	<MSEComment: 'Source code entity containing the comment'>
	^ container
]

{ #category : #accessing }
FamixTComment >> container: anObject [

	container := anObject.
	self resetMooseName.

]

{ #category : #accessing }
FamixTComment >> content [

	<MSEProperty: #content type: #String>
	<generated>
	<MSEComment: 'Content of the comment as a String'>
	^ content
]

{ #category : #accessing }
FamixTComment >> content: anObject [

	<generated>
	content := anObject

]
