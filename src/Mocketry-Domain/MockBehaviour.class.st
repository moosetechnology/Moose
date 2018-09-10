"
I am ghost behaviour for mocks.
I delegate messages processing to MockRole instance. For example MockTeacher will build expectations for received message. And MockPlayer will use expectations to execute received messages.

So I have collection of expectedMessages and collection of occurredMessages.
Expected messages contains description of messages with predefined actions for them. Actions are performed when occurred message corresponds to expectation description.
Occurred messages contains full histrory of intercepted messages in context of player role. In tests you can write specifications about what was happened.

To represent intercepted messages I use MockOccurredMessage class. It provide suitable printing and hold extra information. For example it contains process where message was sent and returned result. In test such information can be used to validate tested behaviour.

As ghost behaviour I define my vision on current meta level. I use empty meta level when message intercepted in context of tests. And I use standart meta level when it was happens in contexts of tools (not tests). For this I use process specific variable MockCurrentEnvironment. During test it is MockTestEnvironment and in context of tools it is MockDefaultEnvironment.

Usually my instance not created directly. You should use process specific variable to retrive me from current context.
 	MockCurrentBahaviour value 
Idea that mocks inside same test should have single behaviour instance. 	

Public API and Key Messages

- buildExpectationFor: anOccurredMessage
It will create and return MockExpectedMessage for received message. send. Then users can sent special messages to it to define expected behaviour.

- replayMessageSend: anOccurredMessage
It will lookup and execute expectation for received message send. Given occurred message will be saved in occurredMessages history. 

- validateOccurredMessagesBy: aSpecOfExpectedMessage
It will validate occurredMessages collection by given spec.
 
- createHelperMockAs: aMockRole 
It will create special mock which will delegate all messages to given role.

- useMockRole: aMockRole while: aBlock
It will use given mock role to process intercepted messages during given block execution.

- replayMocks 
It set role MockPlayer

- teachMocks
It set role MockTeacher 
  
- setUpContextNameFor: aMock
It will extract name of variable which contains aMock from current test case context. If it will be found detected name will be set to given mock.

Internal Representation and Key Implementation Points.

    Instance Variables
	ownerEnvironment:		<MockEnvironment>
	expectedMessages:		<Collection of <MockExpectedMessage>>
	mockRole:		<MockRole>
	occurredMessages:		<Collection of <MockOccurredMessage>>

