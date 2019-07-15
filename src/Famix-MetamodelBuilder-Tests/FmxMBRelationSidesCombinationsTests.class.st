Class {
	#name : #FmxMBRelationSidesCombinationsTests,
	#superclass : #FmxMBTestCase,
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #tests }
FmxMBRelationSidesCombinationsTests >> testAliasToAlias [

	"test simple relation between alias and alias"
	
	| entity1 entity2 env |

	entity1 := builder newClassNamed: #Named.	
	entity2 := builder newClassNamed: #Access.	

	(entity1 as: #TNamed property: #access) - (entity2 as: #TAccess property: #named).
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self 
		assert: ((env ask behaviorNamed: #TstTNamed) slots first) expression 
		equals: 'FMOne type: #TstTAccess opposite: #named'.
	self 
		assert: ((env ask behaviorNamed: #TstTAccess) slots first) expression 
		equals: 'FMOne type: #TstTNamed opposite: #access'.
	
	self 
		assertCollection: (env ask behaviorNamed: #TstNamed) traits
		hasSameElements: {env ask behaviorNamed: #TstTNamed}.
	self 
		assertCollection: (env ask behaviorNamed: #TstAccess) traits
		hasSameElements: {env ask behaviorNamed: #TstTAccess}.


]

{ #category : #tests }
FmxMBRelationSidesCombinationsTests >> testAliasToAliasWithAutomaticNamingManyToOne [

	"test simple relation between alias and alias with automatic property names"
	
	| entity1 entity2 env |

	entity1 := builder newClassNamed: #Named.	
	entity2 := builder newClassNamed: #Access.	

	(entity1 as: #TNamed) *-* (entity2 as: #TAccess).
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self 
		assert: ((env ask behaviorNamed: #TstTNamed) slots first) expression 
		equals: 'FMMany type: #TstTAccess opposite: #nameds'.
	self 
		assert: ((env ask behaviorNamed: #TstTAccess) slots first) expression 
		equals: 'FMMany type: #TstTNamed opposite: #accesses'.
	
	self 
		assertCollection: (env ask behaviorNamed: #TstNamed) traits
		hasSameElements: {env ask behaviorNamed: #TstTNamed}.
	self 
		assertCollection: (env ask behaviorNamed: #TstAccess) traits
		hasSameElements: {env ask behaviorNamed: #TstTAccess}.


]

{ #category : #tests }
FmxMBRelationSidesCombinationsTests >> testAliasToAliasWithAutomaticNamingOneToMany [

	"test simple relation between alias and alias with automatic property names"
	
	| entity1 entity2 env |

	entity1 := builder newClassNamed: #Named.	
	entity2 := builder newClassNamed: #Access.	

	(entity1 as: #TNamed) -* (entity2 as: #TAccess).
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self 
		assert: ((env ask behaviorNamed: #TstTNamed) slots first) expression 
		equals: 'FMMany type: #TstTAccess opposite: #named'.
	self 
		assert: ((env ask behaviorNamed: #TstTAccess) slots first) expression 
		equals: 'FMOne type: #TstTNamed opposite: #accesses'.
	
	self 
		assertCollection: (env ask behaviorNamed: #TstNamed) traits
		hasSameElements: {env ask behaviorNamed: #TstTNamed}.
	self 
		assertCollection: (env ask behaviorNamed: #TstAccess) traits
		hasSameElements: {env ask behaviorNamed: #TstTAccess}.


]

{ #category : #tests }
FmxMBRelationSidesCombinationsTests >> testAliasToAliasWithAutomaticNamingOneToOne [

	"test simple relation between alias and alias with automatic property names"
	
	| entity1 entity2 env |

	entity1 := builder newClassNamed: #Named.	
	entity2 := builder newClassNamed: #Access.	

	(entity1 as: #TNamed) - (entity2 as: #TAccess).
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self 
		assert: ((env ask behaviorNamed: #TstTNamed) slots first) expression 
		equals: 'FMOne type: #TstTAccess opposite: #named'.
	self 
		assert: ((env ask behaviorNamed: #TstTAccess) slots first) expression 
		equals: 'FMOne type: #TstTNamed opposite: #access'.
	
	self 
		assertCollection: (env ask behaviorNamed: #TstNamed) traits
		hasSameElements: {env ask behaviorNamed: #TstTNamed}.
	self 
		assertCollection: (env ask behaviorNamed: #TstAccess) traits
		hasSameElements: {env ask behaviorNamed: #TstTAccess}.


]

{ #category : #tests }
FmxMBRelationSidesCombinationsTests >> testAliasToClass [

	"test simple relation between alias and class"
	
	| entity1 entity2 env |

	entity1 := builder newClassNamed: #Named.	
	entity2 := builder newClassNamed: #Access.	

	(entity1 as: #TNamed property: #access) - (entity2 property: #named).
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self 
		assert: ((env ask behaviorNamed: #TstTNamed) slots first) expression 
		equals: 'FMOne type: #TstAccess opposite: #named'.
	self 
		assert: ((env ask behaviorNamed: #TstAccess) slots first) expression 
		equals: 'FMOne type: #TstTNamed opposite: #access'.
	
	self 
		assertCollection: (env ask behaviorNamed: #TstNamed) traits
		hasSameElements: {env ask behaviorNamed: #TstTNamed}.
	self 
		assert: (env ask behaviorNamed: #TstAccess) traits isEmpty.

]

{ #category : #tests }
FmxMBRelationSidesCombinationsTests >> testAliasToTrait [

	"test simple relation between alias and trait"
	
	| entity1 entity2 env |

	entity1 := builder newClassNamed: #Named.	
	entity2 := builder newTraitNamed: #TAccess.	

	(entity1 as: #TNamed property: #access) - (entity2 property: #named).
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self 
		assert: ((env ask behaviorNamed: #TstTNamed) slots first) expression 
		equals: 'FMOne type: #TstTAccess opposite: #named'.
	self 
		assert: ((env ask behaviorNamed: #TstTAccess) slots first) expression 
		equals: 'FMOne type: #TstTNamed opposite: #access'.
	
	self 
		assertCollection: (env ask behaviorNamed: #TstNamed) traits
		hasSameElements: {env ask behaviorNamed: #TstTNamed}.

]

{ #category : #tests }
FmxMBRelationSidesCombinationsTests >> testClassToAlias [

	"test simple relation between class and alias"
	
	| entity1 entity2 env |

	entity1 := builder newClassNamed: #Named.	
	entity2 := builder newClassNamed: #Access.	

	(entity1 property: #access) - (entity2 as: #TAccess property: #named).
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self 
		assert: ((env ask behaviorNamed: #TstNamed) slots first) expression 
		equals: 'FMOne type: #TstTAccess opposite: #named'.
	self 
		assert: ((env ask behaviorNamed: #TstTAccess) slots first) expression 
		equals: 'FMOne type: #TstNamed opposite: #access'.
	
	self 
		assert: (env ask behaviorNamed: #TstNamed) traits isEmpty.
	self 
		assertCollection: (env ask behaviorNamed: #TstAccess) traits
		hasSameElements: {env ask behaviorNamed: #TstTAccess}.

]

{ #category : #tests }
FmxMBRelationSidesCombinationsTests >> testClassToClass [

	"test simple relation between class and class"
	
	| entity1 entity2 env |

	entity1 := builder newClassNamed: #Named.	
	entity2 := builder newClassNamed: #Access.	

	(entity1 property: #access) - (entity2 property: #named).
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self 
		assert: ((env ask behaviorNamed: #TstNamed) slots first) expression 
		equals: 'FMOne type: #TstAccess opposite: #named'.
	self 
		assert: ((env ask behaviorNamed: #TstAccess) slots first) expression 
		equals: 'FMOne type: #TstNamed opposite: #access'.
	


]

{ #category : #tests }
FmxMBRelationSidesCombinationsTests >> testClassToTrait [

	"test simple relation between class and trait"
	
	| entity1 entity2 env |

	entity1 := builder newClassNamed: #Named.	
	entity2 := builder newTraitNamed: #TAccess.	

	(entity1 property: #access) - (entity2 property: #named).
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self 
		assert: ((env ask behaviorNamed: #TstNamed) slots first) expression 
		equals: 'FMOne type: #TstTAccess opposite: #named'.
	self 
		assert: ((env ask behaviorNamed: #TstTAccess) slots first) expression 
		equals: 'FMOne type: #TstNamed opposite: #access'.
]

{ #category : #tests }
FmxMBRelationSidesCombinationsTests >> testTraitToAlias [

	"test simple relation between trait and alias"
	
	| entity1 entity2 env |

	entity1 := builder newTraitNamed: #TNamed.	
	entity2 := builder newClassNamed: #Access.	

	(entity1 property: #access) - (entity2 as: #TAccess property: #named).
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self 
		assert: ((env ask behaviorNamed: #TstTNamed) slots first) expression 
		equals: 'FMOne type: #TstTAccess opposite: #named'.
	self 
		assert: ((env ask behaviorNamed: #TstTAccess) slots first) expression 
		equals: 'FMOne type: #TstTNamed opposite: #access'.
	
	self 
		assertCollection: (env ask behaviorNamed: #TstAccess) traits
		hasSameElements: {env ask behaviorNamed: #TstTAccess}.

]

{ #category : #tests }
FmxMBRelationSidesCombinationsTests >> testTraitToClass [

	"test simple relation between class and trait"
	
	| entity1 entity2 env |

	entity1 := builder newTraitNamed: #TNamed.	
	entity2 := builder newClassNamed: #Access.	

	(entity1 property: #access) - (entity2 property: #named).
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self 
		assert: ((env ask behaviorNamed: #TstTNamed) slots first) expression 
		equals: 'FMOne type: #TstAccess opposite: #named'.
	self 
		assert: ((env ask behaviorNamed: #TstAccess) slots first) expression 
		equals: 'FMOne type: #TstTNamed opposite: #access'.
]

{ #category : #tests }
FmxMBRelationSidesCombinationsTests >> testTraitToTrait [

	"test simple relation between trait and trait"
	
	| entity1 entity2 env |

	entity1 := builder newTraitNamed: #TNamed.	
	entity2 := builder newTraitNamed: #TAccess.	

	(entity1 property: #access) - (entity2 property: #named).
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self 
		assert: ((env ask behaviorNamed: #TstTNamed) slots first) expression 
		equals: 'FMOne type: #TstTAccess opposite: #named'.
	self 
		assert: ((env ask behaviorNamed: #TstTAccess) slots first) expression 
		equals: 'FMOne type: #TstTNamed opposite: #access'.
]
