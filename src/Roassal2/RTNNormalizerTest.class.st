"
A RONormalizerTest is xxxxxxxxx.

"
Class {
	#name : #RTNNormalizerTest,
	#superclass : #RTTest,
	#category : #'Roassal2-ColorNormalizer-Tests'
}

{ #category : #identity }
RTNNormalizerTest >> testBeginingAtBlue [

	| n |
	n := RTNIdentityNormalizer beginingAtBlue.
	self assert: n nextColor = Color blue
]

{ #category : #identity }
RTNNormalizerTest >> testBeginingAtRed [

	| n |
	n := RTNIdentityNormalizer beginingAtRed.
	self assert: n nextColor = Color red
]

{ #category : #'explicit identity' }
RTNNormalizerTest >> testExplicitIdentity [
	| normalizer colorOne colorTwo |
	
	normalizer := RTNExplicitIdentityNormalizer 
						withCommand: #last 
						withColors: (Array with: Color blue with: Color white with: Color red) 
						withDefaultColor: Color green.
						
	colorOne := normalizer rtValue: 'alex'.
	colorTwo := normalizer rtValue: 'suffix'.
	self assert: (colorOne = colorTwo)


]

{ #category : #tests }
RTNNormalizerTest >> testExplicitIdentity2 [
	| normalizer |
	
	normalizer := RTNExplicitIdentityNormalizer
					withCommand: #yourself
					withColors: (Array with: Color blue with: Color white with: Color red) 
					withDefaultColor: Color green.						

	self assert: (normalizer rtValue: 1) = Color blue.
	self assert: (normalizer rtValue: 2) = Color white.
	self assert: (normalizer rtValue: 3) = Color red.
	self assert: (normalizer rtValue: -1) = Color green.
	self assert: (normalizer rtValue: 1000) = Color green.
]

{ #category : #'explicit identity' }
RTNNormalizerTest >> testExplicitIdentity3Initialization [
	| normalizer colors |
	
	colors := Array with: Color blue with: Color white with: Color red.
	normalizer := RTNExplicitIdentityNormalizer
					withCommand: #yourself
					withColors: colors
					withDefaultColor: Color green.						
											
	self assert: (normalizer rtValue: 1) = Color blue.
	self assert: (normalizer rtValue: 2) = Color white.
	self assert: (normalizer rtValue: 3) = Color red.
	self assert: (normalizer rtValue: 4) = Color green.
]

{ #category : #linear }
RTNNormalizerTest >> testGradient [
	| normalizer |

	normalizer := RTNColorLinearNormalizer inContext: #(0 1 2 3 4 5 6 7 8 9 10) lowColor: Color yellow highColor: Color red.
	self assert: (normalizer maximumValue: nil) = 10.
	self assert: (normalizer rtValue: 10) =  (Color r: 1.0 g: 0.0 b: 0.0). 
	self assert: (normalizer rtValue: 1) = (Color r: 1.0 g: 0.900012 b: 0.0).
	self assert: (normalizer rtValue: 0) =  (Color r: 1.0 g: 1.0 b: 0.0)
]

{ #category : #identity }
RTNNormalizerTest >> testIdentity [
	| colorOne colorTwo normalizer |
	
	normalizer := RTNIdentityNormalizer new.
	colorOne := normalizer rtValue: 1.
	colorTwo := normalizer rtValue: 2.
	self deny: colorOne = colorTwo.

	colorOne := normalizer rtValue: 12.
	colorTwo := normalizer rtValue: 12.
	self assert: colorOne = colorTwo.
]

{ #category : #identity }
RTNNormalizerTest >> testIdentityModulo [
	"This checks that there is no exception if there are more identities than colors"

	1 to: 150 do: [:index | RTNIdentityNormalizer new rtValue: index]
]

{ #category : #identity }
RTNNormalizerTest >> testIdentityWithCommand [
	| colorOne colorTwo normalizer |
	
	normalizer := RTNIdentityNormalizer withCommand: #last.
	colorOne := normalizer rtValue: 'bob'.
	colorTwo := normalizer rtValue: 'tom'.
	self deny: colorOne = colorTwo.

	colorOne := normalizer rtValue: 'anna'.
	colorTwo := normalizer rtValue: 'maria'.
	self assert: colorOne = colorTwo.
]

{ #category : #multiple }
RTNNormalizerTest >> testMultipleLinearNormalizer [
	| normalizer |

	normalizer := RTMultipleColorLinearNormalizer 
					valueRange: #(5 10 15) colorRange: (Array with: Color blue with: Color white with: Color red) .
	
	self assert: (normalizer rtValue: 5) =  (Color r: 0.0 g: 0.0 b: 1.0).
	self assert: (normalizer rtValue: 6) =  (Color r: 0.2 g: 0.2 b: 1.0). 
	self assert: (normalizer rtValue: 15) = (Color r: 1.0 g: 0.0 b: 0.0)
]

{ #category : #linear }
RTNNormalizerTest >> testNumberLinearNormalizer [
	| normalizer |
	normalizer := RTNumberLinearNormalizer inContext: (1 to: 10) withCommand: [:entity | entity * 1000 ].
	self assert: (normalizer rtValue: 100) = 10.
	
	normalizer := RTNumberLinearNormalizer inContext: (1 to: 100) withCommand: [:entity | entity * 1000 ].
	self assert: (normalizer rtValue: 100) = 1.
	
	normalizer := RTNumberLinearNormalizer inContext: (1 to: 100) withCommand: [:entity | entity ].
	self assert: (normalizer rtValue: 100) = 1.

]

{ #category : #linear }
RTNNormalizerTest >> testValueLinearNormalizer [

	| normalizer |
	normalizer := RTValueLinearNormalizer inContext: (0 to: 10) withCommand: [:entity | entity ].
	self assert: (normalizer rtValue: 10) = 1.
	
	normalizer := RTValueLinearNormalizer inContext: (0 to: 10) withCommand: [:entity | entity * 1000 ].
	self assert: (normalizer rtValue: 100) = 10.
	
	normalizer := RTValueLinearNormalizer inContext: (99 to: 100) withCommand: [:entity | entity ].
	self assert: (normalizer rtValue: 101) = 2.
]
