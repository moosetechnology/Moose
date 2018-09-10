Class {
	#name : #FamixPropertiesTest,
	#superclass : #LANAbstractImportTest,
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #testing }
FamixPropertiesTest >> lanInterfaceOriginateMethod [
	^self model entityNamed: #'Smalltalk::LANInterface.originate()'
]

{ #category : #testing }
FamixPropertiesTest >> nodeClass [
	^self model entityNamed: LANNode mooseName
]

{ #category : #testing }
FamixPropertiesTest >> testAttributeMetrics [
	| attribute1 attribute2 |
	attribute1 := self model entityNamed: #'Smalltalk::LANInterface.nextNode'.
	attribute2 := self model entityNamed: #'Smalltalk::LANOutputServer.serverType'.
	self assert: (attribute1 propertyNamed: #numberOfAccesses) equals: 3.
	self assert: attribute1 numberOfAccesses equals: 3.
	self assert: (attribute1 propertyNamed: #nameLength) equals: 8.
	self assert: attribute1 nameLength equals: 8.
	self assert: (attribute1 propertyNamed: #hierarchyNestingLevel) equals: 1.
	self assert: attribute1 hierarchyNestingLevel equals: 1.
	self assert: (attribute1 propertyNamed: #numberOfAccessingClasses) equals: 1.
	self assert: attribute1 numberOfAccessingClasses equals: 1.
	self assert: (attribute1 propertyNamed: #numberOfLocalAccesses) equals: 3.
	self assert: attribute1 numberOfLocalAccesses equals: 3.
	self assert: (attribute1 propertyNamed: #numberOfAccessingMethods) equals: 1.
	self assert: attribute1 numberOfAccessingMethods equals: 1.
	self assert: (attribute2 propertyNamed: #numberOfGlobalAccesses) equals: 1.
	self assert: attribute2 numberOfGlobalAccesses equals: 1
]

{ #category : #testing }
FamixPropertiesTest >> testAttributesOfNonStubClasses [
	"testing issue 960"
	self model allClasses do: [ :cl |
		(cl isStub not) ifTrue: [ self assert: (cl attributes noneSatisfy: [:att | att isStub])] ]
]

{ #category : #testing }
FamixPropertiesTest >> testAttributesOfStubClasses [
	"testing issue 960"
	self model allClasses do: [ :cl |
		(cl isStub) ifTrue: [ self assert: (cl attributes allSatisfy: [:att | att isStub])] ]
]

{ #category : #testing }
FamixPropertiesTest >> testClassAllProperties [
	| class |
	class := self model entityNamed: LANNode mooseName.
	self deny: (class allDeclaredProperties select: [:each | each name = #modifiers]) isEmpty.
]

{ #category : #testing }
FamixPropertiesTest >> testClassAttributes [
	self assert: self nodeClass numberOfAttributes equals: 2.
	self assert: self nodeClass numberOfAttributesInherited equals: 3.
	self assert: (self nodeClass propertyNamed: #numberOfPrivateAttributes) equals: 0.
	self assert: (self nodeClass propertyNamed: #numberOfProtectedAttributes) equals: 2.
	self assert: (self nodeClass propertyNamed: #numberOfPublicAttributes) equals: 0.
	self
		assert: (self workstationClass propertyNamed: #numberOfAttributesInherited)
		equals: (self totalNumberOfAttributesFor: LANWorkStation superclass).
	self
		assert: self workstationClass numberOfAttributesInherited
		equals: (self totalNumberOfAttributesFor: LANWorkStation superclass)
]

{ #category : #testing }
FamixPropertiesTest >> testClassCategories [
	self assert: (self nodeClass propertyNamed: #numberOfMethodProtocols) equals: 6.
	self assert: self nodeClass numberOfMethodProtocols equals: 6
]

{ #category : #testing }
FamixPropertiesTest >> testClassComments [
	self model allClasses do: [ :each | self assert: each numberOfComments >= 0 ].
	self assert: (self nodeClass propertyNamed: #numberOfComments) equals: 11.
	self assert: self nodeClass numberOfComments equals: 11
]

{ #category : #testing }
FamixPropertiesTest >> testClassHierarchy [
	self assert: (self nodeClass propertyNamed: #numberOfSubclasses) equals: 2.
	self assert: self nodeClass numberOfSubclasses equals: (self nodeClass propertyNamed: #numberOfSubclasses).
	self assert: self nodeClass totalNumberOfChildren equals: 4.
	self assert: self nodeClass hierarchyNestingLevel equals: 1
]

{ #category : #testing }
FamixPropertiesTest >> testClassInvocations [

	self assert: (self nodeClass propertyNamed: #numberOfMessageSends) equals: 27.
	self assert: self nodeClass numberOfMessageSends equals: 27
]

{ #category : #testing }
FamixPropertiesTest >> testClassLinesOfCode [
	self model allClasses do: [ :each | self assert: each numberOfLinesOfCode >= 0 ].
	self assert: (self nodeClass propertyNamed: #numberOfLinesOfCode) equals: 58.
	self assert: self nodeClass numberOfLinesOfCode equals: 58
]

{ #category : #testing }
FamixPropertiesTest >> testClassMethods [
	self assert: self nodeClass numberOfMethods equals: 12.
	self assert: (self nodeClass propertyNamed: #numberOfMethodsInherited) equals: 0.
	self assert: (self nodeClass propertyNamed: #numberOfMethodsOverriden) equals: 0.
	self
		assert: (self nodeClass propertyNamed: #numberOfMethodsAdded)
		equals: (self nodeClass propertyNamed: #numberOfMethods).
	self assert: (self nodeClass propertyNamed: #numberOfConstructorMethods) equals: 0.
	self assert: (self nodeClass propertyNamed: #numberOfPrivateMethods) equals: 0.
	self assert: (self nodeClass propertyNamed: #numberOfProtectedMethods) equals: 0.
	self
		assert: (self nodeClass propertyNamed: #numberOfPublicMethods)
		equals: (self nodeClass propertyNamed: #numberOfMethods).
	self
		assert: (self workstationClass propertyNamed: #numberOfMethodsInherited)
		equals: (self nodeClass propertyNamed: #numberOfMethods) + (self nodeClass propertyNamed: #numberOfMethodsInherited).
	self assert: (self workstationClass propertyNamed: #numberOfMethodsAdded) equals: 1.
	self assert: (self workstationClass propertyNamed: #numberOfMethodsOverriden) equals: 3.
	self
		assert:
			(self workstationClass propertyNamed: #numberOfMethodsAdded)
				+ (self workstationClass propertyNamed: #numberOfMethodsOverriden)
		equals: (self workstationClass propertyNamed: #numberOfMethods)
]

{ #category : #testing }
FamixPropertiesTest >> testClassWeightedMethodCount [
	self assert: self nodeClass weightedMethodCount equals: 13
]

{ #category : #testing }
FamixPropertiesTest >> testHasComments [
	self assert: self nodeClass hasComments not
]

{ #category : #testing }
FamixPropertiesTest >> testHasTheSamePropertiesAs [

	| cp |
	"I should have the same entity than a copy of myself"
	self assert: (self nodeClass hasTheSamePropertiesAs: self nodeClass).

	self deny: (self nodeClass hasTheSamePropertiesAs: self nodeClass veryDeepCopy).
	"here the incoming references is different because references are not pointing to the copy obviously"
	
	cp := self model entityNamed: LANOutputServer mooseName.
	self deny: (self nodeClass hasTheSamePropertiesAs: cp).
	
	cp := self nodeClass veryDeepCopy.
	cp instVarNamed: 'state' put: (cp instVarNamed: 'state') veryDeepCopy.
	cp propertyNamed: #numberOfLinesOfCode put: 12000.  
	"This property is described as a fame property on the entity kind but not existing on the copy
	so two entities should have different properties"
	self deny: (self nodeClass hasTheSamePropertiesAs: cp).
	
	cp := self nodeClass veryDeepCopy.
	cp instVarNamed: 'state' put: (cp instVarNamed: 'state') veryDeepCopy.
	cp propertyNamed: #NOS ifAbsentPut: 12000.  
	"This property is described but it does not exist on the entity kind 
	so two entities should have different properties"
	self deny: (self nodeClass hasTheSamePropertiesAs: cp).
	
]

{ #category : #testing }
FamixPropertiesTest >> testMethodAccesses [
	self assert: self lanInterfaceOriginateMethod numberOfAccesses equals: 22.
	self
		assert: self lanInterfaceOriginateMethod numberOfAccesses
		equals: (self lanInterfaceOriginateMethod propertyNamed: #numberOfAccesses).
	self assert: (self model entityNamed: #'Smalltalk::LANInterface.originator()') numberOfAccesses equals: 3
]

{ #category : #testing }
FamixPropertiesTest >> testMethodHierarchyNesting [
	self assert: (self lanInterfaceOriginateMethod propertyNamed: #hierarchyNestingLevel) equals: 1.
	self assert: self lanInterfaceOriginateMethod hierarchyNestingLevel equals: 1
]

{ #category : #testing }
FamixPropertiesTest >> testMethodInvocations [
	self assert: (self lanInterfaceOriginateMethod propertyNamed: #numberOfOutgoingInvocations) equals: 22.
	self assert: self lanInterfaceOriginateMethod numberOfOutgoingInvocations equals: 22.
	self assert: (self model entityNamed: #'Smalltalk::LANInterface.initialize()') numberOfOutgoingInvocations equals: 2
]

{ #category : #testing }
FamixPropertiesTest >> testMethodInvocationsWithoutCascading [
	self assert: (self model entityNamed: #'Smalltalk::LANInterface.remove()') numberOfOutgoingInvocations equals: 6.
	self
		assert: (self model entityNamed: #'Smalltalk::LANInterface.newWorkstation()') numberOfOutgoingInvocations
		equals: 4
]

{ #category : #testing }
FamixPropertiesTest >> testMethodLOC [
	self assert: (self lanInterfaceOriginateMethod propertyNamed: #numberOfLinesOfCode) equals: 22.
	self assert: self lanInterfaceOriginateMethod numberOfLinesOfCode equals: 22
]

{ #category : #testing }
FamixPropertiesTest >> testMethodName [
	self assert: (self lanInterfaceOriginateMethod propertyNamed: #nameLength) equals: 9
]

{ #category : #testing }
FamixPropertiesTest >> testMethodSmalltalkConditionals [
	self assert: (self lanInterfaceOriginateMethod propertyNamed: #numberOfConditionals) equals: 1.
	self assert: self lanInterfaceOriginateMethod numberOfConditionals equals: 1
]

{ #category : #testing }
FamixPropertiesTest >> testMethodSmalltalkCyclomaticComplexity [
	self assert: (self lanInterfaceOriginateMethod propertyNamed: #cyclomaticComplexity) equals: 2.
	self assert: self lanInterfaceOriginateMethod cyclomaticComplexity equals: 2
]

{ #category : #testing }
FamixPropertiesTest >> testMethodSmalltalkMessageSends [
	self assert: (self lanInterfaceOriginateMethod propertyNamed: #numberOfMessageSends) equals: 22.
	self assert: self lanInterfaceOriginateMethod numberOfMessageSends equals: 22
]

{ #category : #testing }
FamixPropertiesTest >> testMethodSmalltalkParameters [
	self assert: self lanInterfaceOriginateMethod numberOfParameters equals: 0.
	self assert: (self lanInterfaceOriginateMethod propertyNamed: #numberOfParameters) equals: 0
]

{ #category : #testing }
FamixPropertiesTest >> testMethodSmalltalkStatements [
	self assert: (self lanInterfaceOriginateMethod propertyNamed: #numberOfStatements) equals: 15.
	self assert: self lanInterfaceOriginateMethod numberOfStatements equals: 15
]

{ #category : #testing }
FamixPropertiesTest >> testMethodTimeStamp [
	| method |
	method := self model entityNamed: #'Smalltalk::LANInterface.initialize()'.
	self assert: (method propertyNamed: #timeStamp) equals: (LANInterface compiledMethodAt: #initialize) timeStamp.
	method := self model entityNamed: #'Smalltalk::LANInterface.originate()'.
	self assert: (method propertyNamed: #timeStamp) equals: (LANInterface compiledMethodAt: #originate) timeStamp.
	method := self model entityNamed: #'Smalltalk::LANInterface.nodeList()'.
	self assert: (method propertyNamed: #timeStamp) equals: (LANInterface compiledMethodAt: #nodeList) timeStamp.
	method := self model entityNamed: #'Smalltalk::LANNode.canOriginate()'.
	self assert: (method propertyNamed: #timeStamp) equals: (LANNode compiledMethodAt: #canOriginate) timeStamp.
	method := self model entityNamed: #'Smalltalk::LANNode.canOutput()'.
	self assert: (method propertyNamed: #timeStamp) equals: (LANNode compiledMethodAt: #canOutput) timeStamp.
	method := self model entityNamed: #'Smalltalk::LANNode.nextNode()'.
	self assert: (method propertyNamed: #timeStamp) equals: (LANNode compiledMethodAt: #nextNode) timeStamp.
	method := self model entityNamed: #'Smalltalk::LANFileServer.name()'.
	self assert: (method propertyNamed: #timeStamp) equals: (LANFileServer compiledMethodAt: #name) timeStamp.
	method := self model entityNamed: #'Smalltalk::LANFileServer.setServerType()'.
	self assert: (method propertyNamed: #timeStamp) equals: (LANFileServer compiledMethodAt: #setServerType) timeStamp
]

{ #category : #testing }
FamixPropertiesTest >> testMethodsSimpleProperties [
	| method |
	method := self model entityNamed: #'Smalltalk::LANInterface.initialize()'.
	self assert: method isInitializer.
	self deny: method isInternalImplementation.
	self deny: method isPureAccessor.

	method := self model entityNamed: #'Smalltalk::LANInterface.originate()'.
	self deny: method isInitializer.
	self deny: method isInternalImplementation.
	self deny: method isPureAccessor.

	method := self model entityNamed: #'Smalltalk::LANInterface.nodeList()'.
	self deny: method isInitializer.
	self assert: method isInternalImplementation.
	self deny: method isPureAccessor.
]

{ #category : #testing }
FamixPropertiesTest >> testNoDuplicatesOfClassVariables [
	self
		assert: ((self model entityNamed: #Smalltalk::Object) attributes contains: [ :each | each name = #DependentsFields ]).
	self
		assert:
			(self model entityNamed: #Smalltalk::Object) attributes first
				== (self model entityNamed: #Smalltalk::Object) attributes last.
	self assert: (self model entityNamed: #Smalltalk::Object) attributes size equals: 1
]

{ #category : #testing }
FamixPropertiesTest >> testOverridenMethods [
	self assert: (self model entityNamed: #Smalltalk::LANOutputServer) numberOfMethodsOverriden equals: 2
]

{ #category : #testing }
FamixPropertiesTest >> testPropertyNamed [
	self assert: (self nodeClass propertyNamed: #numberOfAttributes) equals: 2.
	self assert: self nodeClass numberOfAttributes equals: 2
]

{ #category : #testing }
FamixPropertiesTest >> workstationClass [
	^self model entityNamed: #'Smalltalk::LANWorkStation'
]
