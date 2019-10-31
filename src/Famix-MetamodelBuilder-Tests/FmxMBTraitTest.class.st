Class {
	#name : #FmxMBTraitTest,
	#superclass : #FmxMBBehaviorTest,
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #accessing }
FmxMBTraitTest >> behaviorClass [

	^ FmxMBTrait
]

{ #category : #accessing }
FmxMBTraitTest >> newEntityNamed: aString [

	^ builder newTraitNamed: aString
]

{ #category : #tests }
FmxMBTraitTest >> testAutogereatedContainsMany [

	| access variable generatedTAccess generatedTVariable |
	
	access := builder newTraitNamed: #TAccess.	
	variable := builder newTraitNamed: #TVariable.	

	(variable <>-* access).

	builder generate.
		
	generatedTAccess := builder testingEnvironment ask classNamed: 'TstTAccess'.
	generatedTVariable := builder testingEnvironment ask classNamed: 'TstTVariable'.
	
	self assert: generatedTAccess slots first name equals: #variable.
	self assert: generatedTAccess slots first expression equals: 'FMOne type: #TstTVariable opposite: #accesses'.
	self assert: generatedTVariable slots first name equals: #accesses.
	self assert: generatedTVariable slots first expression equals: 'FMMany type: #TstTAccess opposite: #variable'.
	
	self assert: ((generatedTAccess methodNamed: #variable) sourceCode includesSubstring: '<container>').
]

{ #category : #tests }
FmxMBTraitTest >> testAutogereatedContainsOne [

	| access variable generatedTAccess generatedTVariable |
	
	access := builder newTraitNamed: #TAccess.	
	variable := builder newTraitNamed: #TVariable.	

	(variable <>- access).

	builder generate.
		
	generatedTAccess := builder testingEnvironment ask classNamed: 'TstTAccess'.
	generatedTVariable := builder testingEnvironment ask classNamed: 'TstTVariable'.
	
	self assert: generatedTAccess slots first name equals: #variable.
	self assert: generatedTAccess slots first expression equals: 'FMOne type: #TstTVariable opposite: #access'.
	self assert: generatedTVariable slots first name equals: #access.
	self assert: generatedTVariable slots first expression equals: 'FMOne type: #TstTAccess opposite: #variable'.
	
	self assert: ((generatedTAccess methodNamed: #variable) sourceCode includesSubstring: '<container>').
	self deny: ((generatedTVariable methodNamed: #access) sourceCode includesSubstring: '<container>').
]

{ #category : #tests }
FmxMBTraitTest >> testAutogereatedManyBelongTo [

	| access variable generatedTAccess generatedTVariable |
	
	access := builder newTraitNamed: #TAccess.	
	variable := builder newTraitNamed: #TVariable.	

	(access *-<> variable).

	builder generate.
		
	generatedTAccess := builder testingEnvironment ask classNamed: 'TstTAccess'.
	generatedTVariable := builder testingEnvironment ask classNamed: 'TstTVariable'.
	
	self assert: generatedTAccess slots first name equals: #variable.
	self assert: generatedTAccess slots first expression equals: 'FMOne type: #TstTVariable opposite: #accesses'.
	self assert: generatedTVariable slots first name equals: #accesses.
	self assert: generatedTVariable slots first expression equals: 'FMMany type: #TstTAccess opposite: #variable'.
	
	self assert: ((generatedTAccess methodNamed: #variable) sourceCode includesSubstring: '<container>').
]

{ #category : #tests }
FmxMBTraitTest >> testAutogereatedManyToMany [

	| access variable generatedTAccess generatedTVariable |
	
	access := builder newTraitNamed: #TAccess.	
	variable := builder newTraitNamed: #TVariable.	

	(variable *-* access).

	builder generate.
		
	generatedTAccess := builder testingEnvironment ask classNamed: 'TstTAccess'.
	generatedTVariable := builder testingEnvironment ask classNamed: 'TstTVariable'.
	
	self assert: generatedTAccess slots first name equals: #variables.
	self assert: generatedTAccess slots first expression equals: 'FMMany type: #TstTVariable opposite: #accesses'.
	self assert: generatedTVariable slots first name equals: #accesses.
	self assert: generatedTVariable slots first expression equals: 'FMMany type: #TstTAccess opposite: #variables'.
	
	self deny: ((generatedTAccess methodNamed: #variables) sourceCode includesSubstring: '<container>').
	self deny: ((generatedTVariable methodNamed: #accesses) sourceCode includesSubstring: '<container>').
]

{ #category : #tests }
FmxMBTraitTest >> testAutogereatedManyToOne [

	| access variable generatedTAccess generatedTVariable |
	
	access := builder newTraitNamed: #TAccess.	
	variable := builder newTraitNamed: #TVariable.	

	(access *- variable).

	builder generate.
		
	generatedTAccess := builder testingEnvironment ask classNamed: 'TstTAccess'.
	generatedTVariable := builder testingEnvironment ask classNamed: 'TstTVariable'.
	
	self assert: generatedTAccess slots first name equals: #variable.
	self assert: generatedTAccess slots first expression equals: 'FMOne type: #TstTVariable opposite: #accesses'.
	self assert: generatedTVariable slots first name equals: #accesses.
	self assert: generatedTVariable slots first expression equals: 'FMMany type: #TstTAccess opposite: #variable'.
	
	self deny: ((generatedTAccess methodNamed: #variable) sourceCode includesSubstring: '<container>').
]

{ #category : #tests }
FmxMBTraitTest >> testAutogereatedOneBelongsTo [

	| access variable generatedTAccess generatedTVariable |
	
	access := builder newTraitNamed: #TAccess.	
	variable := builder newTraitNamed: #TVariable.	

	(variable -<> access).

	builder generate.
		
	generatedTAccess := builder testingEnvironment ask classNamed: 'TstTAccess'.
	generatedTVariable := builder testingEnvironment ask classNamed: 'TstTVariable'.
	
	self assert: generatedTAccess slots first name equals: #variable.
	self assert: generatedTAccess slots first expression equals: 'FMOne type: #TstTVariable opposite: #access'.
	self assert: generatedTVariable slots first name equals: #access.
	self assert: generatedTVariable slots first expression equals: 'FMOne type: #TstTAccess opposite: #variable'.
	
	self deny: ((generatedTAccess methodNamed: #variable) sourceCode includesSubstring: '<container>').
	self assert: ((generatedTVariable methodNamed: #access) sourceCode includesSubstring: '<container>').
]

{ #category : #tests }
FmxMBTraitTest >> testAutogereatedOneToMany [

	| access variable generatedTAccess generatedTVariable |
	
	access := builder newTraitNamed: #TAccess.	
	variable := builder newTraitNamed: #TVariable.	

	(variable -* access).

	builder generate.
		
	generatedTAccess := builder testingEnvironment ask classNamed: 'TstTAccess'.
	generatedTVariable := builder testingEnvironment ask classNamed: 'TstTVariable'.
	
	self assert: generatedTAccess slots first name equals: #variable.
	self assert: generatedTAccess slots first expression equals: 'FMOne type: #TstTVariable opposite: #accesses'.
	self assert: generatedTVariable slots first name equals: #accesses.
	self assert: generatedTVariable slots first expression equals: 'FMMany type: #TstTAccess opposite: #variable'.
	
	self deny: ((generatedTAccess methodNamed: #variable) sourceCode includesSubstring: '<container>').
]

{ #category : #tests }
FmxMBTraitTest >> testAutogereatedOneToOne [

	| access variable generatedTAccess generatedTVariable |
	
	access := builder newTraitNamed: #TAccess.	
	variable := builder newTraitNamed: #TVariable.	

	(variable - access).

	builder generate.
		
	generatedTAccess := builder testingEnvironment ask classNamed: 'TstTAccess'.
	generatedTVariable := builder testingEnvironment ask classNamed: 'TstTVariable'.
	
	self assert: generatedTAccess slots first name equals: #variable.
	self assert: generatedTAccess slots first expression equals: 'FMOne type: #TstTVariable opposite: #access'.
	self assert: generatedTVariable slots first name equals: #access.
	self assert: generatedTVariable slots first expression equals: 'FMOne type: #TstTAccess opposite: #variable'.
	
	self deny: ((generatedTAccess methodNamed: #variable) sourceCode includesSubstring: '<container>').
	self deny: ((generatedTVariable methodNamed: #access) sourceCode includesSubstring: '<container>').
]

{ #category : #tests }
FmxMBTraitTest >> testCustomPackageForUserClasses [

	| simpleClass generated |
	
	builder configuration packageName: 'Custom'.
	
	simpleClass := builder newTraitNamed: #TComment.	
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstTComment'.

	self assert: generated package name equals: #Custom.
	
]

{ #category : #tests }
FmxMBTraitTest >> testCustomPackageForUserClassesChanged [
	| simpleClass generated generatedAccess |
	builder configuration packageName: 'Custom'.

	simpleClass := builder newTraitNamed: #TComment.

	builder configuration packageName: 'Custom2'.

	simpleClass := builder newTraitNamed: #TAccess.

	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstTComment'.
	generatedAccess := builder testingEnvironment ask classNamed: 'TstTAccess'.

	self assert: generated package name equals: #Custom.
	self assert: generatedAccess package name equals: #Custom2
]

{ #category : #tests }
FmxMBTraitTest >> testDefaultPackageForUserClasses [
	| simpleClass userClass |
	simpleClass := builder newTraitNamed: #TComment.
	builder generate.
	userClass := builder testingEnvironment ask classNamed: 'TstTComment'.

	self assert: userClass package name equals: #Tst
]

{ #category : #tests }
FmxMBTraitTest >> testMultipleTraits [

	builder newTraitNamed: #TComment.	
	builder newTraitNamed: #TMethod.
	builder newTraitNamed: #TPackage.

	builder generate.
	builder testingEnvironment ask classNamed: 'TstTComment'.
	builder testingEnvironment ask classNamed: 'TstTMethod'.
	builder testingEnvironment ask classNamed: 'TstTPackage'.

]

{ #category : #tests }
FmxMBTraitTest >> testSimpleClassAnnotation [

	| generated method |
		
	builder newTraitNamed: #TComment.	
	builder generate.

	generated := builder testingEnvironment ask classNamed: 'TstTComment'.

	method := generated classSide methodNamed: #annotation.
	self assert: (method sourceCode includesSubstring: '<FMClass: #TComment super: #Object>').
	self assert: (method sourceCode includesSubstring: '<package: #Tst>').


]

{ #category : #tests }
FmxMBTraitTest >> testSimpleTrait [

	| generated |
	
	builder newTraitNamed: #TComment.	
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstTComment'.
	self assert: generated notNil.
	self assert: generated isClass.
	self assert: generated superclass name equals: 'Trait'.
	self assert: generated slots isEmpty.
	self assert: generated instanceSide localSelectors isEmpty.	
	self assertCollection: generated classSide localSelectors sorted equals: #(annotation).
]

{ #category : #tests }
FmxMBTraitTest >> testTestingMethods [

	"test messages isMetamodelClass and isMetamodelTrait"
	
	| tNamed |

	tNamed := builder newTraitNamed: #TNamed.	

	self deny: tNamed isMetamodelClass.
	self assert: tNamed isMetamodelTrait.
	
	
]

{ #category : #'tests - names' }
FmxMBTraitTest >> testTraitGeneralization [

	| aTrait aClass |
		
	aTrait := builder newTraitNamed: #TVariable.	
	aClass := builder newClassNamed: #Variable.	
		
	self should: [aTrait --|> aClass] raise: FmxMBTraitsGeneralizationError
]

{ #category : #tests }
FmxMBTraitTest >> testTraitTestingSelectors [

	"test automatic generation of testing methods in the entities hierarchy"

	| simpleClass |
	
	simpleClass := builder newTraitNamed: #TComment.	
	self assert: simpleClass testingSelectors isEmpty.
	simpleClass withTesting.
	self assertCollection: simpleClass testingSelectors hasSameElements: #(isComment).
]

{ #category : #tests }
FmxMBTraitTest >> testUses [

	| behavior tBehavior generatedBehavior generatedTBehavior |
	
	behavior := builder newClassNamed: #Behavior.	
	tBehavior := builder newTraitNamed: #TBehavior.

	behavior uses: tBehavior.
	
	builder generate.

	generatedBehavior := builder testingEnvironment ask classNamed: 'TstBehavior'.
	generatedTBehavior := builder testingEnvironment ask classNamed: 'TstTBehavior'.
	
	self deny: (generatedBehavior superclass = generatedTBehavior).
	self assertCollection: generatedBehavior traits asArray equals: { generatedTBehavior }.
		

]
