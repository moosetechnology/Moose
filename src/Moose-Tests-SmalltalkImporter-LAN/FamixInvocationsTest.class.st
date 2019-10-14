Class {
	#name : #FamixInvocationsTest,
	#superclass : #LANAbstractImportTest,
	#category : #'Moose-Tests-SmalltalkImporter-LAN'
}

{ #category : #model }
FamixInvocationsTest >> invocationFrom: unqiueName to: signature [ 
	| invocations |
	invocations := (self model allMethods entityNamed: unqiueName asSymbol) outgoingInvocations.
	^invocations detect: [:inv | inv signature = signature asSymbol]
]

{ #category : #model }
FamixInvocationsTest >> invocationFromOutputServerAcceptMethodTo: signature [

	| invocations |
	invocations := self outputServerAcceptMethod outgoingInvocations.
	^invocations detect: [:inv | inv signature = signature asSymbol].
]

{ #category : #model }
FamixInvocationsTest >> outputServerAcceptMethod [
	^self model allMethods 
		entityNamed: #'Smalltalk::LANOutputServer.accept:(Object)'
]

{ #category : #tests }
FamixInvocationsTest >> testCandidateAbstractMethodWithTwoSubclasses [
	| invocation |
	invocation := self invocationFrom: #'Smalltalk::LANOutputServer.accept:(Object)' to: #'output:(Object)'.
	self assert: invocation notNil.
	self assert: invocation candidates size equals: 2.
	self assert: (invocation candidates includes: (self model entityNamed: #'Smalltalk::LANFileServer.output:(Object)')).
	self assert: (invocation candidates includes: (self model entityNamed: #'Smalltalk::LANPrintServer.output:(Object)'))
]

{ #category : #tests }
FamixInvocationsTest >> testCandidateInvocationsAbstractMethodWithTwoSubclasses [
	| invocation |
	invocation := self invocationFrom: #'Smalltalk::LANOutputServer.accept:(Object)' to: #'output:(Object)'.
	self assert: invocation notNil.
	self assert: invocation candidates size equals: 2.
	self assert: (invocation candidates includes: (self model entityNamed: #'Smalltalk::LANFileServer.output:(Object)')).
	self assert: (invocation candidates includes: (self model entityNamed: #'Smalltalk::LANPrintServer.output:(Object)'))	"	self assert: (invocation candidates includes: (self model entityNamed: #'Root::Smalltalk::LAN::OutputServer.output:(Object)'))."
]

{ #category : #tests }
FamixInvocationsTest >> testCandidateInvocationsClassMethodsDefinedInSuperclass [
	| invocation method |
	invocation := self invocationFrom: #'Smalltalk::LANInterface.newWorkstation()' to: #'new()'.
	self assert: invocation isNil not.
	self assert: invocation receiver equals: (self model entityNamed: #Smalltalk::LANWorkStation_class).
	self assert: invocation candidates size equals: 1.
	method := self model entityNamed: #'Smalltalk::LANNode_class.new()'.
	self assert: (invocation candidates includes: method)
]

{ #category : #tests }
FamixInvocationsTest >> testCandidateInvocationsOnlyDefinedInSuperclass [
	| invocation |
	invocation := self invocationFrom: #'Smalltalk::LANOutputServer.accept:(Object)' to: #'send:(Object)'.
	self assert: invocation notNil.
	self assert: invocation candidates size equals: 1.
	self assert: (invocation candidates includes: (self model entityNamed: #'Smalltalk::LANNode.send:(Object)'))
]

{ #category : #tests }
FamixInvocationsTest >> testCandidateInvocationsThree [
	| invocation |
	invocation := self invocationFrom: #'Smalltalk::LANSingleDestinationAddress.equalsSingle:(Object)' to: #'id()'.
	self assert: invocation notNil.
	self assert: invocation candidates size equals: 1.
	self assert: (invocation candidates includes: (self model entityNamed: #'Smalltalk::LANSingleDestinationAddress.id()'))
]

{ #category : #tests }
FamixInvocationsTest >> testCandidateInvocationsTwo [
	| invocation |
	invocation := self invocationFrom: #'Smalltalk::LANInterface.originate()' to: #'originate:(Object)'.
	self assert: invocation notNil.
	self assert: invocation candidates size equals: 1.
	self
		assert: (invocation candidates includes: (self model entityNamed: #'Smalltalk::LANWorkStation.originate:(Object)'))
]

{ #category : #tests }
FamixInvocationsTest >> testCandidateInvocationsUnknownReceiver [
	| invocation |
	invocation := self invocationFrom: #'Smalltalk::LANNode.send:(Object)' to: #'accept:(Object)'.
	self assert: invocation notNil.
	self assert: invocation candidates size equals: 3.
	self assert: (invocation candidates includes: (self model entityNamed: #'Smalltalk::LANNode.accept:(Object)')).
	self assert: (invocation candidates includes: (self model entityNamed: #'Smalltalk::LANWorkStation.accept:(Object)')).
	self assert: (invocation candidates includes: (self model entityNamed: #'Smalltalk::LANOutputServer.accept:(Object)'))
]

{ #category : #tests }
FamixInvocationsTest >> testReceivingFormalParameter [
	"self debug: #testReceivingFormalParameter"

	| invocation |
	invocation := self invocationFromOutputServerAcceptMethodTo: #'addressee()'.
	self assert: invocation notNil.
	self assert: invocation receiver name equals: #thePacket
]

{ #category : #tests }
FamixInvocationsTest >> testReceivingKnownClass [
	| invocation |
	invocation := self invocationFrom: #'Smalltalk::LANInterface.newNode()' to: #'new()'.
	self assert: invocation notNil.
	self assert: invocation receiver mooseName equals: LANNode class mooseName
]

{ #category : #tests }
FamixInvocationsTest >> testReceivingKnownClass2 [
	| invocation |
	invocation := self invocationFrom: #'Smalltalk::LANInterface.newWorkstation()' to: #'new()'.
	self assert: invocation notNil.
	self assert: invocation receiver mooseName equals: #Smalltalk::LANWorkStation_class
]

{ #category : #tests }
FamixInvocationsTest >> testReceivingKnownClass3 [
	| invocation |
	invocation := self invocationFrom: #'Smalltalk::LANInterface.newFileServer()' to: #'new()'.
	self assert: invocation notNil.
	self assert: invocation receiver mooseName equals: #Smalltalk::LANFileServer_class
]

{ #category : #tests }
FamixInvocationsTest >> testReceivingSelf [
	| invocation |
	invocation := self invocationFromOutputServerAcceptMethodTo: #'output:(Object)'.
	self assert: invocation notNil.
	self assert: invocation receiver mooseName equals: #'Smalltalk::LANOutputServer.accept:(Object).self'
]

{ #category : #tests }
FamixInvocationsTest >> testReceivingSelf2 [
	| invocation |
	invocation := self invocationFromOutputServerAcceptMethodTo: #'name()'.
	self assert: invocation notNil.
	self assert: invocation receiver mooseName equals: #'Smalltalk::LANOutputServer.accept:(Object).self'
]

{ #category : #tests }
FamixInvocationsTest >> testReceivingSelf3 [
	| invocation |
	invocation := self invocationFromOutputServerAcceptMethodTo: #'send:(Object)'.
	self assert: invocation notNil.
	self assert: invocation receiver mooseName equals: #'Smalltalk::LANOutputServer.accept:(Object).self'
]

{ #category : #tests }
FamixInvocationsTest >> testReceivingSelf9 [
	| invocation |
	invocation := self invocationFrom: #'Smalltalk::LANOutputServer.output:(Object)' to: #'subclassResponsibility()'.
	self assert: invocation notNil.
	self assert: invocation receiver mooseName equals: #'Smalltalk::LANOutputServer.output:(Object).self'
]

{ #category : #tests }
FamixInvocationsTest >> testReceivingSuper [
	| invocation |
	invocation := self invocationFrom: #'Smalltalk::LANInterface.initialize()' to: #'initialize()'.
	self assert: invocation notNil.
	self assert: invocation receiver mooseName equals: #'Smalltalk::LANInterface.initialize().super'
]

{ #category : #tests }
FamixInvocationsTest >> testReceivingSuper2 [
	| invocation |
	invocation := self invocationFrom: (LANNode >> #printOn:) mooseName to: #'printOn:(Object)'.
	self assert: invocation notNil.
	self assert: invocation receiver mooseName equals: (LANNode mooseName , '.printOn:(Object).super') asSymbol
]

{ #category : #tests }
FamixInvocationsTest >> testReceivingSuper3 [
	| invocation |
	invocation := self invocationFrom: (LANNode class >> #new) mooseName to: #'new()'.
	self assert: invocation notNil.
	self assert: invocation receiver mooseName equals: (LANNode class mooseName , '.new().super') asSymbol
]

{ #category : #tests }
FamixInvocationsTest >> testReceivingSuper4 [
	| invocation |
	invocation := self invocationFrom: #'Smalltalk::LANWorkStation.name()' to: #'name()'.
	self assert: invocation notNil.
	self assert: invocation receiver mooseName equals: #'Smalltalk::LANWorkStation.name().super'
]

{ #category : #tests }
FamixInvocationsTest >> testReceivingSuper5 [
	| invocation |
	invocation := self invocationFrom: #'Smalltalk::LANFileServer.name()' to: #'name()'.
	self assert: invocation notNil.
	self assert: invocation receiver mooseName equals: #'Smalltalk::LANFileServer.name().super'
]

{ #category : #tests }
FamixInvocationsTest >> testReceivingSuper6 [
	| invocation |
	invocation := self invocationFrom: #'Smalltalk::LANPacket.printOn:(Object)' to: #'printOn:(Object)'.
	self assert: invocation notNil.
	self assert: invocation receiver mooseName equals: #'Smalltalk::LANPacket.printOn:(Object).super'
]

{ #category : #tests }
FamixInvocationsTest >> testReceivingUnknownType [
	"self debug: #testReceivingUnknownType"
	
	| invocation |
	invocation := self invocationFromOutputServerAcceptMethodTo: #'isDestinationFor:(Object)'.

	self assert: invocation notNil.
	self assert: invocation receiver isNil
]
