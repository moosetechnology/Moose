Class {
	#name : #SmaCCAnnotatedStringInterval,
	#superclass : #SmaCCStringInterval,
	#instVars : [
		'annotations'
	],
	#category : #'SmaCC_Rewrite_Engine'
}

{ #category : #public }
SmaCCAnnotatedStringInterval >> addAllAnnotations: aCollection [
	self annotations addAll: aCollection
]

{ #category : #public }
SmaCCAnnotatedStringInterval >> addAnnotation: aSmaCCRewriteAnnotation [
	| collection |
	collection := self annotations.
	(collection notEmpty
		and: [ collection last = aSmaCCRewriteAnnotation ])
		ifTrue: [ ^ self ].
	collection add: aSmaCCRewriteAnnotation
]

{ #category : #public }
SmaCCAnnotatedStringInterval >> annotations [
	^ annotations ifNil: [ annotations := OrderedCollection new: 2 ]
]

{ #category : #public }
SmaCCAnnotatedStringInterval >> annotations: aSequenceableCollection [
	annotations := aSequenceableCollection
]

{ #category : #testing }
SmaCCAnnotatedStringInterval >> canBeMergedWith: nextSmaCCStringInterval [
	"We want to keep the annotations, so we don't allow merging"

	^ false
]

{ #category : #testing }
SmaCCAnnotatedStringInterval >> postCopy [
	super postCopy.
	annotations := annotations copy
]
