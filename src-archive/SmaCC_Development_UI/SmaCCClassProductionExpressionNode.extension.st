Extension { #name : #SmaCCClassProductionExpressionNode }

{ #category : #'*SmaCC_Development_UI' }
SmaCCClassProductionExpressionNode >> originalAstNodeName [
	^ classname isNil
		ifTrue: [ '' ]
		ifFalse: [ classname value ]
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCClassProductionExpressionNode >> productionLabel [
	^ self completeSource copyFrom: self startPosition to: left startPosition - 1
]

{ #category : #'*SmaCC_Development_UI' }
SmaCCClassProductionExpressionNode >> updateSource: aSmaCCString [
	self hasNodeDefined
		ifTrue: [ self astNodeName = self originalAstNodeName
				ifFalse: [ classname isNil
						ifFalse: [ aSmaCCString deleteFrom: classname startPosition to: classname stopPosition ].
					aSmaCCString insert: self astNodeName at: right startPosition ] ]
		ifFalse: [ aSmaCCString deleteFrom: left startPosition to: right stopPosition ]
]
