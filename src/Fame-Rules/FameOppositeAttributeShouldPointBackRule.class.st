Class {
	#name : #FameOppositeAttributeShouldPointBackRule,
	#superclass : #RBBlockLintRule,
	#category : #'Fame-Rules'
}

{ #category : #accessing }
FameOppositeAttributeShouldPointBackRule class >> uniqueIdentifierName [
	^ 'OppositeAttributeShouldPointBack'
]

{ #category : #running }
FameOppositeAttributeShouldPointBackRule >> checkMethod: aContext [

	| class compiledMethod pragma |
	class := aContext methodClass.
	compiledMethod := class methodNamed: aContext selector.
	(pragma := compiledMethod pragmaAt: #MSEProperty:type:opposite:) 
		ifNotNil: [
			|oppositeClass oppositeSelector oppositeCompiledMethod|
			oppositeClass := Smalltalk classNamed: (pragma argumentAt: 2) asString.
			oppositeClass ifNil: [^ self].
			oppositeSelector := (pragma argumentAt: 3) .
		
			oppositeCompiledMethod := oppositeClass methodDict at: oppositeSelector ifAbsent: [result addClass: class  selector: aContext selector. ^self].
			pragma := (oppositeCompiledMethod pragmaAt: #MSEProperty:type:opposite:)
				ifNil: [ result addClass: class  selector: aContext selector. ^self ].
			
			(pragma argumentAt: 2) = class name asSymbol
				ifFalse: [ result addClass: class  selector: aContext selector. ^self ].
			(pragma argumentAt: 3) = aContext selector
				ifFalse: [ result addClass: class  selector: aContext selector. ^self ] ]
	 
	
]

{ #category : #accessing }
FameOppositeAttributeShouldPointBackRule >> group [
	^ 'Fame'
]

{ #category : #accessing }
FameOppositeAttributeShouldPointBackRule >> name [

	^ 'An opposite attribute declared in pragma does not point back to the initial attribute'
]

{ #category : #accessing }
FameOppositeAttributeShouldPointBackRule >> rationale [

	^ 'Check if an opposite attribute declared in a pragma #MSEProperty:type:opposite: also define a pragma pointing back to the initial class and the initial attribute.'
]
