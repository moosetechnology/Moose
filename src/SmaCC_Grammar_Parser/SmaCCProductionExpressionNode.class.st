Class {
	#name : #SmaCCProductionExpressionNode,
	#superclass : #SmaCCDefinitionNode,
	#instVars : [
		'terms'
	],
	#category : #'SmaCC_Grammar_Parser'
}

{ #category : #generated }
SmaCCProductionExpressionNode >> acceptVisitor: aDefinitionVisitor [
	^ aDefinitionVisitor visitProductionExpression: self
]

{ #category : #accessing }
SmaCCProductionExpressionNode >> allPossibilities [
	^ terms inject: 1 into: [ :sum :each | sum * each allPossibilities ]
]

{ #category : #generated }
SmaCCProductionExpressionNode >> compositeNodeVariables [
	^ #(#terms)
]

{ #category : #testing }
SmaCCProductionExpressionNode >> hasReductionExpression [
	^ self class ~= SmaCCProductionExpressionNode
]

{ #category : #'generated-initialize-release' }
SmaCCProductionExpressionNode >> initialize [
	super initialize.
	terms := OrderedCollection new: 2.
]

{ #category : #testing }
SmaCCProductionExpressionNode >> isEmptyExpression [
	^ self terms isEmpty
]

{ #category : #generated }
SmaCCProductionExpressionNode >> terms [
	^ terms
]

{ #category : #generated }
SmaCCProductionExpressionNode >> terms: anOrderedCollection [
	self setParents: self terms to: nil.
	terms := anOrderedCollection.
	self setParents: self terms to: self
]
