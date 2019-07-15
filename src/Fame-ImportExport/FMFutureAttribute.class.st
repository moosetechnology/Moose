Class {
	#name : #FMFutureAttribute,
	#superclass : #Object,
	#instVars : [
		'name',
		'owner',
		'values',
		'tally'
	],
	#category : #'Fame-ImportExport'
}

{ #category : #'instance creation' }
FMFutureAttribute class >> with: anImporter name: aString [

	^self new with: anImporter name: aString
]

{ #category : #accessing }
FMFutureAttribute >> count [
	^tally
]

{ #category : #accessing }
FMFutureAttribute >> count: aNumber [
	tally := aNumber
]

{ #category : #parsing }
FMFutureAttribute >> endAttribute: aString [ 
	name should = aString.
	self maybeEnd
]

{ #category : #parsing }
FMFutureAttribute >> maybeEnd [
	
	self flag: #faultTolerantParser. "this makes the parser tolerant so some defects in MSE files, not sure we always want that"
	tally = 0 ifTrue: [
		| property |
		property := owner metaDescription attributeNamed: name ifAbsent: [
			owner instance handleFameProperty: name value: values.
			^ self ].
		property setOn: owner instance values: values ]

]

{ #category : #parsing }
FMFutureAttribute >> referenceNumber: serial [
	values
		add:
			(owner owner index
				at: serial
				ifAbsent: [ owner owner dangling: (FMDanglingReference with: self) to: serial ])
]

{ #category : #accessing }
FMFutureAttribute >> values [
	
	^values
]

{ #category : #'initialize-release' }
FMFutureAttribute >> with: aFutureElement name: aString [

	tally := 0.
	name := aString.
	values := OrderedCollection new.
	owner := aFutureElement
]
