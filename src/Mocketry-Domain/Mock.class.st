"
I am mock object. I am implemented by Ghost proxy framework.
My behaviour is MockBehaviour which I retrieve during creation from MockCurrentBehaviour process specific variable. All mocks created during tests shares same MockBehaviour instance.

I has name which I used for printing. Try:
	mock := Mock named: 'test mock'.
	mock ghostPrintString
But it is not required to create me with name. In tests you will usually create me by #new.
	testMock := Mock new.
I implement special name detection logic to retrive variable name from test context. In that case in debugger you will see ""a Mock(testMock)"". 
It is happens only when you debug tests. Look at MockObjectsTests with ""fetchingName"" prefix and try debug it to watch how it is working in reality. 

MockBehaviour implements special logic to detect current meta level. Idea that during tests all messages should be intercepted and stubbed. But in context of tools like debugger meta messages should be work normally without stubbing logic. For this MockBehaviour detects MockCurrentTestEnvironment which will be not related to test in case of tools .

Look at MockAcceptance tests to learn how to use mocks. In short to create expected behaviour for particular messages use:
	mock stub someMessage willReturn: #result
Or to define group of expected message sends:
	[ mock someMessage willReturn: 1.
	mock2 someMessage2 willReturn: 2 ] should expect 
To verify that particular message occurred use: 
	mock should receive someMessage 
Or to verify group of message sends use: 
	[ mock someMessage.
	mock2 someMessage2 ] should occur 
For ordered message sends use: 
	[ mock someMessage.
	mock2 someMessage2 ] should occurInSameOrder

Also there is short way to teach and verify expected message sends: 
	[ ""some tested code here"" ]
		shoud lenient satisfy: 
	[ mock someMessage.
	mock2 someMessage2 ]
""Lenient"" means that expected sends was occurred in any order.

	[ ""some tested code here"" ]
		shoud strictly satisfy:
	[ mock someMessage.
	mock2 someMessage2 ]
""Strictly"" means that expected sends was occurred in strict order.

When no expectation found for received message I return new mock (MockForMessageReturn). By this you dont need to write expectations for any possible messages. You should only specify what you really interesting for particular test.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	behaviour:		<MockBehaviour>
	name:		<String>
"
Class {
	#name : #Mock,
	#superclass : #GHObjectGhost,
	#traits : 'GHTNotNilGhost + GHTIdentifiedGhost',
	#classTraits : 'GHTNotNilGhost classTrait + GHTIdentifiedGhost classTrait',
	#instVars : [
		'behaviour',
		'name'
	],
	#category : 'Mocketry-Domain'
}

{ #category : #accessing }
Mock class >> canonicalArgumentName [
	^'aMock'
]

{ #category : #'instance creation' }
Mock class >> named: aString [

	^self withBehaviour 
		mockName: aString
]

{ #category : #'instance creation' }
Mock class >> new [
	
	^self withBehaviour
]

{ #category : #stub }
Mock class >> stub [
	^MockCurrentBehaviour value createHelperMockAs: (MockStubTeacher for: (Kind of: self))
]

{ #category : #private }
Mock class >> withBehaviour [
	"This method creates most primitive mock instance with prepared ghostBehaviour. Users should use high level instance creation methods"
	
	^self basicNew
		prepareGhostBehaviour
]

{ #category : #'instance creation' }
Mock class >> withoutName [
	"It is explicit message to create mock without name. 
	Standart #new message always detects name by name of containing variable in context"

	^self withBehaviour
		setUpDefaultMockName;
		yourself
]

{ #category : #accessing }
Mock >> currentMockBehaviour [
	^behaviour 
]

{ #category : #accessing }
Mock >> ghostBehaviour [
	^behaviour
]

{ #category : #accessing }
Mock >> ghostBehaviour: aMockBehaviour [
	behaviour := aMockBehaviour.
	behaviour registerObject: self
]

{ #category : #printing }
Mock >> ghostPrintString [

	| objectName |
	objectName := GHMetaMessages printObject: self.
	
	^objectName, '(', self mockName, ')'
]

{ #category : #testing }
Mock >> isAllowAutoStub [
	^true
]

{ #category : #accessing }
Mock >> mockName [

	^name ifNil: [ self setUpDefaultMockName. "it is to prevent recursion if tools start to debug next sentence and they will needed in mock name"
		self setUpNameFromTestContext. 
		name ]
]

{ #category : #accessing }
Mock >> mockName: aString [

	name := aString
	
]

{ #category : #initialization }
Mock >> prepareGhostBehaviour [
	self ghostBehaviour: MockCurrentBehaviour value
]

{ #category : #private }
Mock >> setUpDefaultMockName [

	^name := self ghostIdentityHash asString
]

{ #category : #private }
Mock >> setUpNameFromTestContext [

	self ghostBehaviour setUpContextNameFor: self
]

{ #category : #accessing }
Mock >> stub [

	^behaviour createHelperMockAs: (MockStubTeacher for: self)
]

{ #category : #'message performing' }
Mock >> stubDoesNotExpect: anOccurredMessage [
	
	^MockDefaultMethods execute: anOccurredMessage on: self
]
