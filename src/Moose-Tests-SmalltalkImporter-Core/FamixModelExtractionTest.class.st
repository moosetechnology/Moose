Class {
	#name : #FamixModelExtractionTest,
	#superclass : #LANAbstractImportTest,
	#instVars : [
		'mseNodeClassName',
		'mseNodeClass',
		'msePrinterClassName',
		'mseOutputServerClassName',
		'nodeName',
		'nextNode',
		'serverType',
		'outputServerName',
		'acceptServerName',
		'acceptNodeName',
		'canOutputServerName',
		'canOutputNodeName',
		'nameNodeName',
		'nameNodeNameColon',
		'nextNodeName',
		'nextNodeNameColon',
		'initializeNodeName',
		'sendNodeName',
		'printOnNodeName',
		'newNodeClassName',
		'canOriginateNodeName',
		'methodWithEmptyBodyNodeName'
	],
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #auxiliary }
FamixModelExtractionTest >> assignAttributes [
	nodeName := FamixSmalltalkNameResolver 
		mooseNameForAttributeNamed: #name
		class: mseNodeClassName
		classSide: false.
	nextNode := FamixSmalltalkNameResolver 
		mooseNameForAttributeNamed: #nextNode
		class: mseNodeClassName
		classSide: false.
	serverType := FamixSmalltalkNameResolver 
		mooseNameForAttributeNamed: #serverType
		class: mseOutputServerClassName
		classSide: false
]

