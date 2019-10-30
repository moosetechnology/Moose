Class {
	#name : #FmxMBClassGeneralizationsTest,
	#superclass : #FmxMBTestCase,
	#instVars : [
		'named',
		'behavior',
		'class'
	],
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #running }
FmxMBClassGeneralizationsTest >> checkGeneralizationWithAnnotations [

	"check if TstClass is correctly created as a subclass of TstBehavior"

	| generatedBehavior generatedClass annotation |
	
	builder generate.
	
	generatedBehavior := builder testingEnvironment ask classNamed: 'TstBehavior'.
	generatedClass := builder testingEnvironment ask classNamed: 'TstClass'.
	
	self assert: generatedClass superclass equals: generatedBehavior.
	annotation := generatedClass classSide methodNamed: #annotation.
	self assert: (annotation sourceCode includesSubstring: '<FMClass: #Class super: #TstBehavior>').
	self assert: (annotation sourceCode includesSubstring: '<generated>').
	

]

{ #category : #running }
FmxMBClassGeneralizationsTest >> checkHierarchy [

	self assert: named allClassGeneralizations isEmpty.
	self assertCollection: behavior allClassGeneralizations hasSameElements: { named }.
	self assertCollection: class allClassGeneralizations hasSameElements: { named. behavior }.

]

{ #category : #running }
FmxMBClassGeneralizationsTest >> setUp [

	super setUp.

	named := builder newClassNamed: #Named.	
	behavior := builder newClassNamed: #Behavior.	
	class := builder newClassNamed: #Class.

]

{ #category : #tests }
FmxMBClassGeneralizationsTest >> testAllClassGeneralizations [
	
	named <|-- behavior.
	behavior <|-- class.
	
	self checkHierarchy.
]

{ #category : #tests }
FmxMBClassGeneralizationsTest >> testAllClassGeneralizationsInChain [
	
	named <|-- behavior <|-- class.
	
	self checkHierarchy.
]

{ #category : #tests }
FmxMBClassGeneralizationsTest >> testAllClassGeneralizationsInChainInverted [
	
	class --|> behavior --|> named.
	
	self checkHierarchy.
]

{ #category : #tests }
FmxMBClassGeneralizationsTest >> testClassOppositeGeneralization [

	behavior <|-- class.

	self checkGeneralizationWithAnnotations
]

{ #category : #tests }
FmxMBClassGeneralizationsTest >> testGeneralization [

	class --|> behavior.

	self checkGeneralizationWithAnnotations
]

{ #category : #tests }
FmxMBClassGeneralizationsTest >> testSubclassOf [
	
	behavior subclassOf: named. 
	class subclassOf: behavior.
	
	self checkHierarchy.
]
