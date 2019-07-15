"
SmaCCStateEdge is a SmaCCEdge on states (that are represented by symbols) in the scanner.
"
Class {
	#name : #SmaCCStateEdge,
	#superclass : #SmaCCEdge,
	#category : #'SmaCC_Development'
}

{ #category : #comparing }
SmaCCStateEdge >> <= aSmaCCEdge [
	^ self class ~= aSmaCCEdge class
		or: [ self transitionObjects first <= aSmaCCEdge transitionObjects first ]
]

{ #category : #compiling }
SmaCCStateEdge >> codeSizeEstimate [
	^ 4 * transitionObjects size
]

{ #category : #compiling }
SmaCCStateEdge >> dispatchTo: aSmaCCCodeGenerator seen: aCollection [
	^ aSmaCCCodeGenerator acceptStateEdge: self
]
