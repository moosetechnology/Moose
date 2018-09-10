Class {
	#name : #DudeDummyModel,
	#superclass : #Object,
	#instVars : [
		'codeBase'
	],
	#category : #'SmallDude-Tests-Text'
}

{ #category : #'As yet unclassified' }
DudeDummyModel >> add: anEntity [

	^ nil
]

{ #category : #'As yet unclassified' }
DudeDummyModel >> addEntity: entity [ 
	 
	^nil
]

{ #category : #'As yet unclassified' }
DudeDummyModel >> entityWithName: uniqueName [ 
	 
	^DudeDummyEntity name: uniqueName code: 'I do not care'.
]

{ #category : #'As yet unclassified' }
DudeDummyModel >> silentlyAdd: anEntity [

	^self add: anEntity
]

{ #category : #'As yet unclassified' }
DudeDummyModel >> smallDude [ 
	 
	self halt: 'Not implemented'
]
