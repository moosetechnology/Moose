"
I model version numbers. I am comparable and I define a natural order.
"
Class {
	#name : #GRVersion,
	#superclass : #GRObject,
	#instVars : [
		'major',
		'minor',
		'revision',
		'stageLabel',
		'stageNumber'
	],
	#category : #'Grease-Core'
}

{ #category : #'instance creation' }
GRVersion class >> major: majorInteger [
	^ self major: majorInteger minor: nil
]

{ #category : #'instance creation' }
GRVersion class >> major: majorInteger minor: minorInteger [
	^ self major: majorInteger minor: minorInteger revision: nil
]

{ #category : #'instance creation' }
GRVersion class >> major: majorInteger minor: minorInteger revision: revisionInteger [
	^ self basicNew
		initializeWithMajor: majorInteger minor: minorInteger revision: revisionInteger;
		yourself
]

{ #category : #'instance creation' }
GRVersion class >> new [
	^ self major: 1
]

{ #category : #comparing }
GRVersion >> < otherVersion [
	(major < otherVersion major) ifTrue: [ ^ true ].
	(otherVersion major < major) ifTrue: [ ^ false ].
	((minor ifNil: [ 0 ]) < (otherVersion minor ifNil: [ 0 ])) ifTrue: [ ^ true ].
	((otherVersion minor ifNil: [ 0 ]) < (minor ifNil: [ 0 ])) ifTrue: [ ^ false ].
	((revision ifNil: [ 0 ]) < (otherVersion revision ifNil: [ 0 ])) ifTrue: [ ^ true ].
	((otherVersion revision ifNil: [ 0 ]) < (revision ifNil: [ 0 ])) ifTrue: [ ^ false ].
	(stageLabel = otherVersion stage) ifTrue: [
		^ ((stageNumber ifNil: [ 1 ]) < (otherVersion stageNumber ifNil: [ 1 ])) ].
	stageLabel isNil ifTrue: [ ^ false ].
	otherVersion stage isNil ifTrue: [ ^ true ].
	^ stageLabel < otherVersion stage
	
	
]

{ #category : #comparing }
GRVersion >> <= otherVersion [
	^ (self > otherVersion) not
]

{ #category : #comparing }
GRVersion >> = otherVersion [
	^ (major = otherVersion major) and: [
		((minor ifNil: [ 0 ]) = (otherVersion minor ifNil: [ 0 ])) and: [
		((revision ifNil: [ 0 ] ) = (otherVersion revision ifNil: [ 0 ])) and: [
		(stageLabel = otherVersion stage) and: [
		(stageNumber ifNil: [ 1 ]) = (otherVersion stageNumber ifNil: [ 1 ]) ] ] ] ]
]

{ #category : #comparing }
GRVersion >> > otherVersion [
	^ otherVersion < self
]

{ #category : #comparing }
GRVersion >> >= otherVersion [
	^ (self < otherVersion) not
]

{ #category : #convenience }
GRVersion >> beAlpha [
	self beAlpha: nil
]

{ #category : #convenience }
GRVersion >> beAlpha: anInteger [
	self stage: #alpha number: anInteger
]

{ #category : #convenience }
GRVersion >> beBeta [
	self beBeta: nil
]

{ #category : #convenience }
GRVersion >> beBeta: anInteger [
	self stage: #beta number: anInteger
]

{ #category : #convenience }
GRVersion >> beFinal [
	self stage: nil number: nil
]

{ #category : #convenience }
GRVersion >> beReleaseCandidate [
	self beReleaseCandidate: nil
]

{ #category : #convenience }
GRVersion >> beReleaseCandidate: anInteger [
	self stage: #rc number: anInteger
]

{ #category : #converting }
GRVersion >> greaseString [
	^ String streamContents: [ :stream |
		stream nextPutAll: major greaseString.
		stream nextPut: $..
		stream nextPutAll: (minor ifNil: [ 0 ]) greaseString.
		revision isNil ifFalse: [
			stream nextPut: $..
			stream nextPutAll: revision greaseString ].
		stageLabel isNil ifFalse: [
			stream nextPutAll: stageLabel greaseString.
			stageNumber isNil ifFalse: [ stream nextPutAll: stageNumber greaseString ] ] ]
]

{ #category : #comparing }
GRVersion >> hash [
	^ (major hash bitXor: minor hash) bitXor: revision hash
]

{ #category : #initialization }
GRVersion >> initializeWithMajor: majorInteger minor: minorInteger revision: revisionInteger [
	self initialize.
	major := majorInteger.
	minor := minorInteger.
	revision := revisionInteger
]

{ #category : #testing }
GRVersion >> isAlpha [
	^ stageLabel = #alpha
]

{ #category : #testing }
GRVersion >> isBeta [
	^ stageLabel = #beta
]

{ #category : #testing }
GRVersion >> isFinal [
	^ stageLabel isNil
]

{ #category : #testing }
GRVersion >> isReleaseCandidate [
	^ stageLabel = #rc
]

{ #category : #accessing }
GRVersion >> major [
	^ major
]

{ #category : #accessing }
GRVersion >> major: anInteger [
	major := anInteger
]

{ #category : #accessing }
GRVersion >> minor [
	^ minor
]

{ #category : #accessing }
GRVersion >> minor: anInteger [
	minor := anInteger
]

{ #category : #accessing }
GRVersion >> revision [
	^ revision
]

{ #category : #accessing }
GRVersion >> revision: anInteger [
	revision := anInteger
]

{ #category : #accessing }
GRVersion >> stage [
	^ stageLabel
]

{ #category : #accessing }
GRVersion >> stage: aSymbol number: anInteger [
	stageLabel := aSymbol.
	stageNumber := anInteger
]

{ #category : #accessing }
GRVersion >> stageNumber [
	^ stageNumber
]
