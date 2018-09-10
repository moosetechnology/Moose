Class {
	#name : #DudeNoiseCleanerTest,
	#superclass : #TestCase,
	#category : #'SmallDude-Tests-Text'
}

{ #category : #testing }
DudeNoiseCleanerTest >> testCleanAllNoises [
	| aNoiseCleaner text cleanText |
	aNoiseCleaner := DudeNoiseCleaner new.
	text := OrderedCollection new.
	text add: 'b{la break;bl}a'.
	text add: 'buelsebu'.
	cleanText := aNoiseCleaner specificClean: text.
	self assert: (cleanText at: 1) equals: 'bla bla'.
	self assert: (cleanText at: 2) equals: 'bubu'
]

{ #category : #testing }
DudeNoiseCleanerTest >> testCleanBreak [
	| aNoiseCleaner text cleanText |
	aNoiseCleaner := DudeNoiseCleaner new.
	text := OrderedCollection new.
	text add: 'bla break;bla'.
	text add: 'bubu'.
	cleanText := aNoiseCleaner specificClean: text.
	self assert: (cleanText at: 1) equals: 'bla bla'.
	self assert: (cleanText at: 2) equals: 'bubu'
]

{ #category : #testing }
DudeNoiseCleanerTest >> testCleanElse [
	| aNoiseCleaner text cleanText |
	aNoiseCleaner := DudeNoiseCleaner new.
	text := OrderedCollection new.
	text add: 'bla bla else bla else'.
	text add: 'bubu'.
	text add: 'else'.
	cleanText := aNoiseCleaner specificClean: text.
	self assert: (cleanText at: 1) equals: 'bla bla  bla '.
	self assert: (cleanText at: 2) equals: 'bubu'.
	self assert: (cleanText at: 3) equals: ''
]

{ #category : #testing }
DudeNoiseCleanerTest >> testGetNoise [
	| aNoiseCleaner noises |
	aNoiseCleaner := DudeNoiseCleaner new.
	noises := aNoiseCleaner getNoise.
	self assert: (noises at: 1) equals: 'break;'.
	self assert: (noises at: 2) equals: 'else'.
	self assert: (noises at: 3) equals: '{'.
	self assert: (noises at: 4) equals: '}'
]
