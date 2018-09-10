Class {
	#name : #TheRoot,
	#superclass : #Model,
	#instVars : [
		'x',
		'y',
		'z',
		'instanceAndClassPotentiallyConflictingName'
	],
	#classVars : [
		'TheRootSharedVariable'
	],
	#classInstVars : [
		'mx',
		'my',
		'mz',
		'instanceAndClassPotentiallyConflictingName'
	],
	#category : #'Moose-TestResources-Reference-Core'
}

{ #category : #accessing }
TheRoot class >> accessInstanceAndClassPotentiallyConflictingName [

	instanceAndClassPotentiallyConflictingName := 2
]

{ #category : #accessing }
TheRoot class >> accessInstanceVariable [

	mx := 2
]

{ #category : #'accessing class variables' }
TheRoot class >> accessSharedVariableFromTheClassSide [

	TheRootSharedVariable := 4
]

{ #category : #'accessing class variables' }
TheRoot class >> classSend [
	
	Object new
]

{ #category : #'accessing class variables' }
TheRoot class >> singleSelfSendOnClassSide [

	self accessSharedVariableFromTheClassSide
]

{ #category : #'accessing shared variables' }
TheRoot >> accessSharedVariableFromTheInstanceSide [

	TheRootSharedVariable := 3
]

{ #category : #'accessing variable' }
TheRoot >> accessingArgument: anArgument [

	self printOn: anArgument
]

{ #category : #'accessing variable' }
TheRoot >> accessingClass [

	Object new
]

{ #category : #'accessing variable' }
TheRoot >> accessingFullClassName [
	"this is a full class name since in Squeak this does not exist but we keep the method 
	because some tests need it."
	
	TestCase
]

{ #category : #'accessing shared variables' }
TheRoot >> accessingGlobalVariableFromInstanceSide [

	Transcript show: 'zzz'
]

{ #category : #'accessing variable' }
TheRoot >> accessingGlobalVariableHavingNamespaceName [

	Smalltalk
]

{ #category : #'accessing variable' }
TheRoot >> accessingNamespace [

	Smalltalk
]

{ #category : #'accessing shared variables' }
TheRoot >> accessingStubSharedVariableLongName [
	"in Squeak flat world so no difference with shortname"
	^ DependentsFields
]

{ #category : #'accessing shared variables' }
TheRoot >> accessingStubSharedVariableShortName [

	^ DependentsFields
]

{ #category : #accessing }
TheRoot >> accessingStubVariable [
	"this method will not be part of the model"
	
	^ dependents
]

{ #category : #accessing }
TheRoot >> accessingTestRunner [

	TestRunner
]

{ #category : #accessing }
TheRoot >> accessingUnknowVariable [
	"This is an example of an undeclared variable.
	The goal is to provide an example to test that the Smalltalk importer 
	works in the context of broken code analysis or partial like Squeak"
	
	^ undeclaredStubInstVar
]

{ #category : #'accessing variable' }
TheRoot >> assigningLocalVariable [
	|tmp|
	tmp := 2.
]

{ #category : #'constant accessing' }
TheRoot >> constantReturningMethod [

	^ 'dummyConst'
]

{ #category : #'sending message' }
TheRoot >> dirtySuperSend [

	super singleSuperSend
]

{ #category : #'sending message' }
TheRoot >> expressionSelfSend [

	(self + x) accessSharedVariableFromTheInstanceSide
]

{ #category : #'sending message' }
TheRoot >> multiplePragmas [

	<aPragma: 'Name' parameter: 'Parameter'>
	<anotherPragma>
	
	self pragmaWithUnaryName
]

{ #category : #'sending message' }
TheRoot >> pragmaWithParameters [

	<aPragma: 'Name' parameter: 'Parameter'>
]

{ #category : #'sending message' }
TheRoot >> pragmaWithUnaryName [

	<aPragma>
]

{ #category : #delegating }
TheRoot >> pureDelegateViaInstanceVariableNoReturn [

	x pureDelegateViaInstanceVariableNoReturn
]

{ #category : #delegating }
TheRoot >> pureDelegateViaInstanceVariableReturn [

	^ x pureDelegateViaInstanceVariableReturn
]

{ #category : #delegating }
TheRoot >> pureDelegateViaSelfMessageNoReturn [

	 self x pureDelegateViaSelfMessageNoReturn
]

{ #category : #delegating }
TheRoot >> pureDelegateViaSelfMessageReturn [

	^ self x pureDelegateViaSelfMessageReturn
]

{ #category : #'sending message' }
TheRoot >> returningImportedClass [

	^ TheRoot
]

{ #category : #'sending message' }
TheRoot >> returningSingleSelfSend [

	^self accessSharedVariableFromTheInstanceSide
]

{ #category : #'sending message' }
TheRoot >> returningStubClass [

	^ String
]

{ #category : #'sending message' }
TheRoot >> sendingSubclassResponsibility [

	self subclassResponsibility
]

{ #category : #'sending message' }
TheRoot >> singleSelfSend [

	self accessSharedVariableFromTheInstanceSide
]

{ #category : #'sending message' }
TheRoot >> singleSuperSend [

	super singleSuperSend
]

{ #category : #delegating }
TheRoot >> unPureDelegateViaSelfMessageNoReturn [

	 self xxx unPureDelegateViaSelfMessageNoReturn
]

{ #category : #delegating }
TheRoot >> unPureDelegateViaSelfMessageReturn [

	^  self xxx unPureDelegateViaSelfMessageReturn
]

{ #category : #accessing }
TheRoot >> x [

	^ x
]

{ #category : #accessing }
TheRoot >> x: anInteger [
 
	 x := anInteger
]
