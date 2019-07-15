"
A RTForceBasedLayoutTest is a test class for testing the behavior of RTForceBasedLayout
"
Class {
	#name : #RTForceBasedLayoutTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Tests'
}

{ #category : #tests }
RTForceBasedLayoutTest >> classToTest [
	^ RTForceBasedLayout
]

{ #category : #tests }
RTForceBasedLayoutTest >> testBasic [
	| l |
	l := RTForceBasedLayout new.
	self assert: l shouldUseProgressBar.
	
	l doNotUseProgressBar.
	self deny: l shouldUseProgressBar.
]

{ #category : #tests }
RTForceBasedLayoutTest >> testSimpleRun [

	| b |
	b := RTMondrian new.
	b nodes: (1 to: 20).
	b edges connectFrom: [ :v | v // 3 ].
	b build.
	self classToTest new 
		doNotUseProgressBar;
		on: b view elements.
]
