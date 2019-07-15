Class {
	#name : #MockRealObjectStubTests,
	#superclass : #TestCase,
	#category : 'Mocketry-Domain-Tests'
}

{ #category : #tests }
MockRealObjectStubTests >> testDoesNotExpectMessage [

	| actual unexpectedMessage rect |
	unexpectedMessage := MockOccurredMessage receiver: Any selector: #area.

	rect := 0@0 corner: 2@3.
	rect stub area willReturn: 1000.
		
	actual := rect stubDoesNotExpect: unexpectedMessage.
	
	actual should equal: 6
]

{ #category : #tests }
MockRealObjectStubTests >> testGlobalClassStubShouldBeRecoveredWhenCurrentMockBehaviourChanged [
	
	| currentBehaviour |
	[
		GHClassStub stub.
		GHClassStub hasGHMutation should be: true.
		currentBehaviour := MockBehaviour new.
		currentBehaviour registerObject: GHClassStub.
		MockCurrentBehaviour value becomeForward: currentBehaviour.
		
		GHClassStub hasGHMutation should be: true.

		MockCurrentBehaviour value should not be: currentBehaviour.
		GHClassStub hasGHMutation should be: false.
	] ensure: [ GHClassStub recoverFromGHMutation ]
]

{ #category : #tests }
MockRealObjectStubTests >> testGlobalClassStubShouldBeRecoveredWhenCurrentMockBehaviourReset [
	
	[
		GHClassStub stub.

		MockCurrentBehaviour value: nil.
		
		GHClassStub hasGHMutation should be: false
	
	] ensure: [ GHClassStub recoverFromGHMutation ]
	
]

{ #category : #tests }
MockRealObjectStubTests >> testGlobalClassStubShouldBeRecoveredWhenTestCompletes1 [
	
	GHClassStub stub.
	
	GHClassStub hasGHMutation should be: true
]

{ #category : #tests }
MockRealObjectStubTests >> testGlobalClassStubShouldBeRecoveredWhenTestCompletes2 [
	
	GHClassStub hasGHMutation should be: false
]

{ #category : #tests }
MockRealObjectStubTests >> testHasSameBehaviourAsMocks [

	| rect mock |
	mock := Mock new.

	rect := 0@0 corner: 2@3.
	rect stub.

	rect ghMutation mutationBehaviour should be: mock ghostBehaviour
]

{ #category : #tests }
MockRealObjectStubTests >> testShouldBe [

	| rect |
	rect := 0@0 corner: 2@3.
	rect stub.

	rect should be: rect.
	rect should not be: #wrongRect
]

{ #category : #tests }
MockRealObjectStubTests >> testShouldBeInstanceOfClass [

	| rect |
	rect := 0@0 corner: 2@3.
	rect stub.

	rect should beInstanceOf: Rectangle
]

{ #category : #tests }
MockRealObjectStubTests >> testShouldBeKindOfClass [

	| rect |
	rect := 0@0 corner: 2@3.
	rect stub.

	rect should beKindOf: Rectangle
]

{ #category : #tests }
MockRealObjectStubTests >> testShouldEqual [

	| rect |
	rect := 0@0 corner: 2@3.
	rect stub.

	rect should equal: rect.
	rect should equal: (0@0 corner: 2@3)
]

{ #category : #tests }
MockRealObjectStubTests >> testStubbingRealObjectTwice [

	| rect firstMutation secondMutation |
	rect := 0@0 corner: 2@3.
	
	rect stub area willReturn: #area.
	firstMutation := rect ghMutation.
	
	rect stub origin willReturn: #origin.
	secondMutation := rect ghMutation.

	firstMutation should be: secondMutation.
	rect area should be: #area.
	rect origin should be: #origin
]

{ #category : #tests }
MockRealObjectStubTests >> testStubbingRealObjectTwiceWhenBehaviourChanged [

	| rect firstStub secondStub |
	rect := 0@0 corner: 2@3.
	
	firstStub := rect stub.
	
	MockCurrentBehaviour value: nil.

	secondStub := rect stub.

	firstStub ghostBehaviour expectedMessages should be: secondStub ghostBehaviour expectedMessages
]

{ #category : #tests }
MockRealObjectStubTests >> testValidationReceivedMessageWhenBehaviourChanged [

	| rect |
	rect := 0@0 corner: 2@3.
	
	rect stub area willReturn: #result.
	rect area should be: #result.
	
	MockCurrentBehaviour value: nil.
	
	rect should receive area
]

{ #category : #tests }
MockRealObjectStubTests >> testValidationReceivedMessageWhenBehaviourChanged2 [

	| rect |
	rect := 0@0 corner: 2@3.
	
	rect stub area willReturn: #result.
	
	MockCurrentBehaviour value: nil.
	rect area should be: #result.
	
	rect should receive area
]

{ #category : #tests }
MockRealObjectStubTests >> testWhichPropertyShouldExpression [

	| rect |
	rect := 0@0 corner: 2@3.
	rect stub.

	rect where origin should equal: 0@0
]
