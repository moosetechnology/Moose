"
I am a trait that provides assertions that can used within examples.
"
Trait {
	#name : #TGtExampleAssertable,
	#category : #'GToolkit-Examples-Core'
}

{ #category : #asserting }
TGtExampleAssertable >> assert: aBoolean [
	"We check for true explicitly to make the assertion fail for non booleans"
	aBoolean == true ifFalse: [self signalFailure: 'Assertion failed']
			
]

{ #category : #asserting }
TGtExampleAssertable >> assert: aBooleanOrBlock description: aStringOrBlock [
	aBooleanOrBlock value ifFalse: [
		| message |
		message := aStringOrBlock value.
		self classForTestResult failure signal: message]
			
]

{ #category : #asserting }
TGtExampleAssertable >> assert: actual equals: expected [
	^ self
		assert: expected = actual
		description: [self comparingStringBetween: actual and: expected]
]

{ #category : #asserting }
TGtExampleAssertable >> assertCollection: actual hasSameElements: expected [
	"Assert that a collection contains the same elements as the given collection. Order is not checked, only the presence/absence of elements."
	| missingElements additionalElements |
	
	additionalElements := actual difference: expected.
	missingElements := expected difference: (actual intersection: expected).
	self 
		assert: (additionalElements isEmpty and: [ missingElements isEmpty ])
		description: (String streamContents: 
			[:stream |
			stream
				nextPutAll: 'Given Collections do not match!'; lf;
				tab; nextPutAll: 'additions : '; print: additionalElements asArray; lf;
				tab; nextPutAll: 'missing: '; print: missingElements asArray; lf ])
]

{ #category : #asserting }
TGtExampleAssertable >> classForTestResult [
	"Returns the class of the test result"
	^ GtExampleResult
]

{ #category : #private }
TGtExampleAssertable >> comparingStringBetween: actual and: expected [

	^ String streamContents: [:stream |
			stream
				nextPutAll: 'Got ';
				nextPutAll: actual fullPrintString;
				nextPutAll: ' instead of ';
				nextPutAll: expected fullPrintString;
				nextPutAll: '.']
]

{ #category : #asserting }
TGtExampleAssertable >> executeShould: aBlock inScopeOf: anExceptionalEvent [ 
	^[aBlock value.
 	false] on: anExceptionalEvent
		do: [:ex | ex return: true]
]

{ #category : #asserting }
TGtExampleAssertable >> should: aBlock raise: anExceptionalEvent [ 
	^self assert: (self executeShould: aBlock inScopeOf: anExceptionalEvent)
]

{ #category : #asserting }
TGtExampleAssertable >> should: aBlock raise: anExceptionalEvent description: aString [ 
	^self assert: (self executeShould: aBlock inScopeOf: anExceptionalEvent)
		description: aString
			
]

{ #category : #asserting }
TGtExampleAssertable >> shouldnt: aBlock raise: anExceptionalEvent [  
	 
	^self assert: (self executeShould: aBlock inScopeOf: anExceptionalEvent) not
			
]

{ #category : #asserting }
TGtExampleAssertable >> shouldnt: aBlock raise: anExceptionalEvent description: aString [  
 
	^self
		assert: (self executeShould: aBlock inScopeOf: anExceptionalEvent) not
		description: aString
]

{ #category : #signalling }
TGtExampleAssertable >> signalFailure: aString [
	self classForTestResult failure signal: aString
]
