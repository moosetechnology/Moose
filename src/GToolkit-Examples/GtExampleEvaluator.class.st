"
I am a processor that evaluates an example as if it is a test and caches the result. In case of an error I capture it and handle it according to the exceptions defined in the example.
"
Class {
	#name : #GtExampleEvaluator,
	#superclass : #GtExampleProcessor,
	#instVars : [
		'providers',
		'result'
	],
	#category : #'GToolkit-Examples-Runtime'
}

{ #category : #private }
GtExampleEvaluator >> basicProcess: anExample [
	| currentResult currentProvider dependencies |
	context example: anExample.

	dependencies := self dependenciesFor: anExample.
	currentResult := self newResultFor: anExample.
	currentProvider := anExample provider.
	
	[ currentResult returnValue: (self primitiveProcessExample: anExample withProvider: currentProvider) ] 
		ensure: [ 
			self processAfter: anExample withDependencies: dependencies andProvider: currentProvider ].
	
	^ currentResult
]

{ #category : #accessing }
GtExampleEvaluator >> dependenciesFor: anExample [
	| dependencies traversal |
	dependencies := OrderedCollection new.
	traversal := anExample traverser
		action: [ :anotherExample | 
			(dependencies includes: anotherExample) ifFalse: [ 
				dependencies add: anotherExample ] ];
		yourself.
	 traversal value.
	(dependencies anySatisfy: [ :anotherExample | anotherExample isValid not ])
		ifTrue: [ ^ self handleDependencyErrorFor: anExample ].
	^ dependencies
]

{ #category : #private }
GtExampleEvaluator >> do: aBlock on: anException do: anotherBlock [
	"I give a chance to my subclass to not handle the exception is needed"
	aBlock
		on: anException
		do: anotherBlock
]

{ #category : #private }
GtExampleEvaluator >> handleDependencyErrorFor: anExample [
	^ (GtExampleDependencyError new
		example: anExample;
		defined: anExample arguments;
		expected: anExample methodArgumentNames;
		invalid: #();
		yourself) signal
]

{ #category : #initialization }
GtExampleEvaluator >> initialize [
	super initialize.
	
	providers := IdentityDictionary new.
]

{ #category : #private }
GtExampleEvaluator >> newResultFor: anExample [
	^ GtExampleResult new 
		example: anExample;
		context: self context;
		yourself.
]

{ #category : #primitives }
GtExampleEvaluator >> primitiveProcessExample: anExample withProvider: aProvider [
	^ aProvider perform: anExample method selector
]

{ #category : #private }
GtExampleEvaluator >> processAfter: anExample withDependencies: exampleDependencies andProvider: aProvider [
	self processAfterMethodFor: anExample withProvider: aProvider.
	exampleDependencies reversed do: [ :anotherExample |
		self processAfterMethodFor: anotherExample withProvider: aProvider ]
]

{ #category : #private }
GtExampleEvaluator >> processAfterMethodFor: anExample withProvider: aProvider [
	anExample after ifNil: [ ^ self ].
	anExample after method
		valueWithReceiver: aProvider
		arguments: #()
]

{ #category : #private }
GtExampleEvaluator >> providerFor: anExampleOrExampleMethod [
	| newProvider |
	newProvider := anExampleOrExampleMethod provider.
	^ providers at: newProvider class ifAbsentPut: [ newProvider ]
]

{ #category : #public }
GtExampleEvaluator >> result [
	self do: [ result := self value ] 
		on: GtExampleResult signalableExceptions
		do: [ :anException | 
			result := (self newResultFor: self example) 
				returnValue: nil;
				exampleException: anException ].
	^ result
]
