Class {
	#name : #SwiftTypeCastOperatorNode,
	#superclass : #SwiftParseNode,
	#instVars : [
		'_isToken',
		'type',
		'asToken',
		'questionMarkToken'
	],
	#category : #'SmaCC_Swift'
}

{ #category : #generated }
SwiftTypeCastOperatorNode >> _isToken [
	^ _isToken
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> _isToken: aSmaCCToken [
	_isToken := aSmaCCToken
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitTypeCastOperator: self
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> asToken [
	^ asToken
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> asToken: aSmaCCToken [
	asToken := aSmaCCToken
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> questionMarkToken [
	^ questionMarkToken
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> questionMarkToken: aSmaCCToken [
	questionMarkToken := aSmaCCToken
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> tokenVariables [
	^ #(#_isToken #asToken #questionMarkToken)
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> type [
	^ type
]

{ #category : #generated }
SwiftTypeCastOperatorNode >> type: aSwiftParseNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aSwiftParseNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
