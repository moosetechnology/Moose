Class {
	#name : #MockAcceptanceTests,
	#superclass : #TestCase,
	#instVars : [
		'mock'
	],
	#category : 'Mocketry-Domain-Tests'
}

{ #category : #running }
MockAcceptanceTests >> createTestCaseToCheckMocksCleaning [

	^self class selector: #methodForTestWhichCheckThatMockCleaningAfterEachTestIsWorking 
]

{ #category : #running }
MockAcceptanceTests >> createTestCaseWithHaltToCheckMocksCleaning [

	^self class selector: #methodForTestWithHaltWhichCheckThatMockCleaningWorks 
]

{ #category : #tests }
MockAcceptanceTests >> methodForTestWhichCheckThatMockCleaningAfterEachTestIsWorking [

	mock := Mock new.
	
	mock someMessage should not be: #firstTestResult.

	Any stub someMessage willReturn: #firstTestResult.

	mock someMessage should be: #firstTestResult
]

{ #category : #tests }
MockAcceptanceTests >> methodForTestWithHaltWhichCheckThatMockCleaningWorks [

	mock := Mock new.
	
	mock someMessage should not be: #firstTestResult.

	Any stub someMessage willReturn: #firstTestResult.
	
	self halt.
	
	mock someMessage should be: #firstTestResult
]

{ #category : #running }
MockAcceptanceTests >> setUp [
	super setUp.
	
	mock := Mock new
]

{ #category : #tests }
MockAcceptanceTests >> testAsyncMessageExpectation [

	| actual |
	mock stub someMessage shouldBeSentInAnotherProcess; willReturn: #result.
	
	[mock someMessage] should raise: SpecOfFailed.
	
	[actual := mock someMessage] fork.
	50 milliSeconds wait.
	
	actual should be: #result
]

{ #category : #tests }
MockAcceptanceTests >> testBuildingExpectationByAnySpecReceiver [

	| mock2 |
	Any stub someMessage willReturn: #result.
	
 	mock someMessage should be: #result.
	
	mock2 := Mock new.
	mock2 someMessage should be: #result.
]

{ #category : #tests }
MockAcceptanceTests >> testBuildingExpectationBySpecReceiver [

	| mock2 |
	mock2 := Mock new.
	
	(SpecOfOrDisjunction of: mock and: mock2) stub someMessage willReturn: #result.
	
 	mock someMessage should be: #result.
	mock2 someMessage should be: #result.
]

{ #category : #tests }
MockAcceptanceTests >> testBuildingExpectationForAnyMessageSend [

	mock stub anyMessage willReturn: #result.
	
 	mock someMessage should be: #result.
	mock someMessage2 should be: #result
]

{ #category : #tests }
MockAcceptanceTests >> testBuildingExpectationForAnyMocks [

	| mock2 |
	Mock stub someMessage willReturn: #result.
	
 	mock someMessage should be: #result.
	
	mock2 := Mock new.
	mock2 someMessage should be: #result
]

{ #category : #tests }
MockAcceptanceTests >> testBuildingExpectationForMocksReturnedFromMessages [

	MockForMessageReturn stub extraMessage willReturn: #result.
	
 	mock someMessage extraMessage should be: #result.
	mock someMessage2 extraMessage should be: #result
]

{ #category : #tests }
MockAcceptanceTests >> testBuildingExpectationsByBlock [

	| mock2 |
	mock2 := Mock new.
	
	[mock someMessage willReturn: #result.
	mock2 someMessage2 willReturn: #result2] should expect.
	
 	mock someMessage should be: #result.	
	mock2 someMessage2 should be: #result2.
]

{ #category : #tests }
MockAcceptanceTests >> testCapturingArgument [

	mock stub someMessageWith: Arg argName.
	
 	mock someMessageWith: #argValue.
	
	Arg argName should be: #argValue
]

{ #category : #tests }
MockAcceptanceTests >> testCapturingArgumentWillStubIt [

	| rect |
	mock stub someMessageWith: Arg rectangle.

	rect := 0@0 corner: 2@3.
	mock someMessageWith: rect.
	rect area.
	
	Arg rectangle should be: rect.
	Arg rectangle should receive width.
	Arg rectangle where corner x should be: 2
]

{ #category : #tests }
MockAcceptanceTests >> testChoosingPreferredExpectedMessageByArgs [

	(mock stub someMessageWith: 2) willReturn: #resultFor2.
	(mock stub someMessageWith: 3) willReturn: #resultFor3.
		
	(mock someMessageWith: 3) should be: #resultFor3.
	(mock someMessageWith: 2) should be: #resultFor2.
]

{ #category : #tests }
MockAcceptanceTests >> testCleaningMocksAfterTestWithHaltAborted [

	| suite result |
	suite := TestSuite new.
	suite addTest: self createTestCaseWithHaltToCheckMocksCleaning.	
		
	DefaultExecutionEnvironment beActiveDuring: [ 
	[suite run] on: Halt do: [:halt | 
		DefaultExecutionEnvironment beActiveDuring: [
			result := [suite run] on: Halt do: [:halt2 | halt2 resume].
			result should be hasPassed]]].
	
]

{ #category : #tests }
MockAcceptanceTests >> testCleaningMocksAfterTestWithHaltResumed [

	| suite result |
	suite := TestSuite new.
	suite addTest: self createTestCaseWithHaltToCheckMocksCleaning.	

	DefaultExecutionEnvironment beActiveDuring: [
		result := [suite run] on: Halt do: [:halt | halt resume]].
	result should be hasPassed.
	
	DefaultExecutionEnvironment beActiveDuring: [
		result := [suite run] on: Halt do: [:halt | halt resume]].
	result should be hasPassed.
]

{ #category : #tests }
MockAcceptanceTests >> testCleaningMocksAfterTests [

	| suite result |
	suite := TestSuite new.
	suite addTest: self createTestCaseToCheckMocksCleaning.	

	DefaultExecutionEnvironment beActiveDuring: [result := suite run].
	result should be hasPassed.
	
	DefaultExecutionEnvironment beActiveDuring: [result := suite run].
	result should be hasPassed.
]

{ #category : #tests }
MockAcceptanceTests >> testExpectationWithConditionVerificationAndFollowingReturn [

	| flag |
	mock stub someMessage 
		willReturn: #result;
		when: [ flag ] is: (Equal to: true).
	
	[mock someMessage] should raise: SpecOfFailed.
	
	flag := true.	
	mock someMessage should be: #result
]

{ #category : #tests }
MockAcceptanceTests >> testExpectationWithConditionVerificationByBlock [

	| flag |
	mock stub someMessage when: [ flag ] satisfy: [ :v | flag = true ].
	
	[mock someMessage] should raise: SpecOfFailed.
	
	flag := true.	
	mock someMessage
]

{ #category : #tests }
MockAcceptanceTests >> testExpectationWithConditionVerificationBySpec [

	| flag |
	mock stub someMessage when: [ flag ] is: (Equal to: true).
	
	[mock someMessage] should raise: SpecOfFailed.
	
	flag := true.	
	mock someMessage
]

{ #category : #tests }
MockAcceptanceTests >> testLastAddedExpectationIsMostPreferredThanOthers [

	(mock stub someMessageWith: Any) willReturn: #defaultResult.
	(mock stub someMessageWith: 3) willReturn: #resultFor3.
		
	(mock someMessageWith: 3) should be: #resultFor3.
	(mock someMessageWith: 2) should be: #defaultResult.
]

{ #category : #tests }
MockAcceptanceTests >> testLenientValidationOfBuiltExpectations [

	| mock2 |
	mock2 := Mock new.
	mock stub notParticipatingMessage willReturn: 10.
	
	[ mock someMessage should be: #result.	
	mock2 someMessage2 should be: #result2 ]
		should lenient satisfy: 	
	[mock someMessage willReturn: #result.
	mock2 someMessage2 willReturn: #result2]
]

{ #category : #tests }
MockAcceptanceTests >> testLenientValidationOfBuiltExpectationsShouldReplayExpectationsInDefinedOrder [

	mock stub someMessage willReturn: #result0.
	
	[ mock someMessage should be: #result1.
	mock someMessage should be: #result2. ]
		should lenient satisfy: 	
	[mock someMessage useOnce; willReturn: #result1.
	mock someMessage useOnce; willReturn: #result2].

	mock someMessage should be: #result0
]

{ #category : #tests }
MockAcceptanceTests >> testLenientValidationOfBuiltExpectationsShouldSetUpUsageOnceSpecByDefault [

	mock stub someMessage willReturn: #result0.
	
	[ mock someMessage should be: #result1.
	mock someMessage should be: #result2. ]
		should lenient satisfy: 	
	[mock someMessage willReturn: #result1.
	mock someMessage willReturn: #result2].

	mock someMessage should be: #result0
]

{ #category : #tests }
MockAcceptanceTests >> testLenientValidationOfBuiltExpectationsWhenArbitrarilyUsageDefinedAndItMessageNotHappen [

	[mock someMessage should be: #result. ]
			should lenient satisfy: 	
	[mock someMessage willReturn: #result.
	mock someMessage2 willReturn: #result2; useArbitrarily]
]

{ #category : #tests }
MockAcceptanceTests >> testLenientValidationOfBuiltExpectationsWhenMoreMessagesWasOccurred [

	| mock2 |
	mock2 := Mock new.
	
	[ mock2 someMessage2 should be: #result2.
	mock someMessage should be: #result.
	mock someMessage3 ]
		should lenient satisfy: 	
	[mock someMessage willReturn: #result.
	mock2 someMessage2 willReturn: #result2]
]

{ #category : #tests }
MockAcceptanceTests >> testLenientValidationOfBuiltExpectationsWhenSomeExpectationWasNotOccurred [

	| mock2 |
	mock2 := Mock new.
	
	[
		[ mock someMessage should be: #result]
			should lenient satisfy: 	
		[mock someMessage willReturn: #result.
		mock2 someMessage2 willReturn: #result2]
	] should raise: SpecOfFailed
]

{ #category : #tests }
MockAcceptanceTests >> testLenientValidationOfBuiltExpectationsWhenTheyOccurredInDifferentOrder [

	| mock2 |
	mock2 := Mock new.
	
	[ mock2 someMessage2 should be: #result2.
	mock someMessage should be: #result. ]
		should lenient satisfy: 	
	[mock someMessage willReturn: #result.
	mock2 someMessage2 willReturn: #result2]
]

{ #category : #tests }
MockAcceptanceTests >> testMockFromMessageShouldSimulateFalseInIfFalseExpression [
	| returnedMock result |	
	returnedMock := mock someMessage.
	
	result := returnedMock ifFalse: [ #ifFalseBranch ].
	
	result should be: #ifFalseBranch
]

{ #category : #tests }
MockAcceptanceTests >> testMockFromMessageShouldSimulateFalseInIfFalseIfTrueExpression [
	| returnedMock result |	
	returnedMock := mock someMessage.
	
	result := returnedMock ifFalse: [ #falseBranch ] ifTrue: [ #trueBranch ].
	
	result should be: #falseBranch.
	returnedMock should be: false
]

{ #category : #tests }
MockAcceptanceTests >> testMockFromMessageShouldSimulateFalseInIfTrueExpression [
	| returnedMock result ifTrueExecuted |	
	returnedMock := mock someMessage.
	
	result := returnedMock ifTrue: [ ifTrueExecuted := true ].
	
	result should be: nil.
	ifTrueExecuted should not be: true
]

{ #category : #tests }
MockAcceptanceTests >> testMockFromMessageShouldSimulateFalseInIfTrueIfFalseExpression [
	| returnedMock result |	
	returnedMock := mock someMessage. 
	  
	result := returnedMock ifTrue: [ #trueBranch ] ifFalse: [ #falseBranch ].

	result should be: #falseBranch.
	returnedMock should be: false
]

{ #category : #tests }
MockAcceptanceTests >> testMockFromMessageShouldSimulateZeroInFloatArithmetics [
	| returnedMock result |	
	returnedMock := mock someMessage.
	
	result := 1.0 + returnedMock.
	result should equal: 1.0.
	returnedMock should equal: 0.0
]

{ #category : #tests }
MockAcceptanceTests >> testMockFromMessageShouldSimulateZeroInFloatComparison [
	| returnedMock result |	
	returnedMock := mock someMessage.
	
	result := 1.0 > returnedMock.
	result should be: true.
	returnedMock should equal: 0.0
]

{ #category : #tests }
MockAcceptanceTests >> testMockFromMessageShouldSimulateZeroInFractionArithmetics [
	| returnedMock result |	
	returnedMock := mock someMessage.
	
	result := 1/2 + returnedMock.
	result should equal: 1/2.
	returnedMock should equal: 0
]

{ #category : #tests }
MockAcceptanceTests >> testMockFromMessageShouldSimulateZeroInFractionComparison [
	| returnedMock result |	
	returnedMock := mock someMessage.
	
	result := 1/2 > returnedMock.
	result should be: true.
	returnedMock should equal: 0
]

{ #category : #tests }
MockAcceptanceTests >> testMockFromMessageShouldSimulateZeroInIntegerArithmetics [
	| returnedMock result |	
	returnedMock := mock someMessage.
	
	result := 1 + returnedMock.
	result should equal: 1.
	returnedMock should equal: 0
]

{ #category : #tests }
MockAcceptanceTests >> testMockFromMessageShouldSimulateZeroInIntegerComparison [
	| returnedMock result |	
	returnedMock := mock someMessage.
	
	result := 1 > returnedMock.
	result should be: true.
	returnedMock should equal: 0
]

{ #category : #tests }
MockAcceptanceTests >> testMockFromMessageShouldSimulateZeroInPointArithmetics [
	| returnedMock result |	
	returnedMock := mock someMessage.
	
	result := 1@2 + returnedMock.
	result should equal: 1@2.
	returnedMock should equal: 0@0
]

{ #category : #tests }
MockAcceptanceTests >> testReturnFromMessageSeveralTimes [

	| actual actual2 |
	mock stub someMessage willReturn: #result.
	
	actual := mock someMessage.
	actual should be: #result.
	
	actual2 := mock someMessage.
	actual2 should be: #result
]

{ #category : #tests }
MockAcceptanceTests >> testReturnFromMessageSeveralTimesWhenForEachTimeThereIsSpecificExpectation [

	mock stub someMessage willReturn: #initialResult.
	mock stub someMessage willReturn: #newResult; useTwice.

	mock someMessage should be: #newResult.	
	mock someMessage should be: #newResult.
	
	mock someMessage should be: #initialResult

]

{ #category : #tests }
MockAcceptanceTests >> testReturnNewMockFromUnexpectedMessage [

	| actual mockHash |	
	actual := mock someMessage.
	
	actual should beInstanceOf: MockForMessageReturn.
	mockHash := actual ghostIdentityHash.
	actual ghostPrintString should equal: 'Result(', mockHash asString, ') of: a Mock(mock) someMessage'
]

{ #category : #tests }
MockAcceptanceTests >> testRunningBlockWithMocks [
	
	[:mockA :mockB | 
		mockA mockName should equal: 'mockA'.
		mockB mockName should equal: 'mockB'.
		
		mockA someMessage.
		
		mockA should receive someMessage
	] runWithMocks.

	
]

{ #category : #tests }
MockAcceptanceTests >> testStrictValidationOfBuiltExpectations [

	| mock2 |
	mock2 := Mock new.
	mock stub notParticipatingMessage willReturn: 100.
	
	[ mock someMessage should be: #result.	
	mock2 someMessage2 should be: #result2 ]
		should strictly satisfy: 	
	[mock someMessage willReturn: #result.
	mock2 someMessage2 willReturn: #result2]
]

{ #category : #tests }
MockAcceptanceTests >> testStrictValidationOfBuiltExpectationsShouldReplayExpectationsInDefinedOrder [

	mock stub someMessage willReturn: #result0.
	
	[ mock someMessage should be: #result1.	
	mock someMessage should be: #result2]
		should strictly satisfy: 	
	[mock someMessage useOnce; willReturn: #result1.
	mock someMessage useOnce; willReturn: #result2].

	mock someMessage should be: #result0 
]

{ #category : #tests }
MockAcceptanceTests >> testStrictValidationOfBuiltExpectationsShouldSetUpUsageOnceSpecByDefault [

	mock stub someMessage willReturn: #result0.
	
	[ mock someMessage should be: #result1.	
	mock someMessage should be: #result2]
		should strictly satisfy: 	
	[mock someMessage willReturn: #result1.
	mock someMessage willReturn: #result2].

	mock someMessage should be: #result0 
]

{ #category : #tests }
MockAcceptanceTests >> testStrictValidationOfBuiltExpectationsWhenArbitrarilyUsageDefinedAndItMessageNotHappen [

	[mock someMessage should be: #result. ]
			should strictly satisfy: 	
	[mock someMessage willReturn: #result.
	mock someMessage2 willReturn: #result2; useArbitrarily]
]

{ #category : #tests }
MockAcceptanceTests >> testStrictValidationOfBuiltExpectationsWhenArbitrarilyUsageDefinedAndItMessageWasInWrongTime [

	[mock someMessage2 should be: #result2.
	mock someMessage should be: #result. ]
			should strictly satisfy: 	
	[mock someMessage willReturn: #result.
	mock someMessage2 willReturn: #result2; useArbitrarily]
]

{ #category : #tests }
MockAcceptanceTests >> testStrictValidationOfBuiltExpectationsWhenMoreMessagesWereOccurred [

	| mock2 |
	mock2 := Mock new.
	
	[	mock someMessage should be: #result. 
	mock2 someMessage2 should be: #result2.
	mock someMessage3 ]
		should strictly satisfy: 	
	[mock someMessage willReturn: #result.
	mock2 someMessage2 willReturn: #result2]
]

{ #category : #tests }
MockAcceptanceTests >> testStrictValidationOfBuiltExpectationsWhenSomeExpectationWasNotOccurred [

	| mock2 |
	mock2 := Mock new.
	
	[
		[ mock someMessage should be: #result]
			should strictly satisfy: 	
		[mock someMessage willReturn: #result.
		mock2 someMessage2 willReturn: #result2]
	] should raise: SpecOfFailed
]

{ #category : #tests }
MockAcceptanceTests >> testStrictValidationOfBuiltExpectationsWhenTheyOccurredInDifferentOrder [

	| mock2 |
	mock2 := Mock new.
	
	[
		[ mock2 someMessage2 should be: #result2.
		mock someMessage should be: #result. ]
			should strictly satisfy: 	
		[mock someMessage willReturn: #result.
		mock2 someMessage2 willReturn: #result2]
	] should raise: SpecOfFailed
]

{ #category : #tests }
MockAcceptanceTests >> testStubbingGlobalClass [
	
	[
		GHClassStub stub someMessage willReturn: #result.

		GHClassStub someMessage should be: #result
	
	] ensure: [ GHClassStub recoverFromGHMutation ]
	
]

{ #category : #tests }
MockAcceptanceTests >> testStubbingRealObject [

	| rect |
	rect := 0@0 corner: 2@3.
	
	rect stub area willReturn: 100.

	rect area should be: 100.
	rect origin should equal: 0@0
]

{ #category : #tests }
MockAcceptanceTests >> testStubbingRealObjectAndCopy [

	| rect copy |
	rect := 0@0 corner: 2@3.
	rect stub.

	copy := rect copy.
	copy should beInstanceOf: Rectangle.
	copy corner should equal: rect corner.
	copy origin should equal: rect origin
]

{ #category : #tests }
MockAcceptanceTests >> testStubbingRealObjectSelfSend [

	| rect |
	rect := 0@0 corner: 2@3.
	
	rect stub width willReturn: 1000.

	rect area should be: 3000
]

{ #category : #tests }
MockAcceptanceTests >> testStubbingRealObjectShouldRespectPerform [

	| rect actual |
	rect := 0@0 corner: 2@3.
	rect stub width willReturn: 100.
	rect width should equal: 100.

	actual := rect perform: #width. 
	actual should equal: 100
]

{ #category : #tests }
MockAcceptanceTests >> testSyncMessageExpectation [

	| raised |
	mock stub someMessage shouldBeSentInThisProcess; willReturn: #result.

	[mock someMessage] should not raise: SpecOfFailed.
	
	[ [mock someMessage] should raise: SpecOfFailed.	raised := true ] fork.
	50 milliSeconds wait.
	
	raised should be: true
]

{ #category : #tests }
MockAcceptanceTests >> testUnexpectedCopyMessageToMock [

	| actual |			
	actual := mock copy.
	
	actual should beInstanceOf: MockForMessageReturn.
	actual ghostBehaviour should be: mock ghostBehaviour.
	actual mockOwnerMessage selector should be: #copy
]

{ #category : #tests }
MockAcceptanceTests >> testUnexpectedMessageDefinedOnObject [

	| actual |	
	actual := mock -> #value.
	
	actual should beInstanceOf: Association.
	actual key should be: mock.
	actual value should be: #value
]

{ #category : #tests }
MockAcceptanceTests >> testUnexpectedMessageDefinedOnObjectWhichDefaultMethodFailed [

	| actual |	
	[ Object new at: 500 ] should fail.
	actual := mock at: 500.
	
	actual should beInstanceOf: MockForMessageReturn.
	MockCurrentBehaviour value occurredMessages should haveSize: 1
]

{ #category : #tests }
MockAcceptanceTests >> testUnexpectedShallowCopyMessageToMock [

	| actual |			
	actual := mock shallowCopy.
	
	actual should beInstanceOf: MockForMessageReturn.
	actual ghostBehaviour should be: mock ghostBehaviour.
	actual mockOwnerMessage selector should be: #shallowCopy
]

{ #category : #tests }
MockAcceptanceTests >> testUsingExpectationAnyTimes [
	"It is default usage strategy. But for lenient/strict logic default is useOnce"
	mock stub someMessage willReturn: #default.
	
	mock stub someMessage willReturn: #result; useOnce; useArbitrarily.
		
	mock someMessage should be: #result.
	mock someMessage should be: #result.
	mock someMessage should be: #result
]

{ #category : #tests }
MockAcceptanceTests >> testUsingExpectationAnyTimesShouldNotCorruptOtherExpectations [
	"It is default usage strategy. But for lenient/strict logic default is useOnce"

	mock stub someMessage2 willReturn: #result2.
	mock stub someMessage willReturn: #result; useArbitrarily.
	
	mock someMessage2 should be: #result2.	
	mock someMessage should be: #result
]

{ #category : #tests }
MockAcceptanceTests >> testUsingExpectationOnce [

	mock stub someMessage willReturn: #default.
	
	mock stub someMessage willReturn: #result; useOnce.
		
	mock someMessage should be: #result.
	mock someMessage should be: #default.
]

{ #category : #tests }
MockAcceptanceTests >> testUsingExpectationThreeTimes [

	mock stub someMessage willReturn: #default.
	
	mock stub someMessage willReturn: #result; use: 3.
		
	mock someMessage should be: #result.
	mock someMessage should be: #result.
	mock someMessage should be: #result.
	
	mock someMessage should be: #default.
]

{ #category : #tests }
MockAcceptanceTests >> testUsingExpectationTwice [

	mock stub someMessage willReturn: #default.
	
	mock stub someMessage willReturn: #result; useTwice.
		
	mock someMessage should be: #result.
	mock someMessage should be: #result.

	mock someMessage should be: #default.
]

{ #category : #tests }
MockAcceptanceTests >> testValidationAutomockReceivedMessage [

	| autoMock |
	autoMock := mock someMessage.
	
	[autoMock should receive someMessage2] should raise: SpecOfFailed.
	
	autoMock someMessage2.
	
	autoMock should receive someMessage2
]

{ #category : #tests }
MockAcceptanceTests >> testValidationMessageProcessWhenItOccuredInForkedProcess [

	[mock someMessage] fork.
	20 milliSeconds wait.
		
	mock should receive someMessage inAnotherProcess.	
	[mock should receive someMessage inThisProcess] should raise: SpecOfFailed
]

{ #category : #tests }
MockAcceptanceTests >> testValidationMessageProcessWhenItOccuredInThisProcess [

	mock someMessage.
		
	mock should receive someMessage inThisProcess.
	
	[mock should receive someMessage inAnotherProcess] should raise: SpecOfFailed
]

{ #category : #tests }
MockAcceptanceTests >> testValidationMessagesCountByAtLeast [
		
	mock someMessage.
	
	[mock should receive someMessage atLeast: 2] should raise: SpecOfFailed.
	
	mock someMessage.
	mock should receive someMessage atLeast: 2.
	mock someMessage.
	mock should receive someMessage atLeast: 2.
]

{ #category : #tests }
MockAcceptanceTests >> testValidationMessagesCountByAtLeastAtMost [

	mock someMessage.
	mock someMessage.
		
	mock should receive someMessage atLeast: 2 atMost: 3.
	
	mock someMessage.
	mock someMessage.
	
	[mock should receive someMessage atLeast: 2 atMost: 3] should raise: SpecOfFailed
]

{ #category : #tests }
MockAcceptanceTests >> testValidationMessagesCountByAtMost [

	mock someMessage.
		
	mock should receive someMessage atMost: 1.
	
	mock someMessage.
	[mock should receive someMessage atMost: 1] should raise: SpecOfFailed
]

{ #category : #tests }
MockAcceptanceTests >> testValidationMessagesCountByExactly [
		
	mock someMessage.
	mock someMessage.
	
	[mock should receive someMessage exactly: 1] should raise: SpecOfFailed.
	mock should receive someMessage exactly: 2.
	[mock should receive someMessage exactly: 3] should raise: SpecOfFailed
]

{ #category : #tests }
MockAcceptanceTests >> testValidationMessagesCountByOnce [

	mock someMessage.
	
	mock should receive someMessage once.
	
	mock someMessage.
	
	[mock should receive someMessage once] should raise: SpecOfFailed.
]

{ #category : #tests }
MockAcceptanceTests >> testValidationMessagesCountByTwice [

	mock someMessage.
	mock someMessage.
	
	mock should receive someMessage twice.
	
	mock someMessage.
	[mock should receive someMessage twice] should raise: SpecOfFailed.
]

{ #category : #tests }
MockAcceptanceTests >> testValidationOfOrderedObjectsInteraction [

	mock someMessage.
	mock someMessage2.
	mock someMessage3.
		
	[mock someMessage. mock someMessage3] should beDoneInOrder.

	[[mock someMessage2. mock someMessage] should beDoneInOrder] should raise: SpecOfFailed
]

{ #category : #tests }
MockAcceptanceTests >> testValidationOfOrderedObjectsInteractionWhenSameMessageShouldHappenTwice [

	mock someMessage.
	mock someMessage.
	mock someMessage2.
	mock someMessage3.
	mock someMessage2.
	
	[mock someMessage twice. mock someMessage3] should beDoneInOrder.	
	[[mock someMessage2 twice. mock someMessage3] should beDoneInOrder] should raise: SpecOfFailed
]

{ #category : #tests }
MockAcceptanceTests >> testValidationOfOrderedObjectsInteractionWhenSameMessagesShouldHappenAtDifferentTime [

	mock someMessage.
	mock someMessage2.
	mock someMessage.
		
	[mock someMessage. mock someMessage2. mock someMessage] should beDoneInOrder.
	[mock someMessage. mock someMessage] should beDoneInOrder.

	[[mock someMessage2. mock someMessage. mock someMessage] should beDoneInOrder] should raise: SpecOfFailed
]

{ #category : #tests }
MockAcceptanceTests >> testValidationOfUnorderedObjectsInteraction [

	mock someMessage.
	mock someMessage2.
	
	[mock someMessage2] should beDone.	
	[mock someMessage2. mock someMessage] should beDone.
	
	[[mock someMessage. mock unhappenedMessage] should beDone] should raise: SpecOfFailed.
]

{ #category : #tests }
MockAcceptanceTests >> testValidationOfUnorderedObjectsInteractionWhenSameMessageShouldHappenTwice [

	mock someMessage.
	mock someMessage2.
	mock someMessage.
		
	[mock someMessage twice. mock someMessage2] should beDone
]

{ #category : #tests }
MockAcceptanceTests >> testValidationOfUnorderedObjectsInteractionWithUsageSpecs [
	
	mock someMessage.
	mock someMessage.
	mock someMessage2.
	
	[mock someMessage2. mock someMessage] should beDone.
	[mock someMessage2. mock someMessage twice] should beDone.
	
	[[mock someMessage2. mock someMessage once] should beDone] should raise: SpecOfFailed.
]

{ #category : #tests }
MockAcceptanceTests >> testValidationReceivedMessageWhenItWasHappened [

	mock someMessage.
	
	mock should receive someMessage
]

{ #category : #tests }
MockAcceptanceTests >> testValidationReceivedMessageWhenItWasNotHappened [

	mock someMessage.
	
	mock should not receive unexpectedMessage.
	[mock should receive unexpectedMessage] should raise: SpecOfFailed
]

{ #category : #tests }
MockAcceptanceTests >> testValidationReceivedMessageWhenNoMessagesWasHappens [
	
	mock should not receive someMessage.
	[mock should receive someMessage] should raise: SpecOfFailed
]

{ #category : #tests }
MockAcceptanceTests >> testValidationReturnedValueOfRealObjectStub [

	| rect |
	rect := 0@0 corner: 2@3.
	rect stub.
	
	rect area.
	
	rect should receive area which should equal: 6
]

{ #category : #tests }
MockAcceptanceTests >> testValidationThatAnyMessageWasSentToAnyMock [

	[Any should receive anyMessage] should raise: SpecOfFailed.
	
	mock someMessage.
	
	Any should receive anyMessage
]

{ #category : #tests }
MockAcceptanceTests >> testValidationThatMessageWasNotSent [
	
	mock someMessage2.
	
	mock should not receive someMessage.
	
	mock someMessage.
	
	[mock should not receive someMessage] should raise: SpecOfFailed
]

{ #category : #tests }
MockAcceptanceTests >> testValidationThatMockReceivedAnyMessage [

	[mock should receive anyMessage] should raise: SpecOfFailed.
	
	mock someMessage.
	
	mock should receive anyMessage
]

{ #category : #tests }
MockAcceptanceTests >> testValidationThatMockReceivedAnyMessageWhenHappenedMessageHadArguments [
	 
	[mock should receive anyMessage] should raise: SpecOfFailed.
	
	mock someMessageWith: 1.
	
	mock should receive anyMessage
]

{ #category : #tests }
MockAcceptanceTests >> testValidationThatObjectIsResultOfParticularMessageSend [

	| result |
	result := mock someMessage.
	
	result should beReturnedFrom: [mock someMessage].
	result should not beReturnedFrom: [mock someMessage2].
]

{ #category : #tests }
MockAcceptanceTests >> testValidationThatObjectPropertyIsResultOfParticularMessageSend [

	| result ownerObject |
	result := mock someMessage.

	ownerObject := Array with: result.
		
	ownerObject where first should beReturnedFrom: [mock someMessage].
	ownerObject where first should not beReturnedFrom: [mock someMessage2]
]

{ #category : #tests }
MockAcceptanceTests >> testValidationThatParticularMessageWasSentToAllMocks [

	| mock2 |
	mock someMessage.
	mock2 := Mock new.
		
	[Any should receive someMessage] should raise: SpecOfFailed.

	mock2 someMessage.
	
	Any should receive someMessage	
]

{ #category : #tests }
MockAcceptanceTests >> testValidationThatParticularMessageWasSentToSetOfObjectsDefinedBySpec [

	| mock2 |
	[(Instance of: Mock) should receive someMessage] should raise: SpecOfFailed.

	mock someMessage.
	mock2 := Mock new.

	[(Instance of: Mock) should receive someMessage] should raise: SpecOfFailed.	

	mock2 someMessage.
	
	(Instance of: Mock) should receive someMessage	
]

{ #category : #tests }
MockAcceptanceTests >> testValidationThatParticularMessageWasSentToSetOfObjectsWhenNoSuchObjectsExist [

	[(Instance of: Rectangle) should receive someMessage] should raise: SpecOfFailed
]

{ #category : #tests }
MockAcceptanceTests >> testValidationThatRealObjectMessageWasNotSent [
	
	| rect |
	rect := 0@1 corner: 10@30.
	rect stub.
	
	rect should not receive width.
	
	rect area.
	
	[rect should not receive width] should raise: SpecOfFailed
]

{ #category : #tests }
MockAcceptanceTests >> testValidationThatStubbedRealObjectReceivedExpectedMessage [

	| rect |
	rect := 0@0 corner: 2@3.
	
	rect stub area willReturn: 100.
	
	rect area.
	
	rect should receive area
]

{ #category : #tests }
MockAcceptanceTests >> testValidationThatStubbedRealObjectReceivedUnexpectedMessage [

	| rect |	
	rect := 0@0 corner: 2@3.
	
	rect stub.
	
	rect area.
	
	rect should receive area
]

{ #category : #tests }
MockAcceptanceTests >> testWillCallOriginalMethodFromMessageOfRealObjectStub [

	| actual rect executed |
	rect := 0@0 corner: 2@3.
	
	rect stub area will: [executed := true]; willCallOriginalMethod.
	
	actual := rect area.
	actual should be: 6.
	executed should be: true
]

{ #category : #tests }
MockAcceptanceTests >> testWillExecuteSeveralActionsOnSingleMessageSend [

	| actual firstBlockDone secondBlockDone |
	mock stub someMessage will: [firstBlockDone := true]; will: [secondBlockDone := true]; willReturn: #result.
	
	actual := mock someMessage.
	
	actual should be: #result.
	firstBlockDone should be: true.
	secondBlockDone should be: true.
]

{ #category : #tests }
MockAcceptanceTests >> testWillLogMessage [

	(mock stub someMessageWith: Any) willLogMessage; willReturn: #result.
	
	mock someMessageWith: #arg1.
	(mock someMessageWith: #arg2) should be: #result
]

{ #category : #tests }
MockAcceptanceTests >> testWillRaiseErrorFromMessage [

	| error |
	error := Error new.
	mock stub someMessage willRaise: error.
	
	[mock someMessage] should raise: error
]

{ #category : #tests }
MockAcceptanceTests >> testWillReturnArgsBlockValueFromMessage [

	| actual |
	(mock stub someMessage: 2 and: 3) will: [:a1 :a2 | a1 + a2].
	
	actual := mock someMessage: 2 and: 3.
	
	actual should be: 5
]

{ #category : #tests }
MockAcceptanceTests >> testWillReturnExplicitValueFromMessage [

	| actual |
	mock stub someMessage willReturn: #result.
	
	actual := mock someMessage.
	
	actual should be: #result
]

{ #category : #tests }
MockAcceptanceTests >> testWillReturnNewMockWhenNoActionDefinedForExpectation [

	| actual |	
	mock stub someMessage.
	
	actual := mock someMessage.
	
	actual should beInstanceOf: MockForMessageReturn
]

{ #category : #tests }
MockAcceptanceTests >> testWillReturnNextValueFromArrayForEachCall [

	mock stub someMessage willReturnValueFrom: #(result1 result2).
	
	mock someMessage should be: #result1.
	mock someMessage should be: #result2.
	
	mock someMessage should beInstanceOf: MockForMessageReturn
]

{ #category : #tests }
MockAcceptanceTests >> testWillReturnReceiverFromMessage [

	| actual |
	mock stub someMessage willReturnYourself.
	
	actual := mock someMessage.
	
	actual should be: mock
]
