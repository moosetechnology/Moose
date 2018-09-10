Class {
	#name : #FamixMetamodelBuilderTraitTest,
	#superclass : #FmxMBBehaviorTest,
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #accessing }
FamixMetamodelBuilderTraitTest >> behaviorClass [

	^ FmxMBTrait
]

{ #category : #accessing }
FamixMetamodelBuilderTraitTest >> newEntityNamed: aString [

	^ builder newTraitNamed: aString
]

{ #category : #'tests - names' }
FamixMetamodelBuilderTraitTest >> testAsProperty [

	"traits should not be renamed during creation of properties"

	| aTrait |
		
	aTrait := builder newTraitNamed: #TVariable.	
		
	self shouldnt: [ aTrait as: #TVariable property: #property ] raise: FmxMBTraitRenamingError.
	self should: [ aTrait as: #TOtherName property: #property ] raise: FmxMBTraitRenamingError.
]

{ #category : #tests }
FamixMetamodelBuilderTraitTest >> testAutogereatedContainsMany [

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
FamixMetamodelBuilderTraitTest >> testAutogereatedContainsOne [

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
FamixMetamodelBuilderTraitTest >> testAutogereatedManyBelongTo [

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
FamixMetamodelBuilderTraitTest >> testAutogereatedManyToMany [

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
FamixMetamodelBuilderTraitTest >> testAutogereatedManyToOne [

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
FamixMetamodelBuilderTraitTest >> testAutogereatedOneBelongsTo [

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
FamixMetamodelBuilderTraitTest >> testAutogereatedOneToMany [

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
FamixMetamodelBuilderTraitTest >> testAutogereatedOneToOne [

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
FamixMetamodelBuilderTraitTest >> testCustomPackageForUserClasses [

	| simpleClass generated |
	
	builder packageName: 'Custom'.
	
	simpleClass := builder newTraitNamed: #TComment.	
	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstTComment'.

	self assert: generated package name equals: #Custom.
	
]

{ #category : #tests }
FamixMetamodelBuilderTraitTest >> testCustomPackageForUserClassesChanged [

	| simpleClass generated generatedAccess  |
	
	builder packageName: 'Custom'.
	
	simpleClass := builder newTraitNamed: #TComment.	

	builder packageName: 'Custom2'.

	simpleClass := builder newTraitNamed: #TAccess.	

	builder generate.
	generated := builder testingEnvironment ask classNamed: 'TstTComment'.
	generatedAccess := builder testingEnvironment ask classNamed: 'TstTAccess'.

	self assert: (generated package name = #Custom).
	self assert: (generatedAccess package name = #Custom2).


	
]

{ #category : #tests }
FamixMetamodelBuilderTraitTest >> testDefaultPackageForUserClasses [

	| simpleClass  userClass |
	
	simpleClass := builder newTraitNamed: #TComment.	
	builder generate.
	userClass := builder testingEnvironment ask classNamed: 'TstTComment'.

	self assert: (userClass package name = #Tst).
	
]

{ #category : #tests }
FamixMetamodelBuilderTraitTest >> testMultipleTraits [

	builder newTraitNamed: #TComment.	
	builder newTraitNamed: #TMethod.
	builder newTraitNamed: #TPackage.

	builder generate.
	builder testingEnvironment ask classNamed: 'TstTComment'.
	builder testingEnvironment ask classNamed: 'TstTMethod'.
	builder testingEnvironment ask classNamed: 'TstTPackage'.

]

{ #category : #'tests - names' }
FamixMetamodelBuilderTraitTest >> testRelatedOwnerTraitName [

	"test if relatedOwnerTraitName is correctly created from a trait name. It should be the same."

	| aTrait |
		
	aTrait := builder newTraitNamed: #TVariable.	
	self assert: aTrait relatedOwnerTraitName equals: 'TVariable'.
		
	aTrait := builder newTraitNamed: #TAccess.	
	self assert: aTrait relatedOwnerTraitName equals: 'TAccess'.

	aTrait := builder newTraitNamed: #TMethod.	
	self assert: aTrait relatedOwnerTraitName equals: 'TMethod'.

]

{ #category : #'tests - names' }
FamixMetamodelBuilderTraitTest >> testRelatedTraitName [

	"test if a related trait name is correctly generated from a traitName name. It should be the same."

	| aTrait |
		
	aTrait := builder newTraitNamed: #TVariable.	
	self assert: aTrait relatedTraitName equals: 'TVariable'.
		
	aTrait := builder newTraitNamed: #TAccess.	
	self assert: aTrait relatedTraitName equals: 'TAccess'.

	aTrait := builder newTraitNamed: #TMethod.	
	self assert: aTrait relatedTraitName equals: 'TMethod'.

]

{ #category : #tests }
FamixMetamodelBuilderTraitTest >> testSimpleClassAnnotation [

	| simpleClass generated method |
		
	simpleClass := builder newTraitNamed: #TComment.	
	builder generate.

	generated := builder testingEnvironment ask classNamed: 'TstTComment'.

	method := generated classSide methodNamed: #annotation.
	self assert: (method sourceCode includesSubstring: '<MSEClass: #TComment super: #Trait>').
	self assert: (method sourceCode includesSubstring: '<package: #Tst>').


]

{ #category : #tests }
FamixMetamodelBuilderTraitTest >> testSimpleTrait [

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
FamixMetamodelBuilderTraitTest >> testTestingMethods [

	"test messages isMetamodelClass and isMetamodelTrait"
	
	| tNamed |

	tNamed := builder newTraitNamed: #TNamed.	

	self deny: tNamed isMetamodelClass.
	self assert: tNamed isMetamodelTrait.
	
	
]

{ #category : #'tests - names' }
FamixMetamodelBuilderTraitTest >> testTraitGeneralization [

	| aTrait aClass |
		
	aTrait := builder newTraitNamed: #TVariable.	
	aClass := builder newClassNamed: #Variable.	
		
	self should: [aTrait --|> aClass] raise: FmxMBTraitsGeneralizationError
]

{ #category : #tests }
FamixMetamodelBuilderTraitTest >> testTraitTestingSelectors [

	"test automatic generation of testing methods in the entities hierarchy"

	| simpleClass |
	
	simpleClass := builder newTraitNamed: #TComment.	
	self assert: simpleClass testingSelectors isEmpty.
	simpleClass withTesting.
	self assertCollection: simpleClass testingSelectors hasSameElements: #(isComment).
]

{ #category : #tests }
FamixMetamodelBuilderTraitTest >> testUses [

	| behavior tBehavior generatedBehavior generatedTBehavior method |
	
	behavior := builder newClassNamed: #Behavior.	
	tBehavior := builder newTraitNamed: #TBehavior.

	behavior uses: tBehavior.
	
	builder generate.

	generatedBehavior := builder testingEnvironment ask classNamed: 'TstBehavior'.
	generatedTBehavior := builder testingEnvironment ask classNamed: 'TstTBehavior'.
	
	self deny: (generatedBehavior superclass = generatedTBehavior).
	self assertCollection: generatedBehavior traits asArray equals: { generatedTBehavior }.
		

]
