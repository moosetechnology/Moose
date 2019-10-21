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
	^ tower ifNil: [ tower := FMPragmaProcessor towerFrom: {LIBBook . LIBLibrary . LIBPerson} ]
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
