Class {
	#name : #TypeCollectorTests,
	#superclass : #TestCase,
	#category : #'RoelTyper-Tests'
}

{ #category : #'typing tests' }
TypeCollectorTests >> methodWithTmpInBlock: anObject [
	|some fancy variables|
	some := 1.
	fancy := 'hola'.
	variables := #sexSymbol.
	[ |l| l := true. l ] whileFalse: [ ].
	^ self
]

{ #category : #'typing tests' }
TypeCollectorTests >> testOnBehavior [

	self shouldnt: (TypeCollector typeInstvar:  #'superclass' ofClassWithLookup: Behavior) raise: Error
]

{ #category : #'typing tests' }
TypeCollectorTests >> testOnTmpVarContainedInBlock [

	self shouldnt: (TypeCollector typeTmpsIn: (self class >> #methodWithTmpInBlock:)
		ofClass: self class) raise: Error
]

{ #category : #'typing tests' }
TypeCollectorTests >> testPoint [
	| types xTypes yTypes |
	types := TypeCollector typeInstvarsOfClass: Point.
	xTypes := types at: #x.
	self assert: ((xTypes is: Number) or: [xTypes is: Integer]).
	yTypes := types at: #y.
	self assert: ((yTypes is: Number) or: [yTypes is: Integer])
]