{ #category : #auxiliary }
FamixModelExtractionTest >> assignClasses [
	mseNodeClassName := LANNode mooseName.
	mseNodeClass := self model entityNamed: mseNodeClassName.
	msePrinterClassName := LANPrintServer mooseName.
	mseOutputServerClassName := LANOutputServer mooseName
]

{ #category : #auxiliary }
FamixModelExtractionTest >> assignMethods [
	methodWithEmptyBodyNodeName := FamixSmalltalkNameResolver 
				uniqueNameForMethodWithSmalltalkSelector: #methodWithEmptyBody
				hasClassScope: false
				class: mseNodeClassName.
	outputServerName := FamixSmalltalkNameResolver 
				uniqueNameForMethodWithSmalltalkSelector: #output:
				hasClassScope: false
				class: mseOutputServerClassName.
	acceptServerName := FamixSmalltalkNameResolver 
				uniqueNameForMethodWithSmalltalkSelector: #accept:
				hasClassScope: false
				class: mseOutputServerClassName.
	acceptNodeName := FamixSmalltalkNameResolver 
				uniqueNameForMethodWithSmalltalkSelector: #accept:
				hasClassScope: false
				class: mseNodeClassName.
	canOutputServerName := FamixSmalltalkNameResolver 
				uniqueNameForMethodWithSmalltalkSelector: #canOutput
				hasClassScope: false
				class: mseOutputServerClassName.
	canOutputNodeName := FamixSmalltalkNameResolver 
				uniqueNameForMethodWithSmalltalkSelector: #canOutput
				hasClassScope: false
				class: mseNodeClassName.
	nameNodeName := FamixSmalltalkNameResolver 
				uniqueNameForMethodWithSmalltalkSelector: #name
				hasClassScope: false
				class: mseNodeClassName.
	nameNodeNameColon := FamixSmalltalkNameResolver 
				uniqueNameForMethodWithSmalltalkSelector: #name:
				hasClassScope: false
				class: mseNodeClassName.
	nextNodeName := FamixSmalltalkNameResolver 
				uniqueNameForMethodWithSmalltalkSelector: #nextNode
				hasClassScope: false
				class: mseNodeClassName.
	nextNodeNameColon := FamixSmalltalkNameResolver 
				uniqueNameForMethodWithSmalltalkSelector: #nextNode:
				hasClassScope: false
				class: mseNodeClassName.
	initializeNodeName := FamixSmalltalkNameResolver 
				uniqueNameForMethodWithSmalltalkSelector: #initialize
				hasClassScope: false
				class: mseNodeClassName.
	printOnNodeName := FamixSmalltalkNameResolver 
				uniqueNameForMethodWithSmalltalkSelector: #printOn:
				hasClassScope: false
				class: mseNodeClassName.
	sendNodeName := FamixSmalltalkNameResolver 
				uniqueNameForMethodWithSmalltalkSelector: #send:
				hasClassScope: false
				class: mseNodeClassName.
	canOriginateNodeName := FamixSmalltalkNameResolver 
				uniqueNameForMethodWithSmalltalkSelector: #canOriginate
				hasClassScope: false
				class: mseNodeClassName.
	newNodeClassName := FamixSmalltalkNameResolver 
				uniqueNameForMethodWithSmalltalkSelector: #new
				hasClassScope: true
				class: mseNodeClassName.
]

{ #category : #running }
FamixModelExtractionTest >> setUp [
	super setUp.
	self assignClasses.
	self assignAttributes.
	self assignMethods
]

{ #category : #tests }
FamixModelExtractionTest >> testAccessesFromAndToShouldNotBeNil [
	| accesses |
	accesses := self model allAccesses.
	self assert: (accesses select: [ :a | a from isNil ]) isEmpty.
	self assert: (accesses select: [ :a | a to isNil ]) isEmpty.

]

{ #category : #tests }
FamixModelExtractionTest >> testAccessesReification [

	| accesses |
	accesses := self model allAccesses.
	self assert: accesses isEmpty not.
	accesses do: [:each | self assert: (each accessor  usesTrait: FamixTMethod)].
]

{ #category : #tests }
FamixModelExtractionTest >> testAllLocalVariables [
	self
		assert: self model allLocalVariables size
		equals: (self model allMethods inject: 0 into: [ :sum :each | sum + each localVariables size ]).
	self
		assert: self model allLocalVariables size
		equals: (self model allMethods flatCollect: [ :each | each localVariables ]) size
]

{ #category : #tests }
FamixModelExtractionTest >> testAllOutgoingAccesses [
	self
		assert: self model allAccesses size
		equals: (self model allMethods inject: 0 into: [ :sum :each | sum + each accesses size ])
]

{ #category : #tests }
FamixModelExtractionTest >> testAllOutgoingInvocations [
	self
		assert: self model allInvocations size
		equals: (self model allMethods inject: 0 into: [ :sum :each | sum + each outgoingInvocations size ])
]

{ #category : #tests }
FamixModelExtractionTest >> testFlatCollect [
	self assert: self model allMethods size equals: (self model allClasses flatCollect: [ :each | each methods ]) size.
	self
		assert: self model allInvocations size
		equals: (self model allMethods flatCollect: [ :each | each outgoingInvocations ]) size.
	self assert: self model allAccesses size equals: (self model allMethods flatCollect: [ :each | each accesses ]) size
]

{ #category : #tests }
FamixModelExtractionTest >> testHasEmptyBody [

	self assert: (self model entityNamed: methodWithEmptyBodyNodeName) hasEmptyBody.
	self deny: (self model entityNamed: acceptNodeName) hasEmptyBody
]

{ #category : #tests }
FamixModelExtractionTest >> testInheritedAttributes [
	| inheritedAtts |
	inheritedAtts := (self model entityNamed: msePrinterClassName) inheritedAttributes.
	self assert: (self model entityNamed: msePrinterClassName) superclassHierarchy size equals: 5.
	self assert: inheritedAtts size equals: (self totalNumberOfAttributesFor: LANPrintServer superclass).
	self assert: (inheritedAtts reject: [ :each | each hasClassScope ]) size equals: 5.
	self assert: (inheritedAtts includes: (self model entityNamed: nodeName)).
	self assert: (inheritedAtts includes: (self model entityNamed: nextNode)).
	self assert: (inheritedAtts includes: (self model entityNamed: serverType)).
	self assert: (inheritedAtts select: [ :each | each hasClassScope ]) size equals: 1
]

{ #category : #tests }
FamixModelExtractionTest >> testInheritedMethods [
	| inheritedMethods |
	inheritedMethods := (self model entityNamed: msePrinterClassName) inheritedMethods.
	self assert: inheritedMethods size equals: 15.
	self assert: (inheritedMethods includes: (self model entityNamed: outputServerName)).
	self assert: (inheritedMethods includes: (self model entityNamed: acceptServerName)).
	self assert: (inheritedMethods includes: (self model entityNamed: acceptNodeName)).
	self assert: (inheritedMethods includes: (self model entityNamed: canOutputServerName)).
	self assert: (inheritedMethods includes: (self model entityNamed: canOutputNodeName)).	"overridden in OutputServer"
	self assert: (inheritedMethods includes: (self model entityNamed: nameNodeName)).
	self assert: (inheritedMethods includes: (self model entityNamed: nameNodeNameColon)).
	self assert: (inheritedMethods includes: (self model entityNamed: nextNodeName)).
	self assert: (inheritedMethods includes: (self model entityNamed: nextNodeNameColon)).
	self assert: (inheritedMethods includes: (self model entityNamed: initializeNodeName)).
	self assert: (inheritedMethods includes: (self model entityNamed: printOnNodeName)).
	self assert: (inheritedMethods includes: (self model entityNamed: sendNodeName)).
	self assert: (inheritedMethods includes: (self model entityNamed: canOriginateNodeName)).
	self assert: (inheritedMethods includes: (self model entityNamed: methodWithEmptyBodyNodeName)).
	self deny: (inheritedMethods includes: (self model entityNamed: newNodeClassName))	"class method of Node"
]

{ #category : #tests }
FamixModelExtractionTest >> testInheritedSignatures [
	"Note: non-ST features like private methods and multiple inheritance issues for C++ (and Java
	 interfaces) are not (yet) tested"

	| inheritedSignatures class className |
	className := LANPrintServer mooseName.
	class := self model entityNamed: className.
	inheritedSignatures := class inheritedSignatures.
	#(#output: #accept: #canOutput #name #name: #nextNode #nextNode: #initialize #printOn: #send: #canOriginate #methodWithEmptyBody)
		do: [ :each | self assert: (inheritedSignatures contains: [ :sign | '*' , each , '*' match: sign ]) ].
	self assert: inheritedSignatures size equals: (LANOutputServer selectors , LANNode selectors) asSet size
]

{ #category : #tests }
FamixModelExtractionTest >> testInheritedSignaturesToMethod [
	"Note: non-ST features like private methods and multiple inheritance issues for C++ (and Java
	 interfaces) are not (yet) tested"

	| inheritedSignatures |
	inheritedSignatures := (self model entityNamed: msePrinterClassName) inheritedSignaturesToMethod.
	self assert: (inheritedSignatures at: #'output:(Object)') equals: (self model entityNamed: outputServerName).
	self assert: (inheritedSignatures at: #'canOutput()') equals: (self model entityNamed: canOutputServerName).
	self assert: (inheritedSignatures at: #'name()') equals: (self model entityNamed: nameNodeName).
	self assert: (inheritedSignatures at: #'name:(Object)') equals: (self model entityNamed: nameNodeNameColon).
	self assert: (inheritedSignatures at: #'nextNode()') equals: (self model entityNamed: nextNodeName).
	self assert: (inheritedSignatures at: #'nextNode:(Object)') equals: (self model entityNamed: nextNodeNameColon).
	self assert: (inheritedSignatures at: #'initialize()') equals: (self model entityNamed: initializeNodeName).
	self assert: (inheritedSignatures at: #'printOn:(Object)') equals: (self model entityNamed: printOnNodeName).
	self assert: (inheritedSignatures at: #'send:(Object)') equals: (self model entityNamed: sendNodeName).
	self assert: (inheritedSignatures at: #'canOriginate()') equals: (self model entityNamed: canOriginateNodeName).
	self
		assert: (inheritedSignatures at: #'methodWithEmptyBody()')
		equals: (self model entityNamed: methodWithEmptyBodyNodeName).
	self assert: (inheritedSignatures at: #'accept:(Object)') equals: (self model entityNamed: acceptServerName).
	self assert: inheritedSignatures size equals: 13
]

{ #category : #tests }
FamixModelExtractionTest >> testIsConstructor [
	self assert: (self model entityNamed: (LANNode class>>#new) mooseName) isConstructor
]

{ #category : #tests }
FamixModelExtractionTest >> testIsSide [

	| aFamixClass |
	aFamixClass := self model entityNamed: LANFileServer class mooseName.
	self assert: aFamixClass isClassSide.
	self assert: aFamixClass isInstanceSide not.
	aFamixClass := self model entityNamed: LANFileServer mooseName.
	self assert: aFamixClass isClassSide not.
	self assert: aFamixClass isInstanceSide.
]

{ #category : #tests }
FamixModelExtractionTest >> testModelDoesNotContainDuplicateSharedVars [

	self 	assert: 1
			equals: (self model entities select: [:e| e name = 'DependentsFields']) size
]

{ #category : #tests }
FamixModelExtractionTest >> testNameAndUniqueNameForNotNamed [

	| mseMethod mseMethodName |
	mseMethodName := FamixSmalltalkNameResolver 
				uniqueNameForMethodWithSmalltalkSelector: #printOn:
				hasClassScope: false
				class: LANNode mooseName.
	mseMethod := self model entityNamed: mseMethodName.
	self assert: (mseMethod outgoingInvocations anySatisfy: [:each | each signature = #'printString()'])
]

{ #category : #tests }
FamixModelExtractionTest >> testNumberOfFormalParameters [
	| method |
	method := self model entityNamed: acceptNodeName.
	self assert: method numberOfParameters equals: 1.
	method := self model entityNamed: canOriginateNodeName.
	self assert: method numberOfParameters equals: 0
]

{ #category : #tests }
FamixModelExtractionTest >> testReferenceModel [
	self assert: self model mooseModel isNil.
	self assert: self model localMooseModel == self model.
]

{ #category : #tests }
FamixModelExtractionTest >> testUnderstands [

	| aFamixClass |
	aFamixClass := self model entityNamed: LANFileServer mooseName.
	self assert: aFamixClass notNil.

	"method defined in the same class"
	self assert: (aFamixClass understands: #'output:(Object)').

	"method defined in the superclass"
	self assert: (aFamixClass understands: #'accept:(Object)').

	"method defined in the superclass of superclass"
	self assert: (aFamixClass understands: #'send:(Object)')
]

{ #category : #tests }
FamixModelExtractionTest >> testUuidGeneration [

	"--- void ---"
]