"
Class {
	#name : #MockBehaviour,
	#superclass : #GHGhostBehaviour,
	#instVars : [
		'ownerEnvironment',
		'ownerProcess',
		'ownerTestCase',
		'testSelector',
		'mockRole',
		'occurredMessages',
		'expectedMessages',
		'messageArgCaptures',
		'registeredObjects',
		'globalStubs'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #'instance creation' }
MockBehaviour class >> for: aMockEnvironment [
	^self new
		ownerEnvironment: aMockEnvironment 
]

{ #category : #operations }
MockBehaviour >> addExpectation: aMockExpectedMessage [
	"last added expectation should override previously defined. 
	For this new expectation is added to start of expectedMessages list. 
	It makes lookup of expectations easy (look at method #replayMessageSend:)"

	expectedMessages addFirst: aMockExpectedMessage 
]

{ #category : #operations }
MockBehaviour >> addExpectation: aMockExpectedMessage asPartOfGroup: expectationsGroup [
	"Expectations can be defined as separated group of messages. 
	In that case they should be added in same order as they defined in group.
	When group is empty we think it is first expectation for given group and we add it in order to override previously defined expectations. This trick is used to allo lenient/strict validation of spec defined by expectations"

	expectationsGroup 
		ifEmpty: [ self addExpectation: aMockExpectedMessage]
		ifNotEmpty: [ expectedMessages add: aMockExpectedMessage after: expectationsGroup last]
]

{ #category : #accessing }
MockBehaviour >> argCaptureNamed: aString [

	^messageArgCaptures at: aString ifAbsentPut: [ MockArgCapture named: aString ]
]

{ #category : #operations }
MockBehaviour >> createHelperMockAs: aMockRole [

	| helperBehaviour mock |
	helperBehaviour := self copy.
	helperBehaviour mockRole: aMockRole.
	
	mock := MockHelper named: aMockRole printString.
	mock ghostBehaviour: helperBehaviour.
	^mock
]

{ #category : #operations }
MockBehaviour >> createMockToValidate: anObject withNegation: aBoolean [
	
	^self createHelperMockAs: (MockValidator for: anObject withNegation: aBoolean)
]

{ #category : #accessing }
MockBehaviour >> currentMetaLevel [
	^CurrentExecutionEnvironment value currentMetaLevelForMocks
]

{ #category : #accessing }
MockBehaviour >> expectedMessages [
	^ expectedMessages
]

{ #category : #accessing }
MockBehaviour >> expectedMessages: anObject [
	expectedMessages := anObject
]

{ #category : #initialization }
MockBehaviour >> initialize [
	super initialize.
	registeredObjects := OrderedCollection new.
	globalStubs := OrderedCollection new.
	expectedMessages := OrderedCollection new.
	occurredMessages := OrderedCollection new.
	messageArgCaptures := Dictionary new.
	self replayMocks.
]

{ #category : #testing }
MockBehaviour >> isInheritableByFork [

	^ownerEnvironment allowsForkedProcessInheritMocks
]

{ #category : #accessing }
MockBehaviour >> mockRole [
	^ mockRole
]

{ #category : #accessing }
MockBehaviour >> mockRole: anObject [
	mockRole := anObject
]

{ #category : #accessing }
MockBehaviour >> occurredMessages [
	^ occurredMessages
]

{ #category : #accessing }
MockBehaviour >> occurredMessages: anObject [
	occurredMessages := anObject
]

{ #category : #accessing }
MockBehaviour >> ownerEnvironment [
	^ ownerEnvironment
]

{ #category : #accessing }
MockBehaviour >> ownerEnvironment: anExecutionEnvironment [
	ownerEnvironment := anExecutionEnvironment.
	ownerProcess := Processor activeProcess
]

{ #category : #accessing }
MockBehaviour >> ownerProcess [
	^ ownerProcess
]

{ #category : #accessing }
MockBehaviour >> ownerTestCase [
	^ ownerTestCase
]

{ #category : #accessing }
MockBehaviour >> ownerTestCase: aTestCase [
	ownerTestCase := aTestCase.
	testSelector := aTestCase selector
]

{ #category : #controlling }
MockBehaviour >> recoverGlobalStubs [

	globalStubs do: [ :each |
		each recoverFromGHMutation  
	]
]

{ #category : #controlling }
MockBehaviour >> registerObject: anObject [

	registeredObjects add: anObject.
	(anObject ghostClass inheritsFrom: Class) ifTrue: [ globalStubs add: anObject ]
]

{ #category : #accessing }
MockBehaviour >> registeredObjects [

	^registeredObjects
]

{ #category : #operations }
MockBehaviour >> replayMessageSend: anOccurredMessage [
	| expected |
	
	occurredMessages add: anOccurredMessage.
	
	expected := expectedMessages 
		detect: [ :each | each isAbout: anOccurredMessage ]
		ifNone: [^anOccurredMessage setUpUnexpectedResult].
	
	^anOccurredMessage extractResultFrom: [expected executeAs: anOccurredMessage].
]

{ #category : #accessing }
MockBehaviour >> replayMocks [
	mockRole := MockPlayer default
]

{ #category : #'message interception' }
MockBehaviour >> send: aMessage to: aMockObject [
	| occurredMessage |
	occurredMessage := MockOccurredMessage 
				receiver: aMockObject 
				selector: aMessage selector
				arguments: aMessage arguments.
				
	^mockRole processMessageSend: occurredMessage by: self
]

{ #category : #accessing }
MockBehaviour >> setUpContextNameFor: aMock [

	ownerEnvironment setUpMockNameFor: aMock inContextOf: ownerProcess
]

{ #category : #accessing }
MockBehaviour >> teachMocks [
	mockRole := MockTeacher default
]

{ #category : #accessing }
MockBehaviour >> testSelector [
	^ testSelector
]

{ #category : #operations }
MockBehaviour >> useMockRole: aMockRole while: aBlock [

	| currentRole |
	currentRole := mockRole.
	mockRole := aMockRole.
	aBlock ensure: [ mockRole := currentRole ]
]

{ #category : #operations }
MockBehaviour >> validateOccurredMessagesBy: aSpecOfOccurredMessages [ 
	
	| separateSpecs |
	separateSpecs := aSpecOfOccurredMessages asInteractionSpecBetweenAll: self registeredObjects.
	
	^(separateSpecs validate: occurredMessages) raise
]
