Class {
	#name : #FmxMBRelationTest,
	#superclass : #FmxMBPropertyTest,
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #tests }
FmxMBRelationTest >> testCardinalityString [
	
	| tClass tMethod relation |
	tClass := builder newTraitNamed: #TClass.
	tMethod := builder newTraitNamed: #TMethod.

	relation := (tClass <>-* tMethod).
	self assert: relation cardinalityString equals: '1..*'.
	relation := (tClass - tMethod).
	self assert: relation cardinalityString equals: '1..1'.
	relation := (tClass *-* tMethod).
	self assert: relation cardinalityString equals: '*..*'.	
]

{ #category : #tests }
FmxMBRelationTest >> testShortCardinalityString [

	| tClass tMethod relation |
	
	tClass := builder newTraitNamed: #TClass.
	tMethod := builder newTraitNamed: #TMethod.
	
	relation := (tClass <>-* tMethod).
	self assert: relation shortCardinalityString equals: '*'.
	relation := (tClass - tMethod).
	self assert: relation shortCardinalityString equals: ''.
	relation := (tClass *-* tMethod).
	self assert: relation shortCardinalityString equals: '*'.	
]
