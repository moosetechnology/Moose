Class {
	#name : #FmxMBBuilderRelationTest,
	#superclass : #FmxMBTestCase,
	#category : #'Famix-MetamodelBuilder-Tests'
}

{ #category : #initialization }
FmxMBBuilderRelationTest >> checkArrow: aBinarySelector from: cardinality1 to: cardinality2 containerFrom: containerFrom containerTo: containerTo forTraits: aBoolean [

	| tClass tComment generatedTClass generatedTComment hasContainer |
	
	aBoolean 
		ifTrue: [ 		
			tClass := builder newTraitNamed: #TClass. 
			tComment := builder newTraitNamed: #TComment ]
		ifFalse: [ 
			tClass := builder newClassNamed: #TClass. 
			tComment := builder newClassNamed: #TComment ].		

	(tClass property: #property1) perform: aBinarySelector with: (tComment property: #property2).
	
	builder generate.
	
	generatedTClass := builder testingEnvironment ask classNamed: 'TstTClass'.
	generatedTComment := builder testingEnvironment ask classNamed: 'TstTComment'.
	
	self assert: generatedTClass slots size equals: 1.
	self assert: generatedTClass slots first name equals: #property1.
	self assert: generatedTClass slots first expression equals: cardinality1, ' type: #TstTComment opposite: #property2'.
	self assertCollection: (generatedTClass instanceSide selectors copyWithoutAll: { #addProperty1:. #property1Group. #property2Group. #belongsTo. #belongsTo:}) hasSameElements: #(property1 property1:).
	hasContainer := (generatedTClass methodNamed: #property1) sourceCode includesSubstring: '<container>'.
	containerFrom 
		ifTrue: [ self assert: hasContainer ]
		ifFalse: [ self deny: hasContainer ].

	self assert: generatedTComment slots size equals: 1.
	self assert: generatedTComment slots first name equals: #property2.
	self assert: generatedTComment slots first expression equals: cardinality2, ' type: #TstTClass opposite: #property1'.
	self assertCollection: (generatedTComment instanceSide selectors copyWithoutAll: { #addProperty2:. #property1Group. #property2Group. #belongsTo. #belongsTo:}) hasSameElements: #(property2 property2:).
	hasContainer := (generatedTComment methodNamed: #property2) sourceCode includesSubstring: '<container>'.
	containerTo
		ifTrue: [ self assert: hasContainer ]
		ifFalse: [ self deny: hasContainer ].

]

{ #category : #initialization }
FmxMBBuilderRelationTest >> resetBuilder [

	builder := FamixMetamodelBuilder forTesting.

]

{ #category : #initialization }
FmxMBBuilderRelationTest >> testClassRelations [

	self checkArrow: #- from: 'FMOne' to: 'FMOne' containerFrom: false containerTo: false forTraits: false.
	self resetBuilder.
	self checkArrow: #*- from: 'FMOne' to: 'FMMany' containerFrom: false containerTo: false forTraits: false.
	self resetBuilder.
	self checkArrow: #-* from: 'FMMany' to: 'FMOne' containerFrom: false containerTo: false forTraits: false.
	self resetBuilder.
	self checkArrow: #*-* from: 'FMMany' to: 'FMMany' containerFrom: false containerTo: false forTraits: false.

	self resetBuilder.
	self checkArrow: #-<> from: 'FMOne' to: 'FMOne' containerFrom: true containerTo: false forTraits: false.
	self resetBuilder.
	self checkArrow: #<>- from: 'FMOne' to: 'FMOne' containerFrom: false containerTo: true forTraits: false.
	
	self resetBuilder.
	self checkArrow: #*-<> from: 'FMOne' to: 'FMMany' containerFrom: true containerTo: false forTraits: false.
	self resetBuilder.
	self checkArrow: #<>-* from: 'FMMany' to: 'FMOne' containerFrom: false containerTo: true forTraits: false.
	
]

{ #category : #initialization }
FmxMBBuilderRelationTest >> testOneToOneTraitsRelation [

	| tClass tComment generatedTClass generatedTComment |
		
	tClass := builder newTraitNamed: #TClass. 
	tComment := builder newTraitNamed: #TComment. 

	(tClass property: #property1) - (tComment property: #property2).
	
	builder generate.
	
	generatedTClass := builder testingEnvironment ask classNamed: 'TstTClass'.
	generatedTComment := builder testingEnvironment ask classNamed: 'TstTComment'.
	
	self assert: generatedTClass slots size equals: 1.
	self assert: generatedTClass slots first name equals: #property1.
	self assert: generatedTClass slots first expression equals: 'FMOne type: #TstTComment opposite: #property2'.

	self assertCollection: generatedTClass instanceSide selectors hasSameElements: #(property1 property1:).

	self assert: generatedTComment slots size equals: 1.
	self assert: generatedTComment slots first name equals: #property2.
	self assert: generatedTComment slots first expression equals: 'FMOne type: #TstTClass opposite: #property1'.

	self assertCollection: generatedTComment instanceSide selectors hasSameElements: #(property2 property2:).

]

{ #category : #initialization }
FmxMBBuilderRelationTest >> testTraitRelations [

	self checkArrow: #- from: 'FMOne' to: 'FMOne' containerFrom: false containerTo: false forTraits: true.
	self resetBuilder.
	self checkArrow: #*- from: 'FMOne' to: 'FMMany' containerFrom: false containerTo: false forTraits: true.
	self resetBuilder.
	self checkArrow: #-* from: 'FMMany' to: 'FMOne' containerFrom: false containerTo: false forTraits: true.
	self resetBuilder.
	self checkArrow: #*-* from: 'FMMany' to: 'FMMany' containerFrom: false containerTo: false forTraits: true.

	self resetBuilder.
	self checkArrow: #-<> from: 'FMOne' to: 'FMOne' containerFrom: true containerTo: false forTraits: true.
	self resetBuilder.
	self checkArrow: #<>- from: 'FMOne' to: 'FMOne' containerFrom: false containerTo: true forTraits: true.
	
		self resetBuilder.
	self checkArrow: #*-<> from: 'FMOne' to: 'FMMany' containerFrom: true containerTo: false forTraits: true.
	self resetBuilder.
	self checkArrow: #<>-* from: 'FMMany' to: 'FMOne' containerFrom: false containerTo: true forTraits: true.
	
]
