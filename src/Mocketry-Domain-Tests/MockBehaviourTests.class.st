Class {
	#name : #MockBehaviourTests,
	#superclass : #TestCase,
	#instVars : [
		'behaviour'
	],
	#category : 'Mocketry-Domain-Tests'
}

{ #category : #running }
MockBehaviourTests >> setUp [
	super setUp.
	
	MockCurrentBehaviour value: nil.	
	behaviour := MockBehaviour new.
	
]

{ #category : #running }
MockBehaviourTests >> tearDown [
		
	MockCurrentBehaviour value: nil.	
	
	super tearDown
]

{ #category : #tests }
MockBehaviourTests >> testChangingPlayerRoleToTeacher [

	behaviour teachMocks.
	
	behaviour where mockRole should be: MockTeacher default.
	
	
]

{ #category : #tests }
MockBehaviourTests >> testChangingTeacherRoleToPlayer [

	behaviour teachMocks.
	
	behaviour replayMocks.
	
	behaviour where mockRole should be: MockPlayer default.
	
	
]

{ #category : #tests }
MockBehaviourTests >> testCreationHelperMock [

	| helperMock helperBehaviour |
	behaviour ownerEnvironment: #originalEnv.
	behaviour expectedMessages: #existedExpectations.
	
	helperMock := behaviour createHelperMockAs: #helperMockRole.
	
	helperMock should beInstanceOf: MockHelper.
	helperMock mockName should equal: #helperMockRole printString.
	
	helperBehaviour := helperMock ghostBehaviour.
	helperBehaviour should not be: behaviour.
	helperBehaviour where ownerEnvironment should be: #originalEnv.
	helperBehaviour where expectedMessages should be: #existedExpectations.
	helperBehaviour where mockRole should be: #helperMockRole.
	
	
]

{ #category : #tests }
MockBehaviourTests >> testCurrentBehaviourCleaning1PrepareGarbage [

	| actual |
	actual := MockCurrentBehaviour value.
	
	actual testSelector should be: testSelector
]

{ #category : #tests }
MockBehaviourTests >> testCurrentBehaviourCleaning2PreviousTestGarbageRemoved [

	| actual |
	actual := MockCurrentBehaviour value.
	
	actual testSelector should be: testSelector
]

{ #category : #tests }
MockBehaviourTests >> testCurrentBehaviourCleaning3PrepareWithGarbageCollect [

	| actual |
	actual := MockCurrentBehaviour value.
	Smalltalk garbageCollect.
	
	actual testSelector should be: testSelector
]

{ #category : #tests }
MockBehaviourTests >> testCurrentBehaviourCleaning4PreviousTestGarbageRemoved [

	| actual |
	actual := MockCurrentBehaviour value.
	
	actual testSelector should be: testSelector
]

{ #category : #tests }
MockBehaviourTests >> testCurrentBehaviourDuringTestWhenNoOneInstalled [

	| actual |
	MockCurrentBehaviour value: nil.	
	actual := MockCurrentBehaviour value.
	
	actual should beInstanceOf: MockBehaviour.
	actual where ownerTestCase should be: self.
	actual where testSelector should be: testSelector.
	actual where ownerProcess should be: Processor activeProcess
]

{ #category : #tests }
MockBehaviourTests >> testCurrentBehaviourShouldBeChangedWhenEnvironmentChanged [

	| behaviour2 currentEnv newEnv |
	currentEnv := TestExecutionEnvironment new.
	currentEnv testCase: self.

	currentEnv beActiveDuring: [ behaviour := MockCurrentBehaviour value].
	behaviour where ownerEnvironment should be: currentEnv.

	newEnv := TestExecutionEnvironment new.
	newEnv testCase: self.
	
	newEnv beActiveDuring: [ 
		"here env change should be detected"
		behaviour2 := MockCurrentBehaviour value].
	behaviour2 where ownerEnvironment should be: newEnv.
	behaviour2 should not be: behaviour
]

{ #category : #tests }
MockBehaviourTests >> testCurrentBehaviourShouldBeChangedWhenTestChangedDuringSingleTestCaseRun [

	| behaviour2 currentEnv |
	currentEnv := TestExecutionEnvironment new.
	currentEnv testCase: (self class selector: #test1) .

	currentEnv beActiveDuring: [ behaviour := MockCurrentBehaviour value].
	behaviour where ownerEnvironment should be: currentEnv.

	currentEnv testCase setTestSelector: #newTest.
	
	currentEnv beActiveDuring: [ 
		"here env change should be detected"
		behaviour2 := MockCurrentBehaviour value].
	behaviour2 where ownerEnvironment should be: currentEnv.
	behaviour2 should not be: behaviour
]

{ #category : #tests }
MockBehaviourTests >> testCurrentBehaviourShouldBeInheritableByForkedProcesses [

	| fromFork currentBehaviour |
	
	currentBehaviour := MockCurrentBehaviour value.
	currentBehaviour should not be: nil.

	[ fromFork := MockCurrentBehaviour value ] fork.
	20 milliSeconds wait.

	fromFork should be: currentBehaviour
]

{ #category : #tests }
MockBehaviourTests >> testCurrentBehaviourShouldNotBeInheritedByForkedProcessFromDefaultExecutionEnvironment [

	| fromFork currentBehaviour |
	
	[DefaultExecutionEnvironment beActive.
	currentBehaviour := MockCurrentBehaviour value.

	[ fromFork := MockCurrentBehaviour value ] fork] fork.

	50 milliSeconds wait.
	fromFork should not be: currentBehaviour
]

{ #category : #tests }
MockBehaviourTests >> testCurrentBehaviourShouldNotChangeInsideSingleTest [

	| behaviour2  |
	
	behaviour := MockCurrentBehaviour value.
	
	behaviour2 := MockCurrentBehaviour value.

	behaviour2 should be: behaviour
]

{ #category : #tests }
MockBehaviourTests >> testCurrentBehaviourWhenDefaultEnvironment [

	| behaviour2 defaultEnv |
	[DefaultExecutionEnvironment beActive.	
	behaviour := MockCurrentBehaviour value.
	behaviour should not be: nil.
	behaviour where ownerEnvironment should be: DefaultExecutionEnvironment instance.
	
	behaviour2 := MockCurrentBehaviour value.
	behaviour2 should not be: nil.
	behaviour2 where ownerEnvironment should be: DefaultExecutionEnvironment instance.

	behaviour2 should be: behaviour] fork.
	30 milliSeconds wait.
	
]

{ #category : #tests }
MockBehaviourTests >> testCurrentMetaLevelWhenThereIsNoTestForCurrentEnvironment [

	| metaLevel |

	[DefaultExecutionEnvironment beActive.
	metaLevel := behaviour currentMetaLevel] fork.
	20 milliSeconds wait.
	
	metaLevel should be: GHMetaLevel standard
]

{ #category : #tests }
MockBehaviourTests >> testCurrentMetaLevelWhenThereIsTestForCurrentEnvironment [

	| metaLevel env |
	metaLevel := behaviour currentMetaLevel.
	
	metaLevel should be: GHMetaLevel empty
]

{ #category : #tests }
MockBehaviourTests >> testHasPlayerRoleByDefault [

	behaviour where mockRole should be: MockPlayer default 
]
