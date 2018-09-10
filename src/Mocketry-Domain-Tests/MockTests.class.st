Class {
	#name : #MockTests,
	#superclass : #MockTestCaseSuperclass,
	#instVars : [
		'mock'
	],
	#category : 'Mocketry-Domain-Tests'
}

{ #category : #running }
MockTests >> setUp [
	super setUp.
	"We maually reset current mock behaviour for the case when process specific variable is managed badly. It is covered by other test cases"
	MockCurrentBehaviour value: nil.
		
	mock := Mock new.
]

{ #category : #running }
MockTests >> tearDown [
	"We maually reset current mock behaviour for the case when process specific variable is managed badly. It is covered by other test cases"
	MockCurrentBehaviour value: nil.
	
	super tearDown
]

{ #category : #tests }
MockTests >> testDoesNotExpectMessage [

	| returnedMock unexpectedMessage mockHash |
	unexpectedMessage := MockOccurredMessage receiver: mock selector: #someMessage.
	mock ghostBehaviour: mock ghostBehaviour copy.
	
	returnedMock := mock stubDoesNotExpect: unexpectedMessage.
	
	returnedMock should beInstanceOf: MockForMessageReturn.
	returnedMock ghostBehaviour should be: mock ghostBehaviour.
	returnedMock mockOwnerMessage should be: unexpectedMessage.
	mockHash := returnedMock ghostIdentityHash.
	returnedMock ghostPrintString should equal: 'Result(', mockHash asString, ') of: a Mock(mock) someMessage'.
]

{ #category : #tests }
MockTests >> testDoesNotExpectMessageByObject [

	| actual unexpectedMessage |
	unexpectedMessage := MockOccurredMessage receiver: Any selector: #area.

	actual := (0@0 corner: 2@3) stubDoesNotExpect: unexpectedMessage.
	
	actual should equal: 6
]

{ #category : #tests }
MockTests >> testFetchingNameFromContextWhenItNotExists [
	
	| actual |
	actual := Mock new mockName.
		
	actual should be isAllDigits
]

{ #category : #tests }
MockTests >> testFetchingNameFromInstanceVariableName [
	| actual | 
	actual := mock mockName.
		
	actual should equal: 'mock'
]

{ #category : #tests }
MockTests >> testFetchingNameFromInstanceVariableWhichDefinedInSuperclass [
	| actual | 
	actual := mockFromSuperclass mockName.
		
	actual should equal: 'mockFromSuperclass'
]

{ #category : #tests }
MockTests >> testFetchingNameFromTempVariableName [
	| actual tempMock | 
	tempMock := Mock new.
	
	actual := tempMock mockName.
		
	actual should equal: 'tempMock'
]

{ #category : #tests }
MockTests >> testGettingBehaviourFirstTime [

	| actual |
	
	mock := Mock new.
	actual := mock ghostBehaviour.
	
	actual should beInstanceOf: MockBehaviour.
	actual where ownerEnvironment should be: CurrentExecutionEnvironment value
]

{ #category : #tests }
MockTests >> testGettingBehaviourSecondTimeShouldNotChangeIt [

	| actual initialBehaviour |
	initialBehaviour := mock ghostBehaviour.
	
	MockCurrentBehaviour value: MockBehaviour new.
	
	actual := mock ghostBehaviour.
	
	actual should be: initialBehaviour
]

{ #category : #tests }
MockTests >> testGettingStub [

	| actual stubBehaviour |
	actual := mock stub.
	
	actual should beInstanceOf: MockHelper.
	stubBehaviour := actual ghostBehaviour.
	stubBehaviour should beInstanceOf: MockBehaviour.
	stubBehaviour where mockRole should beInstanceOf: MockStubTeacher.
	stubBehaviour where mockRole object should be: mock.
	stubBehaviour where expectedMessages should be: mock ghostBehaviour expectedMessages.
	stubBehaviour where ownerEnvironment should be: mock ghostBehaviour ownerEnvironment.
]

{ #category : #tests }
MockTests >> testHasBehaviourByDefault [

	| actual |
	actual := mock ghostBehaviour.
	
	actual should beInstanceOf: MockBehaviour.
	actual where ownerEnvironment should be: CurrentExecutionEnvironment value
]

{ #category : #tests }
MockTests >> testInstVarMockHasSameBehaviourAsTempMock [
	| mock2 | 
	mock2 := Mock new.
	
	mock ghostBehaviour should be: mock2 ghostBehaviour
]

{ #category : #tests }
MockTests >> testPrintingStringWhenMockWithName [
	"here we tests how mock will be shown inside tools. 
	By default mocks under test are created in current test environment. We fork messages under test  to simulate tools default environment"
	| actual |
	mock := Mock named: 'test mock'.	
	
	[DefaultExecutionEnvironment beActive.
	actual := mock printString] fork.
	20 milliSeconds wait.
		
	actual should equal: 'a Mock(test mock)'
]

{ #category : #tests }
MockTests >> testPrintingStringWhenMockWithoutName [
	"here we tests how mock will be shown inside tools. 
	By default mocks under test are created in current test environment. We fork messages under test  to simulate tools default environment"
		| actual |
	mock := Mock withoutName. 
	
	[DefaultExecutionEnvironment beActive.
	actual := mock printString] fork.
	20 milliSeconds wait.
		
	actual should equal: 'a Mock(',  mock ghostIdentityHash asString, ')'
]

{ #category : #tests }
MockTests >> testValidationReceivedMessageWhenBehaviourChanged [

	mock := Mock new.
	mock stub someMessage willReturn: #result.

	mock someMessage.	
	MockCurrentBehaviour value: nil.
	
	mock should receive someMessage
]

{ #category : #tests }
MockTests >> testValidationReceivedMessageWhenBehaviourChanged2 [

	mock := Mock new.
	mock stub someMessage willReturn: #result.

	MockCurrentBehaviour value: nil.
	mock someMessage.
	
	mock should receive someMessage
]
