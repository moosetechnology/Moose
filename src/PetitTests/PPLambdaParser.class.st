Class {
	#name : #PPLambdaParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'expression',
		'abstraction',
		'application',
		'variable'
	],
	#category : #'PetitTests-Examples'
}

{ #category : #'curch-booleans' }
PPLambdaParser class >> and [
	^ self parse: '\p.\q.((p q) p)'
]

{ #category : #'curch-booleans' }
PPLambdaParser class >> false [
	^ self parse: '\x.\y.y'
]

{ #category : #'curch-booleans' }
PPLambdaParser class >> ifthenelse [
	^ self parse: '\p.p'
]

{ #category : #'curch-booleans' }
PPLambdaParser class >> not [
	^ self parse: '\p.\a.\b.((p b) a)'
]

{ #category : #'curch-booleans' }
PPLambdaParser class >> or [
	^ self parse: '\p.\q.((p p) q)'
]

{ #category : #'curch-booleans' }
PPLambdaParser class >> true [
	^ self parse: '\x.\y.x'
]

{ #category : #productions }
PPLambdaParser >> abstraction [
	^ $\ asParser trim , variable , $. asParser trim , expression 
		==> [ :node | Array with: (node at: 2) with: (node at: 4) ]
]

{ #category : #productions }
PPLambdaParser >> application [
	^ $( asParser trim , expression , expression , $) asParser trim 
			==> [ :node | Array with: (node at: 2) with: (node at: 3) ]
]

{ #category : #productions }
PPLambdaParser >> expression [
	^ variable / abstraction / application
]

{ #category : #accessing }
PPLambdaParser >> start [
	^ expression end
]

{ #category : #productions }
PPLambdaParser >> variable [
	^ (#letter asParser , #word asParser star) flatten trim
]
