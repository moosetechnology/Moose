"
I am example that further stores the result of evaluating the example.
"
Class {
	#name : #GtExampleWithResult,
	#superclass : #Object,
	#instVars : [
		'example',
		'result'
	],
	#category : #'GToolkit-Examples-Runtime'
}

{ #category : #accessing }
GtExampleWithResult >> asExampleWithResult [
	^ self
]

{ #category : #public }
GtExampleWithResult >> debug [
	self result: self example debug
]

{ #category : #accessing }
GtExampleWithResult >> directDependencies [
	^ self example directDependencies
]

{ #category : #accessing }
GtExampleWithResult >> example [
	^ example
]

{ #category : #accessing }
GtExampleWithResult >> example: anObject [
	example := anObject
]

{ #category : #printing }
GtExampleWithResult >> gtDisplayOn: stream [
	self example gtDisplayOn: stream
]

{ #category : #ui }
GtExampleWithResult >> gtInspectorActionReturnValue [
	<gtInspectorAction>
	^ self example gtInspectorActionReturnValue
]

{ #category : #'as yet unclassified' }
GtExampleWithResult >> gtInspectorActions [
	^ super gtInspectorActions addAll: self example gtInspectorActions; yourself
]

{ #category : #ui }
GtExampleWithResult >> gtInspectorPresentationsIn: composite inContext: aGTInspector [
	"we collect all presentations from the wrapped example"
	super gtInspectorPresentationsIn: composite inContext: aGTInspector.
	self example gtInspectorPresentationsIn: composite inContext: aGTInspector
]

{ #category : #ui }
GtExampleWithResult >> gtInspectorSourceIn: composite [
	<gtInspectorPresentationOrder: 0>
	self example gtInspectorSourceIn: composite
]

{ #category : #testing }
GtExampleWithResult >> hasResult [
	^ result notNil
]

{ #category : #ui }
GtExampleWithResult >> icon [
	self isSuccess ifTrue: [ ^ ThemeIcons current iconNamed: #testGreen ].
	(self isError or: [ self isFailure ]) ifTrue: [ ^ ThemeIcons current iconNamed: #testRed ].
	^ ThemeIcons current iconNamed: #testNotRun
]

{ #category : #testing }
GtExampleWithResult >> ignoreTest [
	^ self example ignoreTest
]

{ #category : #testing }
GtExampleWithResult >> isError [
	^ self hasResult and: [ self result isError ]
]

{ #category : #testing }
GtExampleWithResult >> isFailure [
	^ self hasResult and: [ self result isFailure ]
]

{ #category : #testing }
GtExampleWithResult >> isSuccess [
	^ self hasResult and: [ self result isSuccess ]
]

{ #category : #accessing }
GtExampleWithResult >> methodClass [
	^ self example methodClass
]

{ #category : #accessing }
GtExampleWithResult >> noTest [
	^ self example noTest
]

{ #category : #accessing }
GtExampleWithResult >> result [
	^ result
]

{ #category : #accessing }
GtExampleWithResult >> result: anObject [
	result := anObject
]

{ #category : #printing }
GtExampleWithResult >> resultOrErrorName [
	^ self hasResult
		ifTrue: [ self isSuccess
			ifTrue: [ self result returnValue class name asString ]
			ifFalse: [ (self isError or: [ self isFailure ])
				ifTrue: [ self result exampleException class name asString ]
				ifFalse: [ '' "if there was a problem" ] ] ]
		ifFalse: [ 'N/A' ]
]

{ #category : #public }
GtExampleWithResult >> run [
	^ self result: self example run
]

{ #category : #accessing }
GtExampleWithResult >> selector [
	^ self example selector
]

{ #category : #printing }
GtExampleWithResult >> statusText [
	self hasResult
		ifTrue: [ self isSuccess
			ifTrue: [ ^ 'Success' ]
			ifFalse: [ 
				self isError ifTrue: [ ^ 'Error' ].
				self isFailure ifTrue: [ ^ 'Failure' ].
				 ^ 'Problem' ] ]
		ifFalse: [ ^ 'N/A' ]
]

{ #category : #printing }
GtExampleWithResult >> statusTextWithResultValueClassName [
	| status resultOrErrorClassName |
	status := self statusText.
	resultOrErrorClassName := self resultOrErrorName.
	resultOrErrorClassName ifNotNil: [ status := status , ': ' , resultOrErrorClassName ].
	^ status
]
