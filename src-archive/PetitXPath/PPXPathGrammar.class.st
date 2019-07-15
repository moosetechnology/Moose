Class {
	#name : #PPXPathGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'node',
		'nameToken',
		'attributeNameToken',
		'index',
		'path',
		'multiple',
		'attributeFilter',
		'string',
		'whitespace'
	],
	#category : #'PetitXPath-Core'
}

{ #category : #accessing }
PPXPathGrammar >> attributeFilter [
	^ self attributeFilterAssigned / self attributeFilterPresent
]

{ #category : #accessing }
PPXPathGrammar >> attributeFilterAssigned [
	^ $[ asParser, whitespace, attributeNameToken, whitespace, $= asParser, whitespace, string, whitespace, $] asParser 
		==> [ :nodes | 
			Array 
				with: nodes third
				with: nodes seventh ]
]

{ #category : #accessing }
PPXPathGrammar >> attributeFilterPresent [
	^ $[ asParser, whitespace, attributeNameToken, whitespace, $] asParser 
		==> [ :nodes | 
			Array 
				with: nodes third
				with: '*' ]
]

{ #category : #accessing }
PPXPathGrammar >> attributeNameToken [
	^ ($@ asParser, ((#letter asParser / $_ asParser / $- asParser) plus)) flatten
]

{ #category : #accessing }
PPXPathGrammar >> index [ 
	^$[ asParser, #digit asParser plus, $] asParser 
		==> [ :nodes | Number readFrom: nodes second readStream ]
]

{ #category : #accessing }
PPXPathGrammar >> multiple [
	^$* asParser
]

{ #category : #accessing }
PPXPathGrammar >> nameToken [
	^ (#letter asParser / $_ asParser / $- asParser) plus flatten
]

{ #category : #accessing }
PPXPathGrammar >> node [ 
	^nameToken, (multiple | index | attributeFilter) optional
]

{ #category : #accessing }
PPXPathGrammar >> path [ 
	^$/ asParser optional, node, ($/ asParser, node ==> #second) star 
		==> [ :nodes | 
			OrderedCollection new
				add: nodes second;
				addAll: nodes third;
				asArray ]
]

{ #category : #accessing }
PPXPathGrammar >> start [ 
	^path end
]

{ #category : #accessing }
PPXPathGrammar >> string [
	^$" asParser, $" asParser negate star flatten, $" asParser
		==> [ :nodes | nodes second ]
]

{ #category : #accessing }
PPXPathGrammar >> whitespace [
	^ #space asParser star
]
