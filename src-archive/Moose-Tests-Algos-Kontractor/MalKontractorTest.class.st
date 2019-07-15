Class {
	#name : #MalKontractorTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Algos-Kontractor'
}

{ #category : #testing }
MalKontractorTest >> testCutAndContract [
	"self debug: #testCutAndContract"

	self
		assert: (MalKontractor new 
					wordsToBeRemoved: #('Seaside' 'Citezen') ; 
					removeWordsIn: 'Citezen-hello')
		equals: '-hello'.

	self
		assert: (MalKontractor new 
					wordsToBeRemoved: #('Seaside' 'Citezen') ; 
					removeWordsIn: 'Citezen-hello-Seaside')
		equals: '-hello-' 

]

{ #category : #testing }
MalKontractorTest >> testFrequency [
	self assert: ((MalKontractor toSize: 3) letterFrequency: 'h') equals: 0.737
]

{ #category : #testing }
MalKontractorTest >> testNew [
	| k |
	k := MalKontractor upTo: 3.
	self assert: k upTo equals: 3
]

{ #category : #testing }
MalKontractorTest >> testReduce [
	"self debug: #testReduce"

	self assert: ((MalKontractor upTo: 4) reduce: 'hello') equals: 'hllo'.
	self assert: ((MalKontractor upTo: 3) reduce: 'hello') equals: 'hlo'.
	self assert: ((MalKontractor upTo: 3) reduce: 'hell!-o') equals: 'hlo'
]

{ #category : #testing }
MalKontractorTest >> testReduceInPresenceOfChop [
	"self debug: #testReduceInPresenceOfChop"

	self assert: ((MalKontractor new wordsToBeRemoved: #('Seaside') ; upTo: 4) reduce: 'SeasidehelloSeaside') equals: 'hllo'
]

{ #category : #testing }
MalKontractorTest >> testReduceInPresenceOfSpace [
	"self debug: #testReduceInPresenceOfSpace"

	self assert: (MalKontractor reduce: 'hello world' upTo: 6) equals: 'howold'.
	self assert: (MalKontractor reduce: 'hello world' upTo: 5) equals: 'howod'
]

{ #category : #testing }
MalKontractorTest >> testReduceUnknownCharacter [
	"self debug: #testReduce"

	"J is not in the map."

	self assert: ((MalKontractor upTo: 4) reduce: 'Jieiei') equals: 'Jiii'.
	self assert: ((MalKontractor upTo: 4) reduce: 'Jieieriz') equals: 'iiiz'.
	self assert: ((MalKontractor upTo: 4) reduce: 'Jieierjg') equals: 'iijg'
]

{ #category : #testing }
MalKontractorTest >> testRemoveOne [
	self assert: ((MalKontractor upTo: 3) removeOne: 'hello') equals: 'hllo'.
	self assert: ((MalKontractor upTo: 3) removeOne: 'hllo') equals: 'hlo'
]
