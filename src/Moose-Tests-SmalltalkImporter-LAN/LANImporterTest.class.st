Class {
	#name : #LANImporterTest,
	#superclass : #LANAbstractImportTest,
	#category : #'Moose-Tests-SmalltalkImporter-LAN'
}

{ #category : #tests }
LANImporterTest >> couldOnlyBeUsedForVisualWorksExtractedModeltestNamespaceInNamespace [
	 
	| namespace | 
	namespace := self model allNamespaces entityNamed: #Smalltalk. 
	self assert: namespace namespaces notEmpty. 
	namespace := self model allNamespaces entityNamed: #'LAN'. 
	self assert: namespace namespaces isEmpty
]

{ #category : #tests }
LANImporterTest >> couldWorkbutOnlywhenCreatingAModelFromVWtestNamespaceOptimization [
	| namespaces namespacesNames theLANNamespace classNamesFromLAN |
	namespaces := self model allNamespaces.
	namespacesNames := namespaces collect: [ :each | each name ].
	self assert: namespaces size equals: 5.
	self assert: (namespacesNames includes: #LAN).
	theLANNamespace := namespaces detect: [ :each | each name = #LAN ] ifNone: [ nil ].
	self deny: theLANNamespace isNil.
	classNamesFromLAN := theLANNamespace classes collect: [ :each | each name ].
	self assert: theLANNamespace numberOfClasses equals: 18.
	self assert: (classNamesFromLAN includes: #LANFileServer).
	self assert: theLANNamespace isStub not.
	theLANNamespace := namespaces detect: [ :each | each name = #Root ] ifNone: [ nil ].
	self assert: theLANNamespace isStub not
]

{ #category : #tests }
LANImporterTest >> testAccessReification [ 
	 
	self model allAccesses 
		do: 
			[:each |  
			self assert: (each accessor usesTrait: FamixTMethod). 
			self assert: (each variable usesTrait: FamixTAccessible) ]
]

{ #category : #tests }
LANImporterTest >> testAccessToPoolVariable [
	"self debug: #testAccessToPoolVariable"

	| lanEditorAccess group |
	group := self model allAccesses select: [ :each | each variable name = 'LANEditor' ].
	self assert: group size equals: 1.
	lanEditorAccess := group first.
	self assert: lanEditorAccess accessor name equals: #accessPoolVariable.
	self assert: lanEditorAccess accessor mooseName equals: #'Smalltalk::LANNode.accessPoolVariable()'
]

{ #category : #tests }
LANImporterTest >> testAllEntitiesHaveABackReferenceToTheModel [
	self model do: [ :each | self assert: each mooseModel equals: self model ]
]

{ #category : #tests }
LANImporterTest >> testAllImplicitVariablesAreStoredInTheModel [
	self 
		assert: (self model allMethods flatCollect: #implicitVariables) size 
		equals: self model allImplicitVariables size
]

{ #category : #tests }
LANImporterTest >> testClassModifiers [	
	self model allClasses 
		do: [:each | self assert: (each modifiers isKindOf: Set)].
]

{ #category : #tests }
LANImporterTest >> testClassName [ 
	 "self debug: #testClassName"
	
	self model allClasses 
		do: [:each | self assert: (each name includes: Character space) not].
]

{ #category : #tests }
LANImporterTest >> testClassNameAndUniqueName [
	"self debug: #testClassNameAndUniqueName"

	| mseClass |
	mseClass := self model entityNamed: LANNode mooseName.
	self assert: mseClass name equals: #LANNode.
	self
		assert: mseClass mooseName
		equals:
			(FamixSmalltalkNameResolver
				uniqueNameForClassNamed: LANNode name
				scope: (FamixSmalltalkNameResolver moosify: LANNode environment absoluteName)).
	self assert: mseClass mooseName equals: LANNode mooseName
]

{ #category : #tests }
LANImporterTest >> testClassNameDoesNotIncludeSpace [
	 "self debug: #testClassNameDoesNotIncludeSpace"
	
	self deny: self model allClasses isEmpty.
	self model allClasses 
		do: [:each | self assert: (each name includes: Character space) not]
]

{ #category : #tests }
LANImporterTest >> testClassSides [ 
	 
	| node nodeClass | 
	node := self model entityNamed: LANNode mooseName. 
	nodeClass := self model entityNamed: LANNode class mooseName. 
	self assert: node instanceSide == node. 
	self assert: node classSide == nodeClass. 
	self assert: nodeClass classSide == nodeClass. 
	self assert: nodeClass instanceSide == node
]

{ #category : #tests }
LANImporterTest >> testCommonSuperClasses [
	"self debug: #testCommonSuperClasses"

	self
		assert:
			(self model allPackages entityNamed: #'Moose-TestResources-LAN') localClassesGroup commonExternalSuperclasses size
		equals: 12
]

{ #category : #tests }
LANImporterTest >> testCorrectInvocations [ 
	 
	self model allInvocations 
		do: 
			[:each |  
			self assert: each sender isMethod. 
			each candidates 
				do: 
					[:eachCandidate | eachCandidate isNil ifFalse: [self assert: eachCandidate isMethod]]]
]

{ #category : #tests }
LANImporterTest >> testCorrectnessOfImport [
	"self debug: #testCorrectnessOfImport"

	| node outputServer nodeName workstationName fileServerName printServerName uiModelName nodeSubclasses outputServerName outputServerSubclasses |
	nodeName := LANNode mooseName.
	workstationName := LANWorkStation mooseName.
	fileServerName := LANFileServer mooseName.
	printServerName := LANPrintServer mooseName.
	uiModelName := Model mooseName.
	outputServerName := LANOutputServer mooseName.
	node := self model entityNamed: nodeName.
	outputServer := self model entityNamed: outputServerName.	"UI.Model superclass LAN.Node and has two subclasses"
	self assert: node superInheritances size equals: 1.
	self assert: ((node superInheritances collect: [ :each | each subclass mooseName ]) includes: nodeName).
	self assert: ((node superInheritances collect: [ :each | each superclass mooseName ]) includes: uiModelName).
	self assert: node subInheritances size equals: 2.
	nodeSubclasses := node subInheritances collect: [ :each | each subclass mooseName ].
	self assert: (nodeSubclasses includes: workstationName).
	self assert: (nodeSubclasses includes: outputServerName).
	self assert: outputServer superInheritances size equals: 1.
	self assert: ((outputServer superInheritances collect: [ :each | each subclass mooseName ]) includes: outputServerName).
	self assert: ((outputServer superInheritances collect: [ :each | each superclass mooseName ]) includes: nodeName).
	self assert: outputServer subInheritances size equals: 2.
	outputServerSubclasses := outputServer subInheritances collect: [ :each | each subclass mooseName ].
	self assert: (outputServerSubclasses includes: fileServerName).
	self assert: (outputServerSubclasses includes: printServerName)
]

{ #category : #tests }
LANImporterTest >> testEntityUniquelyNamed [
	
	| classes |
	classes := self model allClasses.
	self
		assert: (classes entityNamed: LANNode mooseName) isNil not.
	self
		assert:
			(classes entityNamed: LANNode class mooseName) isNil not
]

{ #category : #errors }
LANImporterTest >> testHierarchyRoot [ 
	self assert: (self model entityNamed: LANNode mooseName) isHierarchyRoot. 
	self deny: ((self model entityNamed: LANNode mooseName) 
				isHierarchyRootWithin: self model allClasses)
]

{ #category : #tests }
LANImporterTest >> testImportCategory [
	self assert: (self model entityNamed: #'Smalltalk::LANInterface.cancel()') category equals: #actions.
	self assert: (self model entityNamed: #'Smalltalk::LANInterface.addressee()') category equals: #aspects
]

{ #category : #tests }
LANImporterTest >> testImportClassComments [ 
	"self debug: #testImportClassComments"
	
	self deny: (self model allComments select: [:each | each belongsTo isClass]) isEmpty. 
	self deny: (self model allClasses select: [:each | each comments isEmpty not]) isEmpty. 
	self deny: (self model entityNamed: #'Smalltalk::LANInterface') comments isEmpty.
]

{ #category : #tests }
LANImporterTest >> testImportMethodComments [
	self model allComments
		do: [ :eachComment | self assert: (self model entityNamed: eachComment belongsTo mooseName) isNil not ].
	self assert: (self model entityNamed: #'Smalltalk::LANInterface.accept()') comments size equals: 1.
	self assert: (self model entityNamed: #'Smalltalk::LANInterface.originate()') comments size equals: 6
]

{ #category : #tests }
LANImporterTest >> testIncomingInvocationReification [ 
	 
	self model allInvocations 
		do: 
			[:each |  
			each candidates 
				do: 
					[:eachCandidate | self assert: (eachCandidate incomingInvocations includes: each)]]
]

{ #category : #tests }
LANImporterTest >> testInheritanceReification [ 
	
	|inheritances|
	inheritances := self model allInheritanceDefinitions.
	self assert: inheritances isEmpty not.
	inheritances do: 
			[:each |  
			self assert: (each superclass usesTrait: FamixTClass). 
			self assert: (each subclass usesTrait: FamixTClass)]
]

{ #category : #tests }
LANImporterTest >> testInheritsFrom [ 
	 
	self 
		assert: 
			((self model entityNamed: #'Smalltalk::LANPrintServer') 
				inheritsFrom: (self model entityNamed: LANNode mooseName)). 
	self 
		assert: 
			((self model entityNamed: #'Smalltalk::LANPrintServer') 
				inheritsFrom: 
					(self model entityNamed: #'Smalltalk::LANOutputServer')). 
	self 
		assert: 
			((self model entityNamed: #'Smalltalk::LANPrintServer') 
				inheritsFrom: (self model entityNamed: #'Smalltalk::Model'))
]

{ #category : #tests }
LANImporterTest >> testInvocationReification [
	self model allInvocations
		do: [ :each | 
			self assert: (each sender usesTrait: FamixTMethod).
			each candidates
				do: [ :eachCandidate | 
					self assert: (eachCandidate usesTrait: FamixTMethod).
					self assert: eachCandidate signature equals: each signature ] ]
]

{ #category : #tests }
LANImporterTest >> testIsAbstract [ 
	 
	self 
		assert: 
			(self model entityNamed: #'Smalltalk::LANOutputServer') isAbstract. 
	self 
		assert: 
			(self model entityNamed: 
					#'Smalltalk::LANOutputServer.output:(Object)') isAbstract
]

{ #category : #tests }
LANImporterTest >> testIsClassAbstract [ 
	 "self debug: #testIsClassAbstract"
	
	| famixMethod |
	famixMethod := self model entityNamed: #'Smalltalk::LANOutputServer.output:(Object)'.
	self assert: (famixMethod isAbstract).

	self 
		assert: 
			(self model entityNamed: #'Smalltalk::LANOutputServer') isAbstract. 
	
]

{ #category : #errors }
LANImporterTest >> testLonely [
	| lonely |
	lonely := self model allModelClasses select: [ :each | each isLonelyWithin: self model allModelClasses ].
	self assert: lonely size equals: 8
]

{ #category : #errors }
LANImporterTest >> testMethodOverriding [ 
	 
	self assert: (self model entityNamed: (LANOutputServer>>#canOutput) mooseName) isOverriding. 
	self assert: (self model entityNamed: (LANNode>>#canOutput) mooseName) isOverriden
]

{ #category : #tests }
LANImporterTest >> testMinimalStateofEntity [
	"self debug: #testMinimalStateofEntity"

	| node |
	node := self model entityNamed: LANNode mooseName.
	self assert: (node subInheritances at: 1) mooseModel equals: self model.
	self assert: (node superInheritances at: 1) mooseModel equals: self model
]

{ #category : #tests }
LANImporterTest >> testMooseName [
	"self debug: #testMooseName"

	self assert: LANNode mooseName equals: #Smalltalk::LANNode.
	self assert: 'Smalltalk::LANNode' mooseName equals: #Smalltalk::LANNode.
	self assert: LANNode class mooseName equals: #Smalltalk::LANNode_class	"we could also  test here that all the famix entities  understand mooseName but for that we should create model so
	this is done in LANTest "
]

{ #category : #tests }
LANImporterTest >> testNameAndUniqueName [
	| mseClass mseMethod mseAttribute mseGlobalVar mseImplicitVar mseLocalVariable mseFormalParameter transcriptName |
	mseClass := self model entityNamed: LANNode mooseName.
	self assert: mseClass name == #LANNode.
	self
		assert:
			mseClass mooseName
				==
					(FamixSmalltalkNameResolver
						uniqueNameForClassNamed: LANNode name
						scope: (FamixSmalltalkNameResolver moosify: LANNode environment absoluteName)).
	self assert: mseClass mooseName == LANNode mooseName.
	mseMethod := self model entityNamed: #'Smalltalk::LANPacket.printOn:(Object)'.
	self assert: mseMethod name == #printOn:.
	self assert: mseMethod mooseName == #'Smalltalk::LANPacket.printOn:(Object)'.
	self assert: mseMethod signature == #'printOn:(Object)'.
	mseAttribute := self model entityNamed: (LANNode mooseNameOf: 'name') asSymbol.
	self assert: mseAttribute mooseName == (LANNode mooseNameOf: 'name').
	self assert: mseAttribute name == #name.
	transcriptName := #Transcript.
	mseGlobalVar := self model entityNamed: transcriptName.
	self assert: mseGlobalVar name == transcriptName.
	self assert: mseGlobalVar mooseName == transcriptName.	"self assert: (mseGlobalVar interfaceSignatures includes: #cr)."
	mseImplicitVar := self model entityNamed: LANNode mooseName , '.accept:(Object).self'.
	self assert: mseImplicitVar name == #self.
	self assert: mseImplicitVar mooseName equals: LANNode mooseName , '.accept:(Object).self'.	"self assert: (mseImplicitVar interfaceSignatures includes: #send:)."
	mseImplicitVar := self model entityNamed: LANNode mooseName , '.printOn:(Object).super'.
	self assert: mseImplicitVar name == #super.
	self assert: mseImplicitVar mooseName == (LANNode mooseName , '.printOn:(Object).super') asSymbol.
	mseLocalVariable := self model entityNamed: #'Smalltalk::LANInterface.originate().packet'.
	self assert: mseLocalVariable name == #packet.
	self assert: mseLocalVariable mooseName == #'Smalltalk::LANInterface.originate().packet'.
	mseFormalParameter := self model entityNamed: (LANNode mooseNameOf: 'nextNode:(Object).aNode').
	self assert: mseFormalParameter name == #aNode.
	self assert: mseFormalParameter mooseName == (LANNode mooseNameOf: 'nextNode:(Object).aNode')	"self assert: mseFormalParameter position = 1"
]

{ #category : #tests }
LANImporterTest >> testNamespace [
	"self debug: #testNamespace"

	| namespace |
	namespace := self model entityNamed: #Smalltalk.
	self assert: (namespace usesTrait: FamixTNamespace)
]

{ #category : #tests }
LANImporterTest >> testNamespaceReification [ 
	 
	self model allClasses 
		do: [:each | self assert: (each belongsTo usesTrait: FamixTNamespace)]
]

{ #category : #tests }
LANImporterTest >> testNodeIsInModelWithGoodName [
	 "self debug: #testNodeIsInModelWithGoodName"
	
	| node | 
	node := self model  entityNamed: LANNode mooseName. 
	self deny: node isNil
]

{ #category : #tests }
LANImporterTest >> testOutgoingInvocationReification [ 
	 
	self model allInvocations 
		do: 
			[:each | self assert: (each sender outgoingInvocations includes: each)]
]

{ #category : #tests }
LANImporterTest >> testPackageReification [
	"
	self new testPackageReification
	"

	self model allClasses do: [ :each | self assert: (each parentPackage usesTrait: FamixTPackage) ].
	self model allPackages
		do: [ :each | each localClasses do: [ :eachClass | self assert: eachClass parentPackage equals: each ] ].
	self assert: (self model allPackages entityNamed: #'Moose-TestResources-LAN') localClasses size equals: 22
]

{ #category : #tests }
LANImporterTest >> testPoolVariablesAreReified [
	"self debug: #testPoolVariablesAreReified"

	| poolVar |
	poolVar := self model entityNamed: #'Smalltalk::LANPool.LANEditor'.
	self assert: poolVar parentType name equals: #LANPool
]

{ #category : #tests }
LANImporterTest >> testReferenceModelInEntities [ 
	"self debug: #testReferenceModelInEntities"
	
	self model entities 
		do: [:each | self assert: each mooseModel == self model]
]

{ #category : #tests }
LANImporterTest >> testStubClassesCreation [
	self deny: (self model entityNamed: LANNode mooseName) isStub.
	self assert: (self model entityNamed: #Smalltalk::Object) isStub.
	self deny: (self model entityNamed: #Smalltalk::LANFileServer_class) isStub.
	self assert: (self model allClasses select: [ :each | each isStub not ]) size equals: 22
]

{ #category : #errors }
LANImporterTest >> testSubClassHierarchy [
	self assert: (self model entityNamed: LANNode mooseName) subclassHierarchy size equals: 4.
	self assert: (self model entityNamed: LANNode mooseName) withSubclassHierarchy size equals: 5
]

{ #category : #tests }
LANImporterTest >> testSuperClassHierarchy [
	"self debug: #testSuperClassHierarchy"

	self assert: (self model entityNamed: #Smalltalk::LANPrintServer) superclassHierarchy size equals: 5
]
