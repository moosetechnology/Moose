"
SmaCCAction is an abstract class that represent actions (shift, reduce, accept, reject) in the LR parser to be performed for a specific state/symbol pair. 

Subclasses must implement the following messages:
	accessing
		id
		lr1Item
	private
		mergeWith:prefer:


"
Class {
	#name : #SmaCCAction,
	#superclass : #Object,
	#category : #'SmaCC_Development'
}

{ #category : #comparing }
SmaCCAction >> = anObject [
	^ self class = anObject class
		and: [ self symbol = anObject symbol and: [ self rhs = anObject rhs ] ]
]

{ #category : #comparing }
SmaCCAction >> hash [
	^ self symbol hash bitXor: self rhs hash
]

{ #category : #accessing }
SmaCCAction >> id [
	^ self subclassResponsibility
]

{ #category : #testing }
SmaCCAction >> isAmbiguous [
	^ false
]

{ #category : #testing }
SmaCCAction >> isReduce [
	^ false
]

{ #category : #testing }
SmaCCAction >> isReject [
	^ false
]

{ #category : #testing }
SmaCCAction >> isShift [
	^ false
]

{ #category : #accessing }
SmaCCAction >> lr1Item [
	^ self subclassResponsibility
]

{ #category : #merging }
SmaCCAction >> mergeWith: aSmaCCAction prefer: aClass [
	^ self subclassResponsibility
]

{ #category : #accessing }
SmaCCAction >> precedence [
	^ self lr1Item precedence
]

{ #category : #accessing }
SmaCCAction >> preferredAction [
	^ self
]

{ #category : #accessing }
SmaCCAction >> rhs [
	^ self lr1Item rhs
]

{ #category : #'error handling' }
SmaCCAction >> signalAllWarnings [
	
]

{ #category : #accessing }
SmaCCAction >> size [
	^ self rhs size
]

{ #category : #accessing }
SmaCCAction >> symbol [
	^ self rhs productionSymbol
]
