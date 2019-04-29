Class {
	#name : #FamixReferenceModelMergingClassAndMetaclassImporterTest,
	#superclass : #TestCase,
	#instVars : [
		'referenceModelTheRootName',
		'testCaseName',
		'referenceModelSubRootLevelOneName',
		'testRunnerName'
	],
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #resources }
FamixReferenceModelMergingClassAndMetaclassImporterTest class >> resources [
	
	^Array with: FamixReferenceModelNamespaceMergingClassAndMetaclassTestResource
]

{ #category : #resources }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> model [
	
	
	^self class resources first current model
	

]

{ #category : #passed }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testAllClassInNamespaceAreCreated [
	"self debug: #testAllClassInNamespaceAreCreated"
	
	self model  allClasses do: [:each | 	
		self deny: (each name endsWith: '_class')
	]
]

{ #category : #passed }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testAttributInRoot [
	"self debug: #testAttributInRoot"
	| theRoot |
	theRoot := self model entityNamed: #'Smalltalk::TheRoot'.
	self assert: (theRoot attributes inject: false into: [:bool : method | bool or: [method name = #y]]).
	self assert: (theRoot attributes inject: false into: [:bool : method | bool or: [method name = #z]]).
	self assert: (theRoot attributes inject: false into: [:bool : method | bool or: [method name = #'CIV#mz']])
]

{ #category : #passed }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testClassAttributeHasInstanceScope [
	"self debug:#testClassAttributeHasInstanceScope"

	| attribute theRoot |
	attribute := self model entityNamed: #'Smalltalk::TheRoot.x'.
	theRoot := self model entityNamed: #Smalltalk::TheRoot.
	self assert: attribute hasClassScope not.
	self assert: attribute belongsTo equals: theRoot
]

{ #category : #'new to put in VW' }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testClassMetaclassInstanceVariableAndShared [
	"self debug: #testClassMetaclassInstanceVariableAndShared"

	| insVar theRoot insMetaclassVar shared |
	insVar := self model entityNamed: #'Smalltalk::TheRoot.z'.
	insMetaclassVar := self model entityNamed: #'Smalltalk::TheRoot.CIV#mz'.
	shared := self model entityNamed: #'Smalltalk::TheRoot.TheRootSharedVariable'.
	theRoot := self model entityNamed: #Smalltalk::TheRoot.
	self deny: insVar hasClassScope.
	self assert: insMetaclassVar hasClassScope.
	self assert: shared hasClassScope.
	self assert: insVar belongsTo equals: theRoot.
	self assert: insMetaclassVar belongsTo equals: theRoot.
	self assert: shared belongsTo equals: theRoot.
	self assert: shared isSharedVariable.
	self deny: insVar isSharedVariable.
	self deny: insMetaclassVar isSharedVariable
]

{ #category : #'new to put in VW' }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testConflictingInstanceVarNames [
	"self debug: #testConflictingInstanceVarNames"

	| insVar theRoot insMetaclassVar shared |
	insVar := self model entityNamed: #'Smalltalk::TheRoot.instanceAndClassPotentiallyConflictingName'.
	insMetaclassVar := self model entityNamed: #'Smalltalk::TheRoot.CIV#instanceAndClassPotentiallyConflictingName'.
	shared := self model entityNamed: #'Smalltalk::TheRoot.TheRootSharedVariable'.
	theRoot := self model entityNamed: #Smalltalk::TheRoot.
	self deny: insVar hasClassScope.
	self assert: insMetaclassVar hasClassScope.
	self assert: shared hasClassScope.
	self assert: insVar belongsTo equals: theRoot.
	self assert: insMetaclassVar belongsTo equals: theRoot.
	self assert: shared belongsTo equals: theRoot
]

{ #category : #tests }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testInstanceAndClassSideWhenMergingClassAndMetaclass [	
	"self debug: #testInstanceAndClassSideWhenMergingClassAndMetaclass"
	| node |
	node := self model entityNamed: #'Smalltalk::TheRoot'.
	self assert: (self model entityNamed: #'Smalltalk::TheRoot_class' ifAbsent: [nil]) isNil.
	self  assert: node instanceSide == node.
	self  assert: node classSide == nil.
]

{ #category : #'new to put in VW' }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testMetaclassAttributeHasClassScope [
	"self debug: #testMetaclassAttributeHasClassScope"

	| attribute theRoot |
	attribute := self model entityNamed: #'Smalltalk::TheRoot.CIV#mz'.
	theRoot := self model entityNamed: #Smalltalk::TheRoot.
	self assert: attribute hasClassScope.
	self assert: attribute belongsTo equals: theRoot
]

{ #category : #passed }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testMetaclassMethodHasClassScope [
	"self debug: #testMetaclassMethodHasClassScope"

	| theRoot instanceMethod classMethod |
	theRoot := self model entityNamed: #Smalltalk::TheRoot.
	instanceMethod := self model entityNamed: #'Smalltalk::TheRoot.accessingClass()'.
	classMethod := self model entityNamed: #'Smalltalk::TheRoot.classSend()'.
	self assert: instanceMethod isClassSide not.
	self assert: classMethod isClassSide.
	self assert: instanceMethod belongsTo equals: theRoot.
	self assert: classMethod belongsTo equals: theRoot
]

{ #category : #passed }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testMethodInRoot [
	"self debug: #testMethodInRoot"
	
	| theRoot |
	theRoot := self model entityNamed: #'Smalltalk::TheRoot'.
	self assert: (theRoot methods inject: false into: [:bool : method | bool or: [method name = #classSend]]).
	self assert: (theRoot methods inject: false into: [:bool : method | bool or: [method name = #singleSelfSendOnClassSide]]).
	self assert: (theRoot methods inject: false into: [:bool : method | bool or: [method name = #returningSingleSelfSend]])
]

{ #category : #tests }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testNumberOfStatementsWithNoErrors [
	"self debug: #testNumberOfStatementsWithNoErrors"

	| classMethod |
	classMethod := self model entityNamed: #'Smalltalk::TheRoot.classSend()'.
	self assert: classMethod numberOfStatements equals: 1
]

{ #category : #tests }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testReferencesInRoot [
	"self debug:#testReferencesInRoot "

	| theRoot |
	theRoot := self model entityNamed: #Smalltalk::TheRoot.
	self assert: (theRoot methods flatCollect: [ :each | each outgoingReferences ]) size equals: 6.
	self
		assert:
			(theRoot methods flatCollect: [ :each | each outgoingReferences select: [ :access | access to name = #Object ] ]) size
		equals: 2
]

{ #category : #'new to put in VW' }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testSharedVariableReification [
	"self debug: #testSharedVariableReification"

	| shared |
	shared := self model entityNamed: #'Smalltalk::TheRoot.TheRootSharedVariable'.
	self assert: shared hasClassScope.
	self assert: shared isSharedVariable.
	self assert: shared isProtected.
	self assert: shared belongsTo equals: (self model entityNamed: TheRoot mooseName)
]

{ #category : #tests }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testStubNotOverride [
	"self debug:#testStubNotOverride"
	| theRoot object |
	theRoot := self model entityNamed: #'Smalltalk::TheRoot'.
	object := self model entityNamed: #'Smalltalk::Object'.
	self assert: theRoot isStub not.
	self assert: object isStub
]
