"
I am an processor that evaluates an example in a debugging scenario as if it is a test and caches the result.
In case of an error, I do not intervene, and thus I allow the user to intervene through the debugger.
"
Class {
	#name : #GtExampleDebugger,
	#superclass : #GtExampleEvaluator,
	#category : #'GToolkit-Examples-Runtime'
}

{ #category : #private }
GtExampleDebugger >> do: aBlock on: anException do: anotherBlock [
	aBlock value
]
