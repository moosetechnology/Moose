Class {
	#name : #MockOccurredMessageTests,
	#superclass : #TestCase,
	#category : 'Mocketry-Domain-Tests'
}

{ #category : #tests }
MockOccurredMessageTests >> testExtractingRaisedExceptionResultFromBlock [

	| message error |
	message := MockOccurredMessage new.
	error := Error new.
	[message extractResultFrom: [ error signal ]] should raise: error.
	
	message where result should beInstanceOf: MockOccurredExceptionSignal.
	message where result exception should be: error
]

{ #category : #tests }
MockOccurredMessageTests >> testExtractingRaisedExceptionResultWhenHaltRaised [

	| message error |
	message := MockOccurredMessage new.
	error := Error new.
	
	[message extractResultFrom: [ self halt ]] should raise: Halt.

	message where result should be: nil
]

{ #category : #tests }
MockOccurredMessageTests >> testExtractingReturnedValueResultFromBlock [

	| message actual |
	message := MockOccurredMessage new.
	
	actual := message extractResultFrom: [ #result ].
	
	message where result should beInstanceOf: MockOccurredValueReturn.
	message where result value should be: #result.
	actual should be: #result
]

{ #category : #tests }
MockOccurredMessageTests >> testHasProcessByDefault [

	| message |
	message := MockOccurredMessage new.
	
	message where process should be: Processor activeProcess
]

{ #category : #tests }
MockOccurredMessageTests >> testNotEqualToAnotherMessageWithSameParameters [

	| message anotherMessage |
	message := MockOccurredMessage receiver: #receiver selector: #selector.
	
	anotherMessage := MockOccurredMessage receiver: #receiver selector: #selector.
	
	(message = anotherMessage) should be: false description: 'Occurred messages cant be equal!'
]

{ #category : #tests }
MockOccurredMessageTests >> testPrinting [

	| message |
	message := MockOccurredMessage receiver: #receiver selector: #messageWith:and: arguments: #(arg1 arg2).
	
	message printString should equal: '#receiver messageWith: #arg1 and: #arg2'
]

{ #category : #tests }
MockOccurredMessageTests >> testPrintingWhenArgumentIsMock [

	| message |
	message := MockOccurredMessage receiver: #receiver selector: #messageWith: arguments: {Mock named: 'testMock'}.
	
	message printString should equal: '#receiver messageWith: a Mock(testMock)'
]

{ #category : #tests }
MockOccurredMessageTests >> testPrintingWhenDefaultMockReturn [

	| message |
	message := MockOccurredMessage receiver: #receiver selector: #selector.
	message result: (MockForMessageReturn from: message) asOccurredMessageResult.
	
	message printString should be beginsWith: '#receiver selector returned default mock'
]

{ #category : #tests }
MockOccurredMessageTests >> testPrintingWhenDefaultReturnedMockWasConvertedToBoolean [

	| message |
	message := MockOccurredMessage receiver: #receiver selector: #selector.
	message result: (MockOccurredDefaultReturn with: true).
	
	message printString should be beginsWith: '#receiver selector returned true'
]

{ #category : #tests }
MockOccurredMessageTests >> testPrintingWhenRaisedExceptionResultExists [

	| message |
	message := MockOccurredMessage receiver: #receiver selector: #messageWith:and: arguments: #(arg1 arg2).
	message result: (MockOccurredExceptionSignal exception: (Error new messageText: 'test error')).
	
	message printString should equal: '#receiver messageWith: #arg1 and: #arg2 raised Error: test error'
]

{ #category : #tests }
MockOccurredMessageTests >> testPrintingWhenReceiverIsMock [

	| message |
	message := MockOccurredMessage receiver: (Mock named: 'testMock') selector: #messageWith:and: arguments: #(arg1 arg2).
	
	message printString should equal: 'a Mock(testMock) messageWith: #arg1 and: #arg2'
]

{ #category : #tests }
MockOccurredMessageTests >> testPrintingWhenReturnedMockResultExists [

	| message |
	message := MockOccurredMessage receiver: #receiver selector: #messageWith:and: arguments: #(arg1 arg2).
	message result: (MockOccurredValueReturn value: (Mock named: 'testMock')).
	
	message printString should equal: '#receiver messageWith: #arg1 and: #arg2 returned a Mock(testMock)'
]

{ #category : #tests }
MockOccurredMessageTests >> testPrintingWhenReturnedValueResultExists [

	| message |
	message := MockOccurredMessage receiver: #receiver selector: #messageWith:and: arguments: #(arg1 arg2).
	message result: (MockOccurredValueReturn value: #result).
	
	message printString should equal: '#receiver messageWith: #arg1 and: #arg2 returned #result'
]

{ #category : #tests }
MockOccurredMessageTests >> testSetUpUnexpectedResultWhenReceiverIsMock [

	| message mock returnedMock |
	mock := Mock new.
	message := MockOccurredMessage receiver: mock selector: #selector.
	
	returnedMock := message setUpUnexpectedResult.
	
	message where result should beInstanceOf: MockOccurredDefaultReturn.
	message where result returnedMock should be: returnedMock.
	returnedMock should beInstanceOf: MockForMessageReturn
]

{ #category : #tests }
MockOccurredMessageTests >> testSetUpUnexpectedResultWhenReceiverIsNormalObject [

	| message actual |
	message := MockOccurredMessage receiver: (0@0 corner: 2@3) selector: #area.
	
	actual := message setUpUnexpectedResult.
	
	actual should equal: 6.
	message where result should beInstanceOf: MockOccurredValueReturn.
	message where result value should be: 6
]

{ #category : #tests }
MockOccurredMessageTests >> testSetUpUnexpectedResultWhenReceiverIsRealObjectStub [

	| message actual rect |
	rect := 0@0 corner: 2@3.
	rect stub.
	
	message := MockOccurredMessage receiver: rect selector: #area.
	
	actual := message setUpUnexpectedResult.
	
	actual should equal: 6.
	message where result should beInstanceOf: MockOccurredValueReturn.
	message where result value should be: 6
]

{ #category : #tests }
MockOccurredMessageTests >> testWasReturnValueWhichSatisfiedSpec [

	| message error |
	message := MockOccurredMessage new.
	message result: 1 asOccurredMessageResult.
	
	message should be hasReturnedValueLike: 1.
	message should be hasReturnedValueLike: (Kind of: Number).
	
	error := Error new.
	message result: (MockOccurredExceptionSignal exception: error).
	message should not be hasReturnedValueLike: error.
]
