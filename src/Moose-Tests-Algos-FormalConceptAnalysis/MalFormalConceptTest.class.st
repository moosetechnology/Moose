Class {
	#name : #MalFormalConceptTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Algos-FormalConceptAnalysis'
}

{ #category : #initialization }
MalFormalConceptTest >> initializeContext [
	| data fca context lattice |
	data := #(#(#Cat #(#fourlegs #hair)) #(#Dog #(#smart #fourlegs #hair)) #(#Dolphin #(#smart #marine)) #(#Gibbon #(#hair #smart #thumbed)) #(#Man #(#smart #thumbed #hair #marine)) #(#Whale #(#smart #marine))).
	fca := MalFormalContext new.
	^context := fca with: data using: #first using: #last.

]

{ #category : #tests }
MalFormalConceptTest >> testMammals [
	| fca concept |
	fca := self initializeContext.
	concept := fca concepts at: 2.
	self assert: concept numAttributes equals: 4.
	self assert: concept numObjects equals: 1.
	self assert: concept intent equals: 30.
	self assert: concept extent equals: 16
]
