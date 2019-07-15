"
A RTMultiLinearColorForIdentityTest is a test class for testing the behavior of RTMultiLinearColorForIdentity
"
Class {
	#name : #RTMultiLinearColorForIdentityTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Tests'
}

{ #category : #tests }
RTMultiLinearColorForIdentityTest >> testBasic [

	| n s e |
	n := RTMultiLinearColorForIdentity new 
				command: #first; 
				objects: #(#c1 #c2 #c3 #c4 #c5);
				yourself.
	s := RTBox new color: n.
	e := s elementsOn: #(#(c1) #(c2) #(c3) #(c4) #(c5)).
	RTView new add: e.
	
]

{ #category : #tests }
RTMultiLinearColorForIdentityTest >> testColorOfObject [

	| n s elements |
	n := RTMultiLinearColorForIdentity new 
				command: #first; 
				objects: #(#c1 #c2 #c3 #c4 #c5);
				yourself.
	s := RTBox new color: n.
	elements := s elementsOn: #(#(c1) #(c2) #(c3) #(c4) #(c5)).
	RTGridLayout on: elements.
	RTView new add: elements.
	
	self assert: (n colorOf: #c1) equals: (elements first trachelShape color).
	self assert: (n colorOf: #c5) equals: (elements last trachelShape color).
]

{ #category : #tests }
RTMultiLinearColorForIdentityTest >> testDefaultColor [

	| v wordsToHighlight normalizer shape strings es |
	v := RTView new.
	
	wordsToHighlight := #('all' 'me' 'you').
	normalizer := RTMultiLinearColorForIdentity new.
	normalizer objects: wordsToHighlight.
	normalizer defaultColor: Color yellow.
	shape := RTBox new color: [ :w | normalizer rtValue: w ].
	strings := 'you and me make us all' substrings.
	es := shape elementsOn: strings.
	v addAll: es.
	es @ RTPopup.
	RTHorizontalLineLayout new gapSize: 1; on: es.

	self assert: (v elementFromModel: 'make') trachelShape color equals: Color yellow
]

{ #category : #tests }
RTMultiLinearColorForIdentityTest >> testMultipleColors [

	| v wordsToHighlight normalizer shape strings es |
	v := RTView new.
	
	wordsToHighlight := #('red' 'yellow' 'green' ).
	normalizer := RTMultiLinearColorForIdentity new.
	normalizer colors: (Array with: Color red with: Color yellow with: Color green).
	normalizer objects: wordsToHighlight.
	normalizer defaultColor: Color magenta.
	shape := RTBox new color: normalizer.
	strings := 'red yellow green fa' substrings.
	es := shape elementsOn: strings.
	v addAll: es.
	RTHorizontalLineLayout new gapSize: 1; on: es.

	self assert: (v elementFromModel: 'red') trachelShape color equals: Color red.
	self assert: (v elementFromModel: 'yellow') trachelShape color equals: Color yellow.
	self assert: (v elementFromModel: 'green') trachelShape color equals: Color green.
	self assert: (v elementFromModel: 'fa') trachelShape color equals: Color magenta.
	"playing with the level directly instead of use "
	"common cases"
	self assert: (normalizer level: 0) equals: Color red.
	self assert: (normalizer level: 1) equals: Color green.
	self assert: (normalizer level: 0.5) equals: Color yellow.
	self deny: (normalizer level: 0.30) == Color red.
	self deny: (normalizer level: 0.30) == Color green.
	self deny: (normalizer level: 0.30) == Color yellow.
	"rare cases"
	self assert: (normalizer level: -10) equals: Color red.
	self assert: (normalizer level: 10) equals: Color green.
	
	
]

{ #category : #tests }
RTMultiLinearColorForIdentityTest >> testTwoColors [

	| v wordsToHighlight normalizer shape strings es |
	v := RTView new.
	
	wordsToHighlight := #('green' 'red').
	normalizer := RTMultiLinearColorForIdentity new.
	normalizer colors: (Array with: Color green with: Color red).
	normalizer objects: wordsToHighlight.
	normalizer defaultColor: Color magenta.
	shape := RTBox new color: normalizer.
	strings := 'red yellow green' substrings.
	es := shape elementsOn: strings.
	v addAll: es.
	RTHorizontalLineLayout new gapSize: 1; on: es.

	self assert: (v elementFromModel: 'green') trachelShape color equals: Color green.
	self assert: (v elementFromModel: 'red') trachelShape color equals: Color red.
]
