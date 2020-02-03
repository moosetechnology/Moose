Class {
	#name : #FmxMBRelationSidesCombinationsTests,
	#superclass : #FmxMBTestCase,
	#category : #'Famix-MetamodelBuilder-Tests'
}

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
FmxMBRelationSidesCombinationsTests >> testTraitToClass [

	"test simple relation between class and trait"
	
	| entity1 entity2 env |

	entity1 := builder newTraitNamed: #TNamedEntity.	
	entity2 := builder newClassNamed: #Access.	

	(entity1 property: #access) - (entity2 property: #named).
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self 
		assert: ((env ask behaviorNamed: #TstTNamedEntity) slots first) expression 
		equals: 'FMOne type: #TstAccess opposite: #named'.
	self 
		assert: ((env ask behaviorNamed: #TstAccess) slots first) expression 
		equals: 'FMOne type: #TstTNamedEntity opposite: #access'.
]

{ #category : #tests }
FmxMBRelationSidesCombinationsTests >> testTraitToTrait [

	"test simple relation between trait and trait"
	
	| entity1 entity2 env |

	entity1 := builder newTraitNamed: #TNamedEntity.	
	entity2 := builder newTraitNamed: #TAccess.	

	(entity1 property: #access) - (entity2 property: #named).
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self 
		assert: ((env ask behaviorNamed: #TstTNamedEntity) slots first) expression 
		equals: 'FMOne type: #TstTAccess opposite: #named'.
	self 
		assert: ((env ask behaviorNamed: #TstTAccess) slots first) expression 
		equals: 'FMOne type: #TstTNamedEntity opposite: #access'.
]
