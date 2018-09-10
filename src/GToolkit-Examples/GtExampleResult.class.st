"
I represent the result of executing an example. 

I can be in the following four states:
- success: creating and runnign the example executed successfully;
- failure: running the examples caused an assertion to fail, either in the actul example or in an after method;
- error: running the example raised an exception that makes the example be considered an error, either in the actul example of in an after method;
- problem: creating the example  detected issues in the structure of the example; the example will still be run, however, it will have a distinct state regardless of the result of the run.

API for determining the state of the example:
- #failure - the exception that marks this example as a failure. This is also the exception raised when an assertion fails within an example;
- #signalableExceptions - a list of exception that mark the example as an error (only if the example is not already a failure).

I keep track of the
- returnValue - the real object returned by the example method
- exception - the last error executed during an example
"
Class {
	#name : #GtExampleResult,
	#superclass : #Object,
	#instVars : [
		'example',
		'context',
		'returnValue',
		'exception'
	],
	#category : #'GToolkit-Examples-Core'
}

{ #category : #exceptions }
GtExampleResult class >> failure [
	^ AssertionFailure
]

{ #category : #exceptions }
GtExampleResult class >> signalableExceptions [
	"I return the set of exceptions that are captured by the evaluator and cause an example to fail."
	^ ExceptionSet new ,
		Halt ,
		Error ,
		Exit ,
		UnhandledError,
		TestFailure,
		Deprecation
]

{ #category : #accessing }
GtExampleResult >> context [
	^ context
]

{ #category : #accessing }
GtExampleResult >> context: anObject [
	context := anObject
]

{ #category : #actions }
GtExampleResult >> debug [
	self isSuccess ifTrue: [ ^ self ].
	^ self example debug
]

{ #category : #accessing }
GtExampleResult >> example [
	^ example
]

{ #category : #accessing }
GtExampleResult >> example: anObject [
	example := anObject
]

{ #category : #accessing }
GtExampleResult >> exampleException [
	^ exception
]

{ #category : #accessing }
GtExampleResult >> exampleException: anException [
	exception := anException
]

{ #category : #ui }
GtExampleResult >> gtDisplayOn: aStream [
	self example gtDisplayOn: aStream. 
	
	self exampleException ifNotNil: [ 
		aStream nextPutAll: ' ['.
		self exampleException gtDisplayOn: aStream.
		aStream nextPutAll: ']' ]
]

{ #category : #ui }
GtExampleResult >> gtDisplayValidityOn: aStream [
	self isSuccess ifTrue: [ ^ self ].
	
	aStream nextPutAll: ' ['.
	self exampleException gtDisplayOn: aStream.
	aStream nextPutAll: ']'
]

{ #category : #testing }
GtExampleResult >> hasException [
	^ self exampleException notNil
]

{ #category : #testing }
GtExampleResult >> hasProblems [
	^ self example hasProblems
		or: [ self hasException ]
]

{ #category : #testing }
GtExampleResult >> isError [
	^ self isSuccess not
		and: [ self hasException
			and: [ (self exampleException isKindOf: AssertionFailure) not ] ]
]

{ #category : #testing }
GtExampleResult >> isFailure [
	^ self isSuccess not
		and: [ self hasException
			and: [ self exampleException isKindOf: AssertionFailure ] ]
]

{ #category : #testing }
GtExampleResult >> isSuccess [
	^ self exampleException isNil
		and: [ self example hasProblems not ]
]

{ #category : #accessing }
GtExampleResult >> returnValue [
	^ returnValue
]

{ #category : #accessing }
GtExampleResult >> returnValue: anObject [
	returnValue := anObject
]

{ #category : #actions }
GtExampleResult >> run [
	^ self example run
]
