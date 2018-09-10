Class {
	#name : #GHClassGhostTests,
	#superclass : #GHGhostTestCase,
	#instVars : [
		'replacedClass'
	],
	#category : 'Ghost-ClassGhost-Tests'
}

{ #category : #running }
GHClassGhostTests >> ghostClass [
	^GHClassGhostStub
]

{ #category : #installation }
GHClassGhostTests >> replaceClassWithGhost: aClass [

	| replacedGhost |
	replacedClass := ghost.
	replacedGhost := aClass.
	
	aClass become: ghost.
	ghost := replacedGhost
]

{ #category : #running }
GHClassGhostTests >> tearDown [
	replacedClass ifNotNil: [ replacedClass become: ghost].
	replacedClass := nil.
	
	super tearDown.
	
	
]

{ #category : #tests }
GHClassGhostTests >> testInterceptingMessage [

	| actual |
	actual := ghost someMessage.
	
	self assert: actual selector equals: #someMessage
]

{ #category : #tests }
GHClassGhostTests >> testInterceptionInstanceClassMessage [

	| user actual |
	user := GHClassStub named: 'test class'.
	
	self replaceClassWithGhost: GHClassStub.

	actual := user class. 

	self assert: actual == ghost

]

{ #category : #tests }
GHClassGhostTests >> testInterceptionInstanceClassMessageWhenItIsNotMeta [

	| user actual |
	ghost ghostBehaviour clearMetaMessages.
	
	user := GHClassStub named: 'test class'.	
	self replaceClassWithGhost: GHClassStub.

	actual := user class. 

	self assert: actual selector equals: #class
]

{ #category : #tests }
GHClassGhostTests >> testInterceptionInstanceMessage [

	| user actual |
	user := GHClassStub named: 'test class'.
	
	self replaceClassWithGhost: GHClassStub.

	actual := user someName.	
	self assert: actual selector equals: #someName.

]

{ #category : #tests }
GHClassGhostTests >> testInterceptionInstanceSubclassMessage [

	| user actual |
	user := GHSubclassStub named: 'test subclass'.
	
	self replaceClassWithGhost: GHClassStub.

	actual := user someName.	
	self assert: actual selector equals: #someName.

]

{ #category : #tests }
GHClassGhostTests >> testInterceptionSuperCallFromSubclass [

	| user actual |
	user := GHSubclassStub named: 'test subclass'.
	
	self replaceClassWithGhost: GHClassStub.

	actual := user someNameBySuperCall.	
	self assert: actual selector equals: #someName
]

{ #category : #tests }
GHClassGhostTests >> testMessageDefinedBySubclassShouldNotBeIntercepted [

	| user actual |
	user := GHSubclassStub named: 'test subclass'.
	
	self replaceClassWithGhost: GHClassStub.

	actual := user constantABS.	
	self assert: actual equals: 'ABS'.

]
