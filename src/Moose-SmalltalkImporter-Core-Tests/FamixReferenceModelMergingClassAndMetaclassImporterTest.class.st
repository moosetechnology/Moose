Class {
	#name : #FamixReferenceModelMergingClassAndMetaclassImporterTest,
	#superclass : #TestCase,
	#instVars : [
		'referenceModelTheRootName',
		'testCaseName',
		'referenceModelSubRootLevelOneName',
		'testRunnerName'
	],
	#category : #'Moose-SmalltalkImporter-Core-Tests'
}

{ #category : #resources }
FamixReferenceModelMergingClassAndMetaclassImporterTest class >> resources [
	
	^Array with: FamixReferenceModelNamespaceMergingClassAndMetaclassTestResource
]

{ #category : #resources }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> model [
	
	
	^self class resources first current model
	

]

{ #category : #tests }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testAllClassInNamespaceAreCreated [
	self model allClasses do: [ :each | self deny: (each name endsWith: '_class') ]
]

{ #category : #tests }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testAttributInRoot [
	| theRoot |
	theRoot := self model entityNamed: #'Smalltalk::TheRoot'.
	self assert: (theRoot attributes inject: false into: [:bool : method | bool or: [method name = #y]]).
	self assert: (theRoot attributes inject: false into: [:bool : method | bool or: [method name = #z]]).
	self assert: (theRoot attributes inject: false into: [:bool : method | bool or: [method name = #'CIV#mz']])
]

{ #category : #tests }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testClassAttributeHasInstanceScope [
	| attribute theRoot |
	attribute := self model entityNamed: #'Smalltalk::TheRoot.x'.
	theRoot := self model entityNamed: #'Smalltalk::TheRoot'.
	self deny: attribute isClassSide.
	self assert: attribute belongsTo equals: theRoot
]

{ #category : #tests }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testClassMetaclassInstanceVariableAndShared [
	| insVar theRoot insMetaclassVar shared |
	insVar := self model entityNamed: #'Smalltalk::TheRoot.z'.
	insMetaclassVar := self model entityNamed: #'Smalltalk::TheRoot.CIV#mz'.
	shared := self model entityNamed: #'Smalltalk::TheRoot.TheRootSharedVariable'.
	theRoot := self model entityNamed: #'Smalltalk::TheRoot'.
	self deny: insVar isClassSide.
	self assert: insMetaclassVar isClassSide.
	self assert: shared isClassSide.
	self assert: insVar belongsTo equals: theRoot.
	self assert: insMetaclassVar belongsTo equals: theRoot.
	self assert: shared belongsTo equals: theRoot.
	self assert: shared isSharedVariable.
	self deny: insVar isSharedVariable.
	self deny: insMetaclassVar isSharedVariable
]

{ #category : #tests }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testConflictingInstanceVarNames [
	| insVar theRoot insMetaclassVar shared |
	insVar := self model entityNamed: #'Smalltalk::TheRoot.instanceAndClassPotentiallyConflictingName'.
	insMetaclassVar := self model entityNamed: #'Smalltalk::TheRoot.CIV#instanceAndClassPotentiallyConflictingName'.
	shared := self model entityNamed: #'Smalltalk::TheRoot.TheRootSharedVariable'.
	theRoot := self model entityNamed: #'Smalltalk::TheRoot'.
	self deny: insVar isClassSide.
	self assert: insMetaclassVar isClassSide.
	self assert: shared isClassSide.
	self assert: insVar belongsTo equals: theRoot.
	self assert: insMetaclassVar belongsTo equals: theRoot.
	self assert: shared belongsTo equals: theRoot
]

{ #category : #tests }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testInstanceAndClassSideWhenMergingClassAndMetaclass [
	| node |
	node := self model entityNamed: #'Smalltalk::TheRoot'.
	self assert: (self model entityNamed: #'Smalltalk::TheRoot_class' ifAbsent: [ nil ]) isNil.
	self assert: node instanceSide identicalTo: node.
	self assert: node classSide identicalTo: nil
]

{ #category : #tests }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testMetaclassAttributeIsClassSide [
	| attribute theRoot |
	attribute := self model entityNamed: #'Smalltalk::TheRoot.CIV#mz'.
	theRoot := self model entityNamed: #'Smalltalk::TheRoot'.
	self assert: attribute isClassSide.
	self assert: attribute belongsTo equals: theRoot
]

{ #category : #tests }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testMetaclassMethodHasClassScope [
	| theRoot instanceMethod classMethod |
	theRoot := self model entityNamed: #'Smalltalk::TheRoot'.
	instanceMethod := self model entityNamed: #'Smalltalk::TheRoot.accessingClass()'.
	classMethod := self model entityNamed: #'Smalltalk::TheRoot.classSend()'.
	self deny: instanceMethod isClassSide.
	self assert: classMethod isClassSide.
	self assert: instanceMethod belongsTo equals: theRoot.
	self assert: classMethod belongsTo equals: theRoot
]

{ #category : #tests }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testMethodInRoot [
	| theRoot |
	theRoot := self model entityNamed: #'Smalltalk::TheRoot'.
	self assert: (theRoot methods inject: false into: [:bool : method | bool or: [method name = #classSend]]).
	self assert: (theRoot methods inject: false into: [:bool : method | bool or: [method name = #singleSelfSendOnClassSide]]).
	self assert: (theRoot methods inject: false into: [:bool : method | bool or: [method name = #returningSingleSelfSend]])
]

{ #category : #tests }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testNumberOfStatementsWithNoErrors [
	| classMethod |
	classMethod := self model entityNamed: #'Smalltalk::TheRoot.classSend()'.
	self assert: classMethod numberOfStatements equals: 1
]

{ #category : #tests }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testReferencesInRoot [
	| theRoot |
	theRoot := self model entityNamed: #'Smalltalk::TheRoot'.
	self assert: (theRoot methods flatCollect: [ :each | each outgoingReferences ]) size equals: 6.
	self assert: (theRoot methods flatCollect: [ :each | each outgoingReferences select: [ :access | access target name = #Object ] ]) size equals: 2
]

{ #category : #tests }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testSharedVariableReification [
	| shared |
	shared := self model entityNamed: #'Smalltalk::TheRoot.TheRootSharedVariable'.
	self assert: shared isClassSide.
	self assert: shared isSharedVariable.
	self assert: shared isProtected.
	self assert: shared belongsTo equals: (self model entityNamed: TheRoot mooseName)
]

{ #category : #tests }
FamixReferenceModelMergingClassAndMetaclassImporterTest >> testStubNotOverride [
	| theRoot object |
	theRoot := self model entityNamed: #'Smalltalk::TheRoot'.
	object := self model entityNamed: #'Smalltalk::Object'.
	self deny: theRoot isStub.
	self assert: object isStub
]
