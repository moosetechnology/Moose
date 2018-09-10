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
FmxMBBehaviorTest >> testTestingSelectors [

	"test automatic generation of testing methods in the entities hierarchy"

	| simpleClass |
	
	simpleClass := self newEntityNamed: #Comment.	
	self assert: simpleClass testingSelectors isEmpty.
	simpleClass withTesting.
	self assertCollection: simpleClass testingSelectors hasSameElements: #(isComment).
	

]
