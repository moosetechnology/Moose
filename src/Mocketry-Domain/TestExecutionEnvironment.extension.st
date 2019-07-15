Extension { #name : #TestExecutionEnvironment }

{ #category : #'*Mocketry-Domain' }
TestExecutionEnvironment >> allowsForkedProcessInheritMocks [

	^true
]

{ #category : #'*Mocketry-Domain' }
TestExecutionEnvironment >> createMockBehaviour [
	| behaviour |
	forkedProcesses add: MockCleaningProcessHook instance.
	
	behaviour := super createMockBehaviour.
	behaviour ownerTestCase: testCase.
	^behaviour
]

{ #category : #'*Mocketry-Domain' }
TestExecutionEnvironment >> currentMetaLevelForMocks [
	^GHMetaLevel empty
]

{ #category : #'*Mocketry-Domain' }
TestExecutionEnvironment >> isMockBehaviourActive: aMockBehaviour [
	^(super isMockBehaviourActive: aMockBehaviour)
		and: [ aMockBehaviour ownerTestCase == testCase 
			and: [ aMockBehaviour testSelector == testCase selector ] ]
]

{ #category : #'*Mocketry-Domain' }
TestExecutionEnvironment >> setUpMockNameFor: aMock inContextOf: ownerProcess [
	| testContext currentReceiver |
	testContext := Processor activeProcess == ownerProcess 
		ifTrue: [ thisContext ] ifFalse: [ownerProcess suspendedContext].
		
	[testContext isNil or: [ testContext receiver ghostClass isTestCase]] whileFalse: [ testContext := testContext sender ].
	
	[testContext notNil and: [testContext receiver ghostClass isTestCase]] whileTrue: [ 
		currentReceiver := testContext receiver.
		currentReceiver class allInstVarNames do: [ :each | 
			(currentReceiver instVarNamed: each) == aMock ifTrue: [ ^aMock mockName: each ]].		
		testContext tempNames do: [ :each  |
			(testContext tempNamed: each) == aMock ifTrue: [ ^aMock mockName: each ]].
		
		testContext := testContext sender
	]
]
