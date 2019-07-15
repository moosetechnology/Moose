Class {
	#name : #DudeLevenshteinDistanceStrategyTest,
	#superclass : #TestCase,
	#category : #'SmallDude-Tests-Core'
}

{ #category : #testing }
DudeLevenshteinDistanceStrategyTest >> testLevenshteinDistanceAdd [
	| aLevenshteinDistanceStrategy |
	aLevenshteinDistanceStrategy := DudeLevenshteinDistanceStrategy threshold: 2.
	self assert: (aLevenshteinDistanceStrategy levenshteinDistanceSource: 'ana' target: 'anna') equals: 1
]

{ #category : #testing }
DudeLevenshteinDistanceStrategyTest >> testLevenshteinDistanceAddAndModify [
	| aLevenshteinDistanceStrategy |
	aLevenshteinDistanceStrategy := DudeLevenshteinDistanceStrategy threshold: 2.
	self assert: (aLevenshteinDistanceStrategy levenshteinDistanceSource: 'ana' target: 'abba') equals: 2
]

{ #category : #testing }
DudeLevenshteinDistanceStrategyTest >> testLevenshteinDistanceModify [
	| aLevenshteinDistanceStrategy |
	aLevenshteinDistanceStrategy := DudeLevenshteinDistanceStrategy threshold: 2.
	self assert: (aLevenshteinDistanceStrategy levenshteinDistanceSource: 'ata' target: 'ana') equals: 1
]

{ #category : #testing }
DudeLevenshteinDistanceStrategyTest >> testLevenshteinDistanceMultipleChanges [
	| aLevenshteinDistanceStrategy |
	aLevenshteinDistanceStrategy := DudeLevenshteinDistanceStrategy threshold: 2.
	self assert: (aLevenshteinDistanceStrategy levenshteinDistanceSource: 'nloev' target: 'novel') equals: 3
]

{ #category : #testing }
DudeLevenshteinDistanceStrategyTest >> testLevenshteinDistanceSubstract [
	| aLevenshteinDistanceStrategy |
	aLevenshteinDistanceStrategy := DudeLevenshteinDistanceStrategy threshold: 2.
	self assert: (aLevenshteinDistanceStrategy levenshteinDistanceSource: 'anca' target: 'ana') equals: 1
]

{ #category : #testing }
DudeLevenshteinDistanceStrategyTest >> testLevenshteinDistanceSwitch [
	| aLevenshteinDistanceStrategy |
	aLevenshteinDistanceStrategy := DudeLevenshteinDistanceStrategy threshold: 2.	"	self halt."
	self assert: (aLevenshteinDistanceStrategy levenshteinDistanceSource: 'abc' target: 'acb') equals: 2
]

{ #category : #testing }
DudeLevenshteinDistanceStrategyTest >> testMin [
	| aLevenshteinDistanceStrategy |
	aLevenshteinDistanceStrategy := DudeLevenshteinDistanceStrategy threshold: 2.
	self assert: (aLevenshteinDistanceStrategy minFirst: 3 second: 2 third: -1) equals: -1.
	self assert: (aLevenshteinDistanceStrategy minFirst: -3 second: 2 third: 1) equals: -3.
	self assert: (aLevenshteinDistanceStrategy minFirst: 3 second: -2 third: 1) equals: -2
]

{ #category : #testing }
DudeLevenshteinDistanceStrategyTest >> testNormalizedDistance [
	| aLevenshteinDistanceStrategy |
	aLevenshteinDistanceStrategy := DudeLevenshteinDistanceStrategy threshold: 2.
	self assert: (aLevenshteinDistanceStrategy normalizedDistanceSource: 'abcd' target: 'acbd') equals: 0.5
]

{ #category : #testing }
DudeLevenshteinDistanceStrategyTest >> testNotSimilar [ 
	 
	| aLevenshteinDistanceStrategy | 
	aLevenshteinDistanceStrategy := DudeLevenshteinDistanceStrategy threshold: 
			0.3. 
	self 
		assert: 
			(aLevenshteinDistanceStrategy similarSource: 'abcd' target: 'acbd') not
]

{ #category : #testing }
DudeLevenshteinDistanceStrategyTest >> testSimilar [ 
	 
	| aLevenshteinDistanceStrategy | 
	aLevenshteinDistanceStrategy := DudeLevenshteinDistanceStrategy threshold: 
			2. 
	self 
		assert: 
			(aLevenshteinDistanceStrategy similarSource: 'abcd' target: 'acbd')
]

{ #category : #testing }
DudeLevenshteinDistanceStrategyTest >> testSub [
	| aLevenshteinDistanceStrategy |
	aLevenshteinDistanceStrategy := DudeLevenshteinDistanceStrategy threshold: 2.
	self
		assert:
			(aLevenshteinDistanceStrategy
				subFirstString: 'alsd'
				firstPos: 2
				secondString: 'ldsf'
				secondPos: 1)
		equals: 0.
	self
		assert:
			(aLevenshteinDistanceStrategy
				subFirstString: 'alsd'
				firstPos: 2
				secondString: 'ldsf'
				secondPos: 2)
		equals: 1.
	self
		assert:
			(aLevenshteinDistanceStrategy
				subFirstString: 'alsd'
				firstPos: 2
				secondString: 'ldlf'
				secondPos: 3)
		equals: 0.
	self
		assert:
			(aLevenshteinDistanceStrategy
				subFirstString: 'alsd'
				firstPos: 2
				secondString: 'adsf'
				secondPos: 1)
		equals: 1
]
