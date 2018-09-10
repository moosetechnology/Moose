"
I am root of hierarchy of string specifications.

I provide requiredSubstring and caseSensitive properties. And my subclasses should use them accordingly their logic. 

Instance should be created using following messages: 

	SpecOfString requiredSubstring: 'test'.
	SpecOfString requiredSubstring: 'test' caseSensitive: false

My default I am not case sensitive.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	caseSensitive:		<Boolean>
	requiredSubstring:		<String>
"
Class {
	#name : #SpecOfString,
	#superclass : #SpecOfObjectValue,
	#instVars : [
		'caseSensitive'
	],
	#category : 'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfString class >> requiredValue: aString caseSensitive: aBool [

	^(self requiredValue: aString)
		caseSensitive: aBool
]

{ #category : #accessing }
SpecOfString >> caseSensitive [
	^ caseSensitive
]

{ #category : #accessing }
SpecOfString >> caseSensitive: anObject [
	caseSensitive := anObject
]

{ #category : #accessing }
SpecOfString >> defaultTitle [

	^caseSensitive
		ifFalse: [ super defaultTitle ]
		ifTrue: [ super defaultTitle , ' case sensitive' ] 
]

{ #category : #'initialize-release' }
SpecOfString >> initialize [
	super initialize.
	
	caseSensitive := false
]
