Class {
	#name : #FmxMBBehaviorAliasTest,
	#superclass : #FmxMBTestCase,
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #initialization }
FmxMBBehaviorAliasTest >> testAsIncompletePropertyWithoutRelation [

	| named |
		
	named := builder newClassNamed: #Named.
	named as: #TNamed property: #name.
	
	self should: [ builder generate ] raise: FmxMBIncompletePropertyDefiniton.

]

{ #category : #initialization }
FmxMBBehaviorAliasTest >> testClassPropertyWithType [

	"test if we can create typed property in a class alias"

	| named alias generated method |
		
	named := builder newClassNamed: #Named.
	alias := named as: #TNamed.
	alias property: #name type: #String.
	
	builder generate.
	
	generated := builder testingEnvironment ask classNamed: 'TstNamed'.
	method := generated instanceSide methodNamed: #name.
	self assert: (method sourceCode includesSubstring: '<MSEProperty: #name type: #String>').
	self assert: (method sourceCode includesSubstring: '<generated>').
	method := generated instanceSide methodNamed: #name:.
	self assert: (method sourceCode includesSubstring: 'name := ').

]

{ #category : #initialization }
FmxMBBehaviorAliasTest >> testTraitName [

	"trivial test of alias #traitName"

	| named alias |
	named := builder newClassNamed: #Named.
	alias := named as: #TNamed.
	alias property: #name type: #String.
	
	self assert: alias traitName equals: #TNamed
]

{ #category : #initialization }
FmxMBBehaviorAliasTest >> testTraitPropertyWithType [

	| named generated method |
		
	named := builder newTraitNamed: #TNamed.
	named property: #name type: #String.
	
	builder generate.
	
	generated := builder testingEnvironment ask classNamed: 'TstTNamed'.
	method := generated instanceSide methodNamed: #name.
	self assert: (method sourceCode includesSubstring: '<MSEProperty: #name type: #String>').
	self assert: (method sourceCode includesSubstring: '<generated>').
	method := generated instanceSide methodNamed: #name:.
	self assert: (method sourceCode includesSubstring: 'name := ').

]

{ #category : #initialization }
FmxMBBehaviorAliasTest >> testUseTraitInsteadOfTraitName [

	"test usage of a trait instead of a trait name in the alias creation"

	| named tNamed alias |
	named := builder newClassNamed: #Named.
	tNamed := builder newTraitNamed: #TNamed.
	alias := named as: tNamed.
	
	self assert: alias traitName equals: #TNamed.
	self assert: alias trait equals: tNamed
]
