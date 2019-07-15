"
I am an abstract class for manipulating examples.

My subclasses can add different semantics for different use cases. For example, evaluating an example is to be treated differently from a debugging scenario, or from a  scenario to recorver static dependencies.

I maintain a context that can be accessed from within the examples being processed during the execution of the processor.

#value - Execute the processor. Can return a value, depending on the processor.
#canProcess - Verifies if the processor can execute on the given example.
"
Class {
	#name : #GtExampleProcessor,
	#superclass : #Object,
	#instVars : [
		'example',
		'context'
	],
	#category : #'GToolkit-Examples-Runtime'
}

{ #category : #private }
GtExampleProcessor >> basicProcess: anExample [ 
	^ self subclassResponsibility
]

{ #category : #testing }
GtExampleProcessor >> canProcess [
	"I verify if this processor can execute on the given example. I do this by running the processor
	and checking if any example-specific specific is raised. Such exceptions indicate a problem with
	the given example that does not make it possible to apply the processor. "
	
	[ self value ]
		on: GtExampleError
		do: [ ^ false ].
	^ true
]

{ #category : #accessing }
GtExampleProcessor >> context [
	^ context
]

{ #category : #accessing }
GtExampleProcessor >> context: anObject [
	^ context := anObject
]

{ #category : #accessing }
GtExampleProcessor >> example [
	^ example
]

{ #category : #accessing }
GtExampleProcessor >> example: anObject [
	example := anObject
]

{ #category : #initialization }
GtExampleProcessor >> initialize [
	super initialize.
	context := GtExampleContext new
]

{ #category : #private }
GtExampleProcessor >> process: anExample [
	^ self basicProcess: anExample
]

{ #category : #public }
GtExampleProcessor >> value [ 
	^ self withContextDo: [ self process: self example ]
]

{ #category : #private }
GtExampleProcessor >> withContextDo: aBlock [
	^ GtCurrentExampleContext use: context during: aBlock
]
