Class {
	#name : #SmaCCRewriteCompleteResult,
	#superclass : #SmaCCRewriteResult,
	#instVars : [
		'inputSource',
		'outputSource',
		'transformedString',
		'additionalFiles'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #accessing }
SmaCCRewriteCompleteResult >> addFile: aSmaCCString named: aString [
	self additionalFiles at: aString put: aSmaCCString
]

{ #category : #accessing }
SmaCCRewriteCompleteResult >> additionalFiles [
	^ additionalFiles ifNil: [ additionalFiles := Dictionary new ]
]

{ #category : #accessing }
SmaCCRewriteCompleteResult >> inputSource [
	^ inputSource
]

{ #category : #accessing }
SmaCCRewriteCompleteResult >> inputSource: aString [
	inputSource := aString
]

{ #category : #accessing }
SmaCCRewriteCompleteResult >> outputSource [
	^ outputSource
]

{ #category : #accessing }
SmaCCRewriteCompleteResult >> outputSource: aString [
	outputSource := aString
]

{ #category : #accessing }
SmaCCRewriteCompleteResult >> smaccStringClass [
	^ SmaCCAnnotatedString
]

{ #category : #accessing }
SmaCCRewriteCompleteResult >> transformedString [
	^ transformedString
]

{ #category : #accessing }
SmaCCRewriteCompleteResult >> transformedString: aSmaCCAnnotatedString [
	transformedString := aSmaCCAnnotatedString
]
