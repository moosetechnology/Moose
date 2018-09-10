Class {
	#name : #PPXPathParser,
	#superclass : #PPXPathGrammar,
	#classInstVars : [
		'default'
	],
	#category : #'PetitXPath-Core'
}

{ #category : #'instance creation' }
PPXPathParser class >> default [ 
	^ default ifNil: [ default := self new ]
]

{ #category : #accessing }
PPXPathParser >> attributeFilter [ 
	^super attributeFilter 
		==> [ :nodes | PPXPathAttributeFilter withName: nodes first value: nodes second ]
]

{ #category : #accessing }
PPXPathParser >> index [ 
	^super index 
		==>[ :nodes | PPXPathIndexFilter withIndex: nodes ]
]

{ #category : #accessing }
PPXPathParser >> multiple [ 
	^super multiple ==> [ :nodes | PPXPathMultipleFilter new ]
]

{ #category : #accessing }
PPXPathParser >> node [ 
	^super node 
		==> [ :nodes | 
			PPXPathNode withTag: nodes first filter: nodes second ]
]
