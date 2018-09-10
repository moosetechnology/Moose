Class {
	#name : #FmxMBRelationsGenerationTest,
	#superclass : #FmxMBTestCase,
	#instVars : [
		'access',
		'variable',
		'generatedAccess',
		'generatedVariable'
	],
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #utility }
FmxMBRelationsGenerationTest >> assertContainerInAccessMethod: selector [

	self assert: ((generatedAccess methodNamed: selector) sourceCode includesSubstring: '<container>').
	self assert: ((generatedAccess methodNamed: selector) sourceCode includesSubstring: '<generated>').
	

]

{ #category : #utility }
FmxMBRelationsGenerationTest >> assertContainerInVariableMethod: selector [

	self assert: ((generatedVariable methodNamed: selector) sourceCode includesSubstring: '<container>').
	self assert: ((generatedVariable methodNamed: selector) sourceCode includesSubstring: '<generated>').
	

]

{ #category : #utility }
FmxMBRelationsGenerationTest >> cardinalityInAccess: selector1 inVariable: selector2 [

	self assert: generatedAccess slots first name equals: selector1.
	self assert: generatedVariable slots first name equals: selector2.

]

{ #category : #utility }
FmxMBRelationsGenerationTest >> checkSlotsCount [		

	self assert: generatedAccess slots size equals: 1.
	self assert: generatedVariable slots size equals: 1.

]

{ #category : #utility }
FmxMBRelationsGenerationTest >> denyContainerInAccessMethod: selector [

	self deny: ((generatedAccess methodNamed: selector) sourceCode includesSubstring: '<container>').
	self assert: ((generatedAccess methodNamed: selector) sourceCode includesSubstring: '<generated>').
	

]

{ #category : #utility }
FmxMBRelationsGenerationTest >> denyContainerInVarialbeMethod: selector [

	self deny: ((generatedVariable methodNamed: selector) sourceCode includesSubstring: '<container>').
	self assert: ((generatedVariable methodNamed: selector) sourceCode includesSubstring: '<generated>').
	

]

{ #category : #utility }
FmxMBRelationsGenerationTest >> generate [

	builder generate.
		
	generatedAccess := builder testingEnvironment ask classNamed: 'TstAccess'.
	generatedVariable := builder testingEnvironment ask classNamed: 'TstVariable'.

	self checkSlotsCount.
	
]

{ #category : #running }
FmxMBRelationsGenerationTest >> setUp [

	super setUp.

	access := builder newClassNamed: #Access.	
	variable := builder newClassNamed: #Variable.	

]

{ #category : #utility }
FmxMBRelationsGenerationTest >> slotCardinalityinAccess: accessCardinality inVariable: variableCardinality [

	"slot expression example: FMMany type: #TstAccess opposite: #accessOwner"
	self assert: (generatedAccess slots first expression beginsWith: ('FM', accessCardinality capitalized)).
	self assert: (generatedVariable slots first expression beginsWith: ('FM', variableCardinality capitalized)).

]

{ #category : #utility }
FmxMBRelationsGenerationTest >> slotNameinAccess: selector1 inVariable: selector2 [

	self assert: generatedAccess slots first name equals: selector1.
	self assert: generatedVariable slots first name equals: selector2.

]

{ #category : #tests }
FmxMBRelationsGenerationTest >> testContainsMany [

	variable <>-* access.

	self 
		variable: #accesses cardinality: #many container: false
		access: #variable cardinality: #one container: true 

]

{ #category : #tests }
FmxMBRelationsGenerationTest >> testContainsOne [

	variable <>- access.

	self 
		variable: #access cardinality: #one container: false
		access: #variable cardinality: #one container: true 

]

{ #category : #tests }
FmxMBRelationsGenerationTest >> testManyBelongTo [

	variable *-<> access.

	self 
		variable: #access cardinality: #one container: true
		access: #variables cardinality: #many container: false 

]

{ #category : #tests }
FmxMBRelationsGenerationTest >> testManyToMany [

	variable *-* access.

	self 
		variable: #accesses cardinality: #many container: false
		access: #variables cardinality: #many container: false 

]

{ #category : #tests }
FmxMBRelationsGenerationTest >> testManyToOne [

	variable *- access.

	self 
		variable: #access cardinality: #one container: false
		access: #variables cardinality: #many container: false 

]

{ #category : #tests }
FmxMBRelationsGenerationTest >> testOneBelongsTo [

	variable -<> access.
	
	self 
		variable: #access cardinality: #one container: true
		access: #variable cardinality: #one container: false 

]

{ #category : #tests }
FmxMBRelationsGenerationTest >> testOneToMany [

	variable -* access.
	
	self 
		variable: #accesses cardinality: #many container: false
		access: #variable cardinality: #one container: false 

]

{ #category : #tests }
FmxMBRelationsGenerationTest >> testOneToOne [

	variable - access.
	
	self 
		variable: #access cardinality: #one container: false
		access: #variable cardinality: #one container: false 

]

{ #category : #tests }
FmxMBRelationsGenerationTest >> variable: selector2 cardinality: cardinality2 container: container2 access: selector1 cardinality: cardinality1 container: container1 [ 

	self generate.

	self slotNameinAccess: selector1 inVariable: selector2.
	self slotCardinalityinAccess: cardinality1 inVariable: cardinality2.	
	container1
		ifTrue: [ self assertContainerInAccessMethod: selector1 ]
		ifFalse: [ self denyContainerInAccessMethod: selector1 ].
	container2
		ifTrue: [ self assertContainerInVariableMethod: selector2 ]
		ifFalse: [ self denyContainerInVarialbeMethod: selector2 ].

]
