Class {
	#name : #LIBRoot,
	#superclass : #Object,
	#classInstVars : [
		'tower'
	],
	#category : #'Fame-Example'
}

{ #category : #accessing }
LIBRoot class >> mainLibrary [
	tower isNil ifTrue: [ 
		| pp |
		pp := FMPragmaProcessor new.
		pp queue: (Array with: LIBBook with:  LIBLibrary with:  LIBPerson).
		pp run.
		tower := pp asTower ].
	^tower
]

{ #category : #accessing }
LIBRoot class >> reset [
	tower := nil
]

{ #category : #accessing }
LIBRoot >> metaDescription [
	^self class mainLibrary fameDescriptionFor: self

]

{ #category : #printing }
LIBRoot >> prettyString [
	^ self printString
]
