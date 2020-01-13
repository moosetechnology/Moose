"
Check if an opposite attribute declared in a pragma #MSEProperty:type:opposite: also define a pragma pointing back to the initial class and the initial attribute.
"
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
	| class |
	class := aContext methodClass.
	((class methodNamed: aContext selector) pragmaAt: #FMProperty:type:opposite:)
		ifNotNil: [ :pragma | 
			self class environment
				at: (pragma argumentAt: 2)
				ifPresent: [ :oppositeClass | 
					oppositeClass
						compiledMethodAt: (pragma argumentAt: 3)
						ifPresent: [ :oppositeCompiledMethod | 
							(oppositeCompiledMethod pragmaAt: #FMProperty:type:opposite:)
								ifNotNil: [ :oppositePragma | 
									(oppositePragma argumentAt: 2) = class name asSymbol
										ifFalse: [ result addClass: class selector: aContext selector.
											^ self ].
									(oppositePragma argumentAt: 3) = aContext selector
										ifFalse: [ result addClass: class selector: aContext selector.
											^ self ] ]
								ifNil: [ result addClass: class selector: aContext selector.
									^ self ] ]
						ifAbsent: [ result addClass: class selector: aContext selector ] ] ]
]

{ #category : #accessing }
FameOppositeAttributeShouldPointBackRule >> group [
	^ 'Fame'
]

{ #category : #accessing }
FameOppositeAttributeShouldPointBackRule >> name [

	^ 'An opposite attribute declared in pragma does not point back to the initial attribute'
]
