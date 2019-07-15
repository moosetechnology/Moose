Class {
	#name : #DudeSourceCodeLine,
	#superclass : #FAMIXEntity,
	#instVars : [
		'text',
		'lineno',
		'entity'
	],
	#category : #'SmallDude-Core'
}

{ #category : #meta }
DudeSourceCodeLine class >> annotation [
	<MSEClass: #SourceCodeLine super: #FAMIXEntity>
	<package: #Dude>
]

{ #category : #'initialize-release' }
DudeSourceCodeLine class >> newText: aString inEntity: entitySource [ 
	 
	^self new initializeText: aString inEntity: entitySource
]

{ #category : #'initialize-release' }
DudeSourceCodeLine class >> newText: aString lineno: anInt inEntity: entitySource [ 
	 
	^self new initializeText: aString lineno: anInt inEntity: entitySource
]

{ #category : #accessing }
DudeSourceCodeLine >> entity [ 
	 
	^entity
]

{ #category : #printing }
DudeSourceCodeLine >> gtDisplayOn: stream [
	 
	stream nextPutAll: 'a SourceCodeLine: '.
	self text notNil ifTrue: [ stream nextPutAll: self text ]
]

{ #category : #'initialize-release' }
DudeSourceCodeLine >> initializeText: aString inEntity: anEntity [ 
	 
	text := aString. 
	entity := anEntity. 
	^self
]

{ #category : #'initialize-release' }
DudeSourceCodeLine >> initializeText: aString lineno: anInt inEntity: anEntity [ 
	 
	text := aString.
	lineno := anInt.
	entity := anEntity. 
	^self
]

{ #category : #accessing }
DudeSourceCodeLine >> lineno [ 
	 
	^lineno
]

{ #category : #accessing }
DudeSourceCodeLine >> lineno: anInt [
	lineno := anInt
]

{ #category : #printing }
DudeSourceCodeLine >> mooseNameOn: stream [
	
	text ifNil: [ stream nextPutAll: ('SourceLine: '). ^ self ].
	stream nextPutAll: ('SourceLine: ' , text)
]

{ #category : #accessing }
DudeSourceCodeLine >> text [ 
	 
	^text
]

{ #category : #accessing }
DudeSourceCodeLine >> text: aText [
	text := aText. 
	^text
]
