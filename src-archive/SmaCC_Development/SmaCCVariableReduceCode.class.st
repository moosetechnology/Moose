"
SmaCCVariableReduceCode represents a reduce action that returns a collection of objects that represent the variables defined by the rhs. When this is pulled up into a create node, it will use the variable collection to create the node.

"
Class {
	#name : #SmaCCVariableReduceCode,
	#superclass : #SmaCCReduceCode,
	#category : #'SmaCC_Development'
}

{ #category : #private }
SmaCCVariableReduceCode >> basicModelTypes: aSet [
	^ Array with: (self model classFor: OrderedCollection)
]

{ #category : #public }
SmaCCVariableReduceCode >> returnsVariableCollection [
	^ true
]

{ #category : #accessing }
SmaCCVariableReduceCode >> source [
	^ self codeGenerator variableArrayAction: rhs
]
