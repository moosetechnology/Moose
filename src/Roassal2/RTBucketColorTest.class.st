Class {
	#name : #RTBucketColorTest,
	#superclass : #RTTest,
	#category : #'Roassal2-ColorNormalizer-Tests'
}

{ #category : #tests }
RTBucketColorTest >> testGivenCommandAndCollectionDefault [
	|n elements defaultPalette|
	n := RTBucketColor numberOfColors: 5 command: #yourself scope: (1 to: 5).
	defaultPalette := n defaultPalette.
	elements := (RTBox new size: 20; color: n) elementsOn: (1 to: 5).
	"view := RTView new.
	view addAll: elements.
	RTHorizontalLineLayout on: view elements.
	view open."
	(elements collect: #color) with: defaultPalette do: [ :elementColor :realColor |
		self assert: elementColor equals: realColor.
		 ]
	
	
]

{ #category : #tests }
RTBucketColorTest >> testGivenCommandAndCollectionDefault2 [
	|n elements view defaultPalette|
	n := RTBucketColor numberOfColors: 5 command: #yourself scope: (1 to: 30).
	elements := (RTBox new size: 20; color: n) elementsOn: (1 to: 30).
	defaultPalette := n defaultPalette.
	"view := RTView new.
	view addAll: elements.
	RTHorizontalLineLayout on: view elements.
	view open."
	self assert: elements first color equals: defaultPalette first.
	self assert: (elements at: 10) color equals: defaultPalette second.
	self assert: (elements at: 14) color equals: defaultPalette third.
	self assert: (elements at: 22) color equals: defaultPalette fourth.
	self assert: (elements at: 29) color equals: defaultPalette fifth.

	
	
]
