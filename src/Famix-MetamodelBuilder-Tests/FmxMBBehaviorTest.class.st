Class {
	#name : #FmxMBBehaviorTest,
	#superclass : #FmxMBTestCase,
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #testing }
FmxMBBehaviorTest class >> isAbstract [

	^ self name = #FmxMBBehaviorTest
]

{ #category : #accessing }
FmxMBBehaviorTest >> behaviorClass [

	self subclassResponsibility 
]

{ #category : #accessing }
FmxMBBehaviorTest >> newEntityNamed: aString [

	self subclassResponsibility 
]

{ #category : #tests }
FmxMBBehaviorTest >> testAsProperty [

	"traits should not be renamed during creation of properties"

	| behavior generated |
		
	behavior := self newEntityNamed: #Named.	
	
	(behavior property: #from) - (behavior property: #to).
	
	builder generate.
	
	generated := builder testingEnvironment ask classNamed: 'TstNamed'.
	
	self assertCollection: (generated slots collect: #name) hasSameElements: #(from to).

]

{ #category : #tests }
FmxMBBehaviorTest >> testComment [

	"test assigning of a comment to a class"

	| simpleClass generated commentString |
	
	simpleClass := self newEntityNamed: #Comment.	
	commentString := 'Simple testing class'.
	simpleClass comment: commentString.
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstComment'.
	self assert: generated comment content equals: commentString.
]

{ #category : #tests }
FmxMBBehaviorTest >> testCustomTestingSelectors [

	"test automatic generation of custom testing selector"

	| simpleClass |
	
	simpleClass := self newEntityNamed: #Comment.	
	simpleClass testingSelector: #isAComment.
	self assertCollection: simpleClass testingSelectors hasSameElements: #(isAComment).
	simpleClass testingSelector: #isADocumentation.
	self assertCollection: simpleClass testingSelectors hasSameElements: #(isAComment isADocumentation).
	

]

{ #category : #tests }
FmxMBBehaviorTest >> testCustomTestingSelectorsAtOnce [

	"test automatic generation of custom testing selector defined at once"

	| simpleClass |
	
	simpleClass := self newEntityNamed: #Comment.	
	simpleClass testingSelectors: #(isAComment isADocumentation).
	self assertCollection: simpleClass testingSelectors hasSameElements: #(isAComment isADocumentation).
	

]

{ #category : #tests }
FmxMBBehaviorTest >> testDefaultSuperclass [

	| entity |
	
	entity := builder newClassNamed: #Entity.
	
	self assert: entity defaultSuperclass name equals: #MooseEntity.
]

{ #category : #tests }
FmxMBBehaviorTest >> testMultipleContainers [

	| method package class |
	
	package := builder newClassNamed: #Package.    
	method := builder newClassNamed: #Method.    
	class := builder newClassNamed: #Class.    

	(package <>-* class). 
	(class <>-* method). 
	(package <>-* method).

	self assert: method primaryContainerProperties size > 1.
]

{ #category : #tests }
FmxMBBehaviorTest >> testPluralOf [

	| behavior | 
	
	behavior := FmxMBBehavior new.
	
	self assert: (behavior pluralOf: 'object') equals: 'objects'.
	self assert: (behavior pluralOf: 'class') equals: 'classes'.	
	self assert: (behavior pluralOf: 'entity') equals: 'entities'.	

	self assert: (behavior pluralOf: 'object1') equals: 'objects1'.
	self assert: (behavior pluralOf: 'class12') equals: 'classes12'.
	self assert: (behavior pluralOf: 'entity123') equals: 'entities123'.

]

{ #category : #tests }
FmxMBBehaviorTest >> testPrimaryContainerCombined [

	| tPackage tPackageable method package class env |

	tPackage := builder newTraitNamed: #TPackage.
	tPackageable := builder newTraitNamed: #TPackageable.
	
	tPackage <>-* tPackageable. 

	package := builder newClassNamed: #Package.    
	method := builder newClassNamed: #Method.    
	class := builder newClassNamed: #Class.    

	package --|> tPackage.
	class --|> tPackageable.
	(class <>-* method). 
	method usesWithoutPrimaryContainer: tPackageable.
	
	self assert: package primaryContainerProperties size equals: 0.
	self assert: class primaryContainerProperties size equals: 1.
	self assert: method primaryContainerProperties size equals: 1.
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self assert: ((env ask classNamed: #TstPackage) methodNamed: 'belongsTo') isNil.
	self assert: (((env ask classNamed: #TstMethod) methodNamed: 'belongsTo') sourceCode includesSubstring: '^ self class').
	self assert: (((env ask classNamed: #TstClass) methodNamed: 'belongsTo') sourceCode includesSubstring: '^ self package').
]

{ #category : #tests }
FmxMBBehaviorTest >> testPrimaryContainerFromTraits [

	| tMethod tWithMethods method class env |
	
	tMethod := builder newTraitNamed: #TMethod.
	tWithMethods := builder newTraitNamed: #TWithMethods.
	
	tWithMethods <>-* tMethod. 

	class := builder newClassNamed: #Class.    
	method := builder newClassNamed: #Method.    

	class --|> tWithMethods.
	tMethod <|-- method.
	
	self assert: method primaryContainerProperties size equals: 1.
	
	builder generate.
	
	env := builder environment ringEnvironment.
	
	self assert: ((env ask classNamed: #TstClass) methodNamed: 'belongsTo') isNil.
	self assert: (((env ask classNamed: #TstMethod) methodNamed: 'belongsTo') sourceCode includesSubstring: '^ self withMethods').

]

{ #category : #tests }
FmxMBBehaviorTest >> testPrimaryContainerWithoutTraits [

	| method package class env |
	
	package := builder newClassNamed: #Package.    
	method := builder newClassNamed: #Method.    
	class := builder newClassNamed: #Class.    

	(package <>-* class). 
	(class <>-* method). 
	(package <>-* method) withoutPrimaryContainer.

	builder generate.
	
	env := builder environment ringEnvironment.
	
	self assert: ((env ask classNamed: #TstPackage) methodNamed: 'belongsTo') isNil.
	self assert: (((env ask classNamed: #TstMethod) methodNamed: 'belongsTo') sourceCode includesSubstring: '^ self class').
	self assert: (((env ask classNamed: #TstClass) methodNamed: 'belongsTo') sourceCode includesSubstring: '^ self package').
]

{ #category : #tests }
FmxMBBehaviorTest >> testTestingSelectors [

	"test automatic generation of testing methods in the entities hierarchy"

	| simpleClass |
	
	simpleClass := self newEntityNamed: #Comment.	
	self assert: simpleClass testingSelectors isEmpty.
	simpleClass withTesting.
	self assertCollection: simpleClass testingSelectors hasSameElements: #(isComment).
	

]

{ #category : #tests }
FmxMBBehaviorTest >> testWithNavigationOf [

	| method package env |
	
	package := builder newClassNamed: #Package.    
	method := builder newClassNamed: #Method.    

	package <>-* method. "with navigation is implicit"

	builder generate.
	
	env := builder environment ringEnvironment.
	
	self assert: (((env ask classNamed: #TstPackage) methodNamed: 'methodsGroup') sourceCode includesSubstring: '<navigation: ''Methods''>').
	self assert: (((env ask classNamed: #TstMethod) methodNamed: 'packageGroup') sourceCode includesSubstring: '<navigation: ''Package''>').
]

{ #category : #tests }
FmxMBBehaviorTest >> testWithoutNavigation [

	| method package env |
	
	package := builder newClassNamed: #Package.    
	method := builder newClassNamed: #Method.    

	(package <>-* method) withoutNavigation.

	builder generate.
	
	env := builder environment ringEnvironment.
	
	self assert: ((env ask classNamed: #TstPackage) methodNamed: 'methodsGroup') isNil.
	self assert: ((env ask classNamed: #TstMethod) methodNamed: 'packageGroup') isNil.
]
