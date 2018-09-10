Class {
	#name : #FameOppositeClassNotExistRule,
	#superclass : #RBBlockLintRule,
	#category : #'Fame-Util'
}

{ #category : #accessing }
FameOppositeClassNotExistRule class >> uniqueIdentifierName [
	^ 'OppositeClassNotExist'
]

{ #category : #running }
FameOppositeClassNotExistRule >> checkMethod: aContext [

	| class compiledMethod pragma |
	
	class := aContext methodClass.
	compiledMethod := class methodNamed: aContext selector.
	
	(pragma := compiledMethod pragmaAt: #MSEProperty:type:opposite:) 
		ifNotNil: [
			| oppositeClass |
			oppositeClass := Smalltalk classNamed: (pragma argumentAt: 2) asString.
			oppositeClass ifNil: [ result addClass: class  selector: aContext selector ] ]
	 
	
]

{ #category : #accessing }
FameOppositeClassNotExistRule >> group [

	^ 'Fame'
]

{ #category : #accessing }
FameOppositeClassNotExistRule >> name [

	^ 'An opposite class declared in pragma #MSEProperty:type:opposite: does not exist'
]

{ #category : #accessing }
FameOppositeClassNotExistRule >> rationale [

	^ 'Check if the opposite class declared in a pragma #MSEProperty:type:opposite: is defined.'
]
