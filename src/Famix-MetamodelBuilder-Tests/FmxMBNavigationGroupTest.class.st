Class {
	#name : #FmxMBNavigationGroupTest,
	#superclass : #FmxMBTestCase,
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #tests }
FmxMBNavigationGroupTest >> testEmptyRelationGroups [

	| entity |
	
	entity := builder newClassNamed: #Entity.
	
	entity navigationGroups isEmpty.
	
	
	
]

{ #category : #tests }
FmxMBNavigationGroupTest >> testRelationGroupsForTraits [
	| tClass tMethod class method relation |
	builder configuration navigationForContainers.

	tClass := builder newTraitNamed: #TClass.
	tMethod := builder newTraitNamed: #TMethod.
	class := builder newClassNamed: #Class.
	method := builder newClassNamed: #Method.

	relation := tClass <>-* tMethod.

	class --|> tClass.
	method --|> tMethod.

	self denyEmpty: tClass allNavigationGroups.
	self denyEmpty: tMethod allNavigationGroups.
	self assertEmpty: class allNavigationGroups.
	self assertEmpty: method allNavigationGroups.

	self assert: tClass allNavigationGroups anyOne relation equals: relation
]
