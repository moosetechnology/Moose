"
FAMIXComment represents one instance of a comment (in the sense of programming language comments) for any Famix sourced entity. The commented sourced entity is called the container in the FAMIX model.
"
Trait {
	#name : #FamixTComment,
	#instVars : [
		'#container => FMOne type: #FamixTWithComments opposite: #comments',
		'#content => FMProperty'
	],
	#category : #'Famix-Traits-Comment'
}

{ #category : #meta }
FamixTComment classSide >> annotation [

	<FMClass: #TComment super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #'instance creation' }
FamixTComment classSide >> content: aString [
	^ self new
		content: aString;
		yourself
]

{ #category : #accessing }
FamixTComment >> container [
	"Relation named: #container type: #FamixTWithComments opposite: #comments"

	<generated>
	<FMComment: 'Source code entity containing the comment'>
	^ container
]

{ #category : #accessing }
FamixTComment >> container: anObject [

	container := anObject.
	self resetMooseName.

]

{ #category : #accessing }
FamixTComment >> content [

	<FMProperty: #content type: #String>
	<generated>
	<FMComment: 'Content of the comment as a String'>
	^ content
]

{ #category : #accessing }
FamixTComment >> content: anObject [
	<generated>
	content := anObject
]
