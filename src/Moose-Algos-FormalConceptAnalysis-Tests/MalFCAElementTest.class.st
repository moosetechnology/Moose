Class {
	#name : #MalFCAElementTest,
	#superclass : #TestCase,
	#category : #'Moose-Algos-FormalConceptAnalysis-Tests'
}

{ #category : #initialization }
MalFCAElementTest >> initializeContext [
	| data |
	data := #(#(#Cat #(#fourlegs #hair)) #(#Dog #(#smart #fourlegs #hair)) #(#Dolphin #(#smart #marine)) #(#Gibbon #(#hair #smart #thumbed)) #(#Man #(#smart #thumbed #hair #marine)) #(#Whale #(#smart #marine))).
	^ MalFormalContext new with: data using: #first using: #last.

]

{ #category : #tests }
MalFCAElementTest >> testMammals [
	| fca element |
	fca := self initializeContext.
	element := (fca concepts at: 2) attributes at: 1.
	self assert: element bits equals: 27.
	self assert: element value equals: #hair.
	self assert: element mask equals: 2
]
