"
A RTTextWord represents one word of an original text.

Instance Variables
	interval:		<Interval>
	text:		<String | Text>

interval
	- interval of the word in the original text

text
	- word, a part of the orignal text
"
Class {
	#name : #RTTextWord,
	#superclass : #RTObject,
	#instVars : [
		'interval',
		'text'
	],
	#category : #'Roassal2-Builder-TextBuilder'
}

{ #category : #accessing }
RTTextWord >> interval [
	^ interval
]

{ #category : #accessing }
RTTextWord >> interval: aCollection [ 
	interval := aCollection
]

{ #category : #accessing }
RTTextWord >> text [
	^ text
]

{ #category : #accessing }
RTTextWord >> text: aString [ 
	text := aString
]
