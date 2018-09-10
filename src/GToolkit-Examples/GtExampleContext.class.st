"
I am a utility that holds custom contextual information about the current example.
"
Class {
	#name : #GtExampleContext,
	#superclass : #IdentityDictionary,
	#instVars : [
		'example'
	],
	#category : #'GToolkit-Examples-Runtime'
}

{ #category : #accessing }
GtExampleContext >> example [
	^ example
]

{ #category : #accessing }
GtExampleContext >> example: anObject [
	example := anObject
]
