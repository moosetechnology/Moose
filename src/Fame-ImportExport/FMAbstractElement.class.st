Class {
	#name : #FMAbstractElement,
	#superclass : #Object,
	#instVars : [
		'name',
		'attributes',
		'serial'
	],
	#category : #'Fame-ImportExport'
}

{ #category : #accessing }
FMAbstractElement >> attributes [
	^ attributes
]

{ #category : #'initialize-release' }
FMAbstractElement >> initialize [
	
	attributes := Dictionary new.
]

{ #category : #accessing }
FMAbstractElement >> name [
	^ name
]

{ #category : #accessing }
FMAbstractElement >> name: anObject [
	name := anObject
]

{ #category : #infering }
FMAbstractElement >> packageName [
	| pos |
	pos := name lastIndexOf: $..
	pos should > 0.
	^ name 
		copyFrom: 1
		to: pos - 1
]

{ #category : #accessing }
FMAbstractElement >> serial [
	^serial
]

{ #category : #infering }
FMAbstractElement >> serial: anInteger [ 
	
	serial := anInteger
]

{ #category : #infering }
FMAbstractElement >> simpleName [
	| pos |
	pos := name lastIndexOf: $..
	pos should > 0.
	^ name 
		copyFrom: pos + 1
		to: name size
]
