Class {
	#name : #FmxMBRelationSideTest,
	#superclass : #FmxMBPropertyTest,
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #tests }
FmxMBRelationSideTest >> testBasics [

	"check trivial testing and accessing methods"

	| side |
	
	side := FmxMBRelationSide new.
	
	self assert: side cardinality equals: #one.
	self deny: side isContainer.
	self deny: side isDerived.
	self deny: side isTarget.
	self deny: side isSource.
	self assert: side willGenerate.
	self assert: side comment isEmpty.
	
	
]

{ #category : #tests }
FmxMBRelationSideTest >> testContainmentRelations [

	| aClass aTrait relation |
	
	aClass := builder newClassNamed: #AClass.
	aTrait := builder newTraitNamed: #ATrait.
	
	relation := aClass <>- aTrait.
	self assert: relation left isOne.
	self assert: relation right isOne.
	self deny: relation left isContainer.
	self assert: relation right isContainer.

	relation := aClass -<> aTrait.
	self assert: relation left isOne.
	self assert: relation right isOne.
	self assert: relation left isContainer.
	self deny: relation right isContainer.

	relation := aClass <>-* aTrait.
	self assert: relation left isMany.
	self assert: relation right isOne.
	self deny: relation left isContainer.
	self assert: relation right isContainer.

	relation := aClass *-<> aTrait.
	self assert: relation left isOne.
	self assert: relation right isMany.
	self assert: relation left isContainer.
	self deny: relation right isContainer.

]

{ #category : #tests }
FmxMBRelationSideTest >> testDirections [

	"test setting of a type of the property"

	| aClass aTrait relation |
	
	aClass := builder newClassNamed: #AClass.
	aTrait := builder newTraitNamed: #ATrait.
	
	relation := aClass - aTrait.
	
	self assert: relation left from equals: relation left.
	self assert: relation right from equals: relation left.

	self assert: relation left to equals: relation right.
	self assert: relation right to equals: relation right.

]

{ #category : #tests }
FmxMBRelationSideTest >> testProperties [

	"simple tests of basic relation side properties"

	| side |
	
	side := FmxMBRelationSide new.

	self deny: side isContainer.
	side container.
	self assert: side isContainer.
	side container: false.
	self deny: side isContainer.
	side container.
	self assert: side isContainer.
	side noContainer.
	self deny: side isContainer.

	self deny: side isDerived.
	side derived.
	self assert: side isDerived.
	side derived: false.
	self deny: side isDerived.
	side derived.
	self assert: side isDerived.
	side notDerived.
	self deny: side isDerived.

	self deny: side isSource.
	side source.
	self assert: side isSource.
	side source: false.
	self deny: side isSource.

	self deny: side isTarget.
	side target.
	self assert: side isTarget.
	side target: false.
	self deny: side isTarget.

	self deny: side isTarget.
	side target.
	self assert: side isTarget.
	side target: false.
	self deny: side isTarget.

	self deny: side isSubordinate.
	side subordinate.
	self assert: side isSubordinate.
	side subordinate: false.
	self deny: side isSubordinate.

	self assert: side isOne.
	self deny: side isMany.
	side cardinality: #many.
	self assert: side isMany.
	self deny: side isOne.
	side cardinality: #one.
	self deny: side isMany.
	self assert: side isOne.

]

{ #category : #tests }
FmxMBRelationSideTest >> testPropertyType [

	"test if after changing of related trait of a relation side all will be consistent"

	| tClass tComment tAccess side |
		
	tClass := builder newTraitNamed: #TClass. 
	tComment := builder newTraitNamed: #TComment. 
	tAccess := builder newTraitNamed: #TAccess. 

	(side := (tClass property: #property1)) - (tComment property: #property2).
	
	self assert: side relatedEntity equals: tClass.
	self assertCollection: tClass sides asArray equals: { side }.
	self assert: tAccess sides isEmpty.

	side trait: tAccess.

	self assert: side relatedEntity equals: tAccess.
	self assert: tClass sides isEmpty.
	self assertCollection: tAccess sides asArray equals: { side }.

	
]

{ #category : #tests }
FmxMBRelationSideTest >> testReconnection [

	"test if after changing of related trait of a relation side all will be consistent"

	| tClass tComment tAccess side |
		
	tClass := builder newTraitNamed: #TClass. 
	tComment := builder newTraitNamed: #TComment. 
	tAccess := builder newTraitNamed: #TAccess. 

	(side := (tClass property: #property1)) - (tComment property: #property2).
	
	self assert: side relatedEntity equals: tClass.
	self assertCollection: tClass sides asArray equals: { side }.
	self assert: tAccess sides isEmpty.

	side trait: tAccess.

	self assert: side trait equals: tAccess.
	self assert: tClass sides isEmpty.
	self assertCollection: tAccess sides asArray equals: { side }.

	
]

{ #category : #tests }
FmxMBRelationSideTest >> testRelatedEntity [

	"test setting of a type of the property"

	| aClass aTrait relation |
	
	aClass := builder newClassNamed: #AClass.
	aTrait := builder newTraitNamed: #ATrait.
	
	relation := aClass - aTrait.
	
	self assert: relation left relatedEntity equals: aClass.
	self assert: relation right relatedEntity equals: aTrait.

]

{ #category : #tests }
FmxMBRelationSideTest >> testRelations [

	| aClass aTrait relation |
	
	aClass := builder newClassNamed: #AClass.
	aTrait := builder newTraitNamed: #ATrait.
	
	relation := aClass - aTrait.
	self assert: relation left isOne.
	self assert: relation right isOne.
	self deny: (relation left isContainer | relation left isContainer).

	relation := aClass -* aTrait.
	self assert: relation left isMany.
	self assert: relation right isOne.
	self deny: (relation left isContainer | relation left isContainer).
	
	relation := aClass *- aTrait.
	self assert: relation left isOne.
	self assert: relation right isMany.
	self deny: (relation left isContainer | relation left isContainer).
	
	relation := aClass *-* aTrait.
	self assert: relation left isMany.
	self assert: relation right isMany.
	self deny: (relation left isContainer | relation left isContainer).

]

{ #category : #tests }
FmxMBRelationSideTest >> testSetRelatedEntity [

	"test setting of a type of the property"

	| aClass aTrait anAlias other relationSide |
	
	aClass := builder newClassNamed: #AClass.
	aTrait := builder newTraitNamed: #ATrait.
	anAlias := (builder newClassNamed: #AnAliasParent) as: #AnAlias.
	other := builder newClassNamed: #Other.

	relationSide := FmxMBRelationSide new.
	relationSide relatedEntity: aClass.
	self assert: relationSide relatedClass equals: aClass.
	self assert: relationSide trait equals: nil.
	
	relationSide := FmxMBRelationSide new.
	relationSide relatedEntity: aTrait.
	self assert: relationSide relatedClass equals: nil.
	self assert: relationSide trait equals: aTrait.

	relationSide := FmxMBRelationSide new.
	relationSide relatedEntity: anAlias.
	self assert: relationSide relatedClass equals: nil.
	self assert: relationSide trait equals: (builder ensureTraitNamed: #AnAlias).


]
