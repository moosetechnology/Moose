"
I enable icons constructed from varios kinds of data (like byte arrays or base64 strings) to be used as icons for an example.
"
Class {
	#name : #GtExampleFormIcon,
	#superclass : #GtExampleIcon,
	#instVars : [
		'arguments',
		'converter',
		'form'
	],
	#category : #'GToolkit-Examples-Organization'
}

{ #category : #'instance creation' }
GtExampleFormIcon class >> fromBase64String: aString [
	^ self new
		converter: #convertFromBase64String:;
		arguments: { aString };
		yourself
]

{ #category : #'instance creation' }
GtExampleFormIcon class >> fromByteArray: aByteArray [
	^ self new
		converter: #convertFromByteArray:;
		arguments: { aByteArray };
		yourself
]

{ #category : #accessing }
GtExampleFormIcon >> arguments [
	^ arguments
]

{ #category : #accessing }
GtExampleFormIcon >> arguments: anObject [
	arguments := anObject
]

{ #category : #private }
GtExampleFormIcon >> basicForm [
	^ GtExampleMethodIcon 
		perform: self converter 
		withArguments: self arguments
]

{ #category : #accessing }
GtExampleFormIcon >> converter [
	^ converter
]

{ #category : #accessing }
GtExampleFormIcon >> converter: anObject [
	converter := anObject
]

{ #category : #testing }
GtExampleFormIcon >> exists [
	^ self converter notNil
		and: [ (GtExampleMethodIcon includesSelector: self converter)
			and: [ self form notNil ] ]
]

{ #category : #accessing }
GtExampleFormIcon >> form [
	^ form ifNil: [ form := self basicForm ]
]
