"
Check if the opposite class declared in a pragma #MSEProperty:type:opposite: is defined.
"
Class {
	#name : #FameOppositeClassNotExistRule,
	#superclass : #RBBlockLintRule,
	#category : #'Fame-Rules'
}

{ #category : #accessing }
FameOppositeClassNotExistRule class >> uniqueIdentifierName [
	^ 'OppositeClassNotExist'
]

{ #category : #running }
FameOppositeClassNotExistRule >> checkMethod: aContext [
	| class |
	class := aContext methodClass.
	((class methodNamed: aContext selector) pragmaAt: #FMProperty:type:opposite:)
		ifNotNil: [ :pragma | self class environment at: (pragma argumentAt: 2) ifPresent: [ :oppositeClass | result addClass: class selector: aContext selector ] ]
]

{ #category : #accessing }
FameOppositeClassNotExistRule >> group [

	^ 'Fame'
]

{ #category : #accessing }
FameOppositeClassNotExistRule >> name [

	^ 'An opposite class declared in pragma #MSEProperty:type:opposite: does not exist'
]
