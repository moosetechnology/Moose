Class {
	#name : #SmaCCRewriteLink,
	#superclass : #Object,
	#instVars : [
		'rewrite',
		'next'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #accessing }
SmaCCRewriteLink >> next [
	^ next
]

{ #category : #accessing }
SmaCCRewriteLink >> next: anObject [
	next := anObject
]

{ #category : #printing }
SmaCCRewriteLink >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPut: $(;
		nextPutAll: rewrite displayString;
		nextPut: $)
]

{ #category : #accessing }
SmaCCRewriteLink >> rewrite [
	^ rewrite
]

{ #category : #accessing }
SmaCCRewriteLink >> rewrite: anObject [
	rewrite := anObject
]
