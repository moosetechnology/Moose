"
A RONormalizerTest is xxxxxxxxx.

"
Class {
	#name : #RTNormalizerTest,
	#superclass : #RTTest,
	#category : #'Roassal2-ColorNormalizer-Tests'
}

{ #category : #'gray color' }
RTNormalizerTest >> testGray [

	| n es v c1 c2 |
	v := RTView new.
	es := RTBox elementsOn: (0 to: 255).
	v addAll: es.
	
	n := RTGrayLinearColor new.
	n command: #yourself.
	n scope: (0 to: 255).
	
	self assert: (n rtValue: es first model) = Color white.
	c1 := n rtValue: (es at: 100) model.
	c2 := Color r: 0.612 g: 0.612 b: 0.612 alpha: 1.0.
	self assert:  (c1 red closeTo: c2 red).
	self assert:  (c1 green closeTo: c2 green).
	self assert:  (c1 blue closeTo: c2 blue).
]

{ #category : #multicolor }
RTNormalizerTest >> testMultiColor [

	| n |
	n :=  RTMultiLinearColor new
		colors: (Array with: Color white with: Color black).
	self assert: (n level: 0) = Color white. 
	self assert: (n level: 1.0) = Color black.
	self assert: (n level: 0.5) = (Color r: 0.5 g: 0.5 b: 0.5).
]

{ #category : #multicolor }
RTNormalizerTest >> testMultiColor2 [

	| n |
	n :=  RTMultiLinearColor new
		colors: (Array with: Color white with: Color red with: Color black).
	self assert: (n level: 0) = Color white. 
	self assert: (n level: 1.0) = Color black.
	self assert: (n level: 0.5) = (Color red).
]

{ #category : #multicolor }
RTNormalizerTest >> testMultiColor3 [

	| n |
	n :=  RTMultiLinearColor new
		colors: (Array with: Color white with: Color red with: Color black).
	self assert: (n level: 0) = Color white. 
	self assert: (n level: 1.0) = Color black.
	self assert: (n level: 0.75) = (Color r: 0.5 g: 0.0 b: 0.0).
]

{ #category : #'gray color' }
RTNormalizerTest >> testOnCharacters [

	| es n |
	n := RTGrayLinearColor new 
				command: #asInteger; 
				scope: ($a to: $z).
				
	es := RTBox new
				color: n;
				elementsOn: ($a to: $z).

	self assert: n max = $z asInteger.
	self assert: n min = $a asInteger.
	
	self assert: es first trachelShape color = Color white.
	self assert: es last trachelShape color = Color black.
]
