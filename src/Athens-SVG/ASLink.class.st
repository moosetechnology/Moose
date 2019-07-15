Class {
	#name : #ASLink,
	#superclass : #Object,
	#instVars : [
		'url',
		'isId',
		'id'
	],
	#category : #'Athens-SVG'
}

{ #category : #'as yet unclassified' }
ASLink class >> url: aString [

	^ self new url: aString
]

{ #category : #accessing }
ASLink >> id [
	^ id
]

{ #category : #accessing }
ASLink >> isId [
	^ isId == true
]

{ #category : #'as yet unclassified' }
ASLink >> resolveIds: dict [ 
	
	self isId ifTrue: [
		^ dict at: id ifAbsent: [ self error: 'unknown id: ', id ]
		].
	
	self error: 'cannot resolve url: ' , url

]

{ #category : #accessing }
ASLink >> url [
	^ url
]

{ #category : #accessing }
ASLink >> url: aString [
	url := aString.
	
	isId := url first = $#.
	isId ifTrue: [ id := url allButFirst ]
]
