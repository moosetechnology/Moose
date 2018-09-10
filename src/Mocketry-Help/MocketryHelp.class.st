Class {
	#name : #MocketryHelp,
	#superclass : #CustomHelp,
	#category : 'Mocketry-Help'
}

{ #category : #accessing }
MocketryHelp class >> bookName [
	^ 'Mocketry'
]

{ #category : #pages }
MocketryHelp class >> captureMessageArguments [
	^ HelpTopic 
		title: 'Capture message arguments'
		contents:
'Mocketry provides suitable tool to capture arguments of messages for subsequent verification:

	mock := Mock new.
	mock someMessageWith: Arg argName.
	
	mock someMessageWith: #argValue.
	
	Arg argName should be: #argValue.

As argument spec capture plays role of any object. So it not restricts message send expectation. Capture will store all received argument values. To verify concrete argument use message #fromCall:

	Arg argName fromFirstCall should be: #value1.
	Arg argName fromLastCall should be: #value3.
	(Arg argName fromCall: 2) should be: #value2.

Short version 
		Arg argName should be: #argValue.
will signal error if there are multiple different captured values.

Also "should" expression on capture will verify that owner message send was occurred required number of times.

When argument is captured it value is stubbed. It allows you to verify subsequent message sends to captured arguments:

	mock stub someMessageWith: Arg rectangle.

	rect := 0@0 corner: 2@3.
	mock someMessageWith: rect.
	rect area.
	
	Arg rectangle should be: rect.
	Arg rectangle should receive width.

'
]

{ #category : #pages }
MocketryHelp class >> expectedActions [
	^ HelpTopic 
		title: 'Expected actions'
		contents:
'There is different kind of expected actions:

	mock := Mock new.	
	mock stub someMessage willReturn: #result.
	mock someMessage should be: #result.

	mock stub someMessage willRaise: ZeroDivide new.
	[mock someMessage] should raise: ZeroDivide.
	
	(mock stub someMessageWith: #arg) will: [#result].
	(mock someMessageWith: #arg) should be: #result.
	
	(mock stub someMessageWith: #arg1 and: #arg2) will: [:arg1 :arg2 | arg1, arg2].
	(mock someMessageWith: #arg1 and: #arg2) should equal: ''arg1arg2''.
	
	mock stub someMessage willReturnValueFrom: #(result1 result2).
	mock someMessage should be: #result1.
	mock someMessage should be: #result2'
]

{ #category : #pages }
MocketryHelp class >> expectedConditionsForMessageSends [
	^ HelpTopic 
		title: 'Expected conditions for message sends'
		contents:
'It is possible to verify arbitrary condition when expected message is going to be executed. For example:

	mock := Mock new.
	mock someMessage
		when: [flag] is: (Kind of: Boolean);
		when: [flag] is: true;
		when: [ flag ] satisfy: [ :object | true or: [ false ] ]
	
	flag := true.
	mock someMessage. "not failes"

	flag := false.
	mock someMessage "will fail immediately on call by last condition: flag should be true"
	
	flag := #flag.
	mock someMessage "will fail immediately on call by first condition: flag should be boolean"
	
Also Mocketry implements process related condition to check that message was synchronously sent (relative to test process):

	mock stub someMessage shouldBeSentInThisProcess.
	[ mock someMessage ] fork. "will fail immediately on call".
	
	mock stub someMessage shouldBeSentInAnotherProcess.
	[ mock someMessage ] fork. "will not fail".
	mock someMessage. "will fail immediately on call"'
]

{ #category : #pages }
MocketryHelp class >> messageSendUsageRules [
	^ HelpTopic 
		title: 'Message send usage rules'
		contents:
'It is possible to specify how much times expectation can be used:
	
	mock := Mock new.	
	mock stub someMesage willReturn: #default.
	mock stub someMessage willReturn: 300; use: 3.
	mock stub someMessage willReturn: 200; useTwice.
	mock stub someMesage willReturn: 100 useOnce.	
	"last defined expectation is more preferred then previously defined"
	
	mock someMessage should be: 100.
	
	mock someMessage should be: 200.
	mock someMessage should be: 200.
	
	mock someMessage should be: 300.
	mock someMessage should be: 300.
	mock someMessage should be: 300.
	
	mock someMessage should be: #default
'
]

{ #category : #pages }
MocketryHelp class >> mockCreation [
	^ HelpTopic 
		title: 'Mock creation'
		contents:
'To create mock just use #new
	yourMock := Mock new.
	
Mocketry not requires any special context variables for this.

Also Mocketry implements auto naming logic to retrive variable names from test context. Inside test yourMock will be shown as "a Mock(yourMock)" (in debugger). 

But if you need special name you can specify it:
	Mock named: ''yourMock''
	
You can look at it livelly in MockTests.

Also there is way to get multiple mocks at once:
	[ :mockA :mockB | your code here ] runWithMocks
'
]

{ #category : #pages }
MocketryHelp class >> overview [
	^ HelpTopic 
		title: 'Overview'
		contents:
'Mocketry is mock objects framework. It provides simplest way to stub any message to any object and to verify any occurred behaviour'
]

{ #category : #accessing }
MocketryHelp class >> pages [
	^ #(overview 
		#mockCreation
		stubMessageSends
		stubMessagesWithArguments
		expectedActions 
		expectedConditionsForMessageSends		
		messageSendUsageRules
		unexpectedMessages
		stubGroupOfMessageSends
		
		verifyMessageSends
		verifyMessagesWithArguments
		captureMessageArguments
		verifyMessageSendsCount
		verifyMessageSendResult
		verifyGroupOfMessageSends
		verifyAllExpectations
		
		)
]

{ #category : #pages }
MocketryHelp class >> stubGroupOfMessageSends [
	^ HelpTopic 
		title: 'Stub group of message sends'
		contents:
'There is way to stub multiple message sends at once:

	mock := Mock new.
	rect := 0@0 corner: 2@3.
	rect stub.
	
	[ mock someMessage willReturn: 10.
	rect width willReturn: 1000 ] should expect.

	mock someMessage should be: 10.
	rect area should be: 3000.

Inside "should expect" block you don''t need to send extra #stub message to objects'
]

{ #category : #pages }
MocketryHelp class >> stubMessageSends [
	^ HelpTopic 
		title: 'Stub messages sends'
		contents: 
'To stub message send just send message #stub to object and following message will create expectation:

	mock := Mock new.
	
	mock stub someMessage willReturn: 100.
	
	mock someMessage should be: 100.
	
You can stub any objects. It is not only about mocks:

	rect := 0@0 corner: 2@3.
	rect stub width willReturn: 1000.
	
	rect area should be: 3000 "are = width * height"
	
And you can do this with globals too:

	DateAndTime stub now willReturn: #constantValue.
	
	DateAndTime now should be: #constantValue.
	
But you should be carefull with globals. Don''t try 

	Array stub new.

It will crash image. 
And if you stub global from workspace it is your responsibility to recover it from stub behaviour. Do it by this:

	DateAndTime recoverFromGHMutation.

In case when you stub global inside test Mocketry automatically recovers all global stubs when test completes.

Also with Mocketry you can define expectations for set of objects. For example you can stub message to ANY object:

	Any stub width willReturn: 100.

	Mock new width should be: 100.
	rect := 0@0 corner: 2@3.
	rect stub. "it activates message intercection for real object. Without it following sentence will not work"
	rect area should be: 300.

Or you can stub ANY message to particular object:

	mock := Mock new.
	mock stub anyMessage willreturn:: 100.
	
	mock someMessage should be: 100.
	mock someMessage2 should be: 100.
		
And both variants are supported:

	Any stub anyMessage willReturn: 100.
	Mock new someMessage should be: 100.
	
	rect := 0@0 corner: 2@3.	
	rect stub.
	
	rect area should be: 100.
	rect width should be: 100.
	
Any class is specific object spec which means "any" object. You can uses any kind of specs:

	(Kind of: Rectangle) stub width willReturn: 100.
	
	rect := 0@0 corner: 2@3.
	rect stub.	
	rect area should be: 300.
	
	rect2 := 0@0 corner: 4@5.
	rect2 stub.	
	rect2 area should be: 500'
]

{ #category : #pages }
MocketryHelp class >> stubMessagesWithArguments [
	^ HelpTopic 
		title: 'Stub messages with arguments'
		contents:
'In place of message arguments you can use expected objects itself. Or you can put specifications for expected arguments:

	mock stub messageWith: arg1 and: arg2
	mock stub messageWith: Any and: arg2
	mock stub messageWith: [:arg | true]
	mock stub messageWith: (Kind of: String) and: arg2
	mock stub messageWith: (Instance of: Float) & (Satisfying for: [:arg | arg > 10]).
	
Last defined expectation has more priority than previous one. It allows you to define default expectations in setUp method and override it in particular tests. Following example shows it:
	
	mock := Mock new.
	(mock stub messageWith: (Instance of: SmallInteger)) willReturn: #anyInt.
	(mock stub messageWith: (Kind of: String)) willReturn: #anyString.
	(mock stub messageWith: 10) willReturn: #ten.

	(mock messageWith: 10) should be: #ten.
	(mock messageWith: 20) should be: #anyInt.
	(mock messageWith: ''test'' should be: #anyString'
]

{ #category : #pages }
MocketryHelp class >> unexpectedMessages [
	^ HelpTopic 
		title: 'Unexpected messages. Automocks'
		contents: 
'Mock returns another special mock for unexpected messages (when no expectation is defined for received message):

	mock := Mock new.
	
	automock := mock someMessage.
	
	automock should beInstanceOf: MockForMessageReturn.
	
And any message to this mock will produce another automocks. 
It means that your tests will not fail if you will not define expectations for your mocks. 
It allows put only required detailes inside your tests which really make sense for tested aspect of functionality.

Also to improve this idea automock try to play role of false in boolean expressions. 

	mock := Mock new.
	returnedMock := mock someMessage.
	
	result := returnedMock ifFalse: [ #falseBranch ] ifTrue: [ #trueBranch ].
	
	result should be: #falseBranch.
	returnedMock should be: false

And play zero in arithmetic

	mock := Mock new.
	returnedMock := mock someMessage.
	
	result := 1 + returnedMock.
	result should equal: 1.
	returnedMock should equal: 0
'
]

{ #category : #pages }
MocketryHelp class >> verifyAllExpectations [
	^ HelpTopic 
		title: 'Verify all expectations'
		contents:
'There is way how to verify that all defined expectations were occurred

	mock1 := Mock new.
	mock2 := Mock new.
	[mock1 someMessage. mock2 someMessage2]
	   should lenient satisfy:
	[ mock2 someMessage2.
	mock1 someMessage willReturn: ''some''].

#lenient means that we dont care about order in which expected messages were happened.

	mock1 := Mock new.
	mock2 := Mock new.
	[mock1 someMessage. mock2 someMessage2]
	   should strict satisfy:
	[ mock1 someMessage willReturn: ''some''.
	mock2 someMessage2].

#strict means that we want expected messages were happened in same order in which they were defined.
'
]

{ #category : #pages }
MocketryHelp class >> verifyGroupOfMessageSends [
	^ HelpTopic 
		title: 'Verify group of message sends'
		contents:
'There is way to verify group of message sends at once:

	mock := Mock new.
	rect := 0@0 corner: 2@3.
	rect stub.
	mock someMessage.
	rect area.
		
	[ rect width.
	mock someMessage ] should beDone.

	[ mock someMessage.
	rect width ] should beDoneInOrder.

#beDone don''t care about order of message sends.
#beDoneInOrder verifies that messages were set in same order as they defined inside given block'
]

{ #category : #pages }
MocketryHelp class >> verifyMessageSendResult [
	^ HelpTopic 
		title: 'Verify message send result'
		contents:
'There are two ways how to verify result of occurred message:

First you can continue "should receive" expression with "which should" clause to validate actual returned value:

	rect := 0@0 corner: 2@3.
	rect stub.
	
	rect area.
	
	rect should receive area which should equal: 6.
	rect should receive width which should beKindOf: Number 
	
And you can validate sender message of any object:

	mock := Mock new.
	
	result := mock someMessage.
	
	result should beReturnedFrom: [ mock someMessage ].
'
]

{ #category : #pages }
MocketryHelp class >> verifyMessageSends [
	^ HelpTopic 
		title: 'Verify messages sends'
		contents:
'With Mocketry you can check that particular object received some message. Use "should receive" expression for this:

	mock := Mock new.
	mock someMessage.
	
	mock should receive someMessage.
	mock should not receive anotherMessage
	
You can verify message to any objects. It is not only about mocks:

	rect := 0@0 corner: 2@3.
	rect stub "it should be here to enable message interception"
	rect area 
	
	rect should receive width. "area = width * height"
	
And you can do this with globals too:

	DateAndTime stub.
	
	DateAndTime midnight.
	
	DateAndTime should receive now. "inside midnight #now is called"
	
But you should be carefull with globals. Look at page #stubMessageSends.

Also with Mocketry you can verify that message was sent to set of objects. 
For example you can verify that message was sent to ANY object:

	mock := Mock new.
	rect := 0@0 corner: 2@3.
	rect stub. 
	
	mock width.
	rect area.
	
	Any should receive width. "it will check that mock and rect received message #width"
	Any should receive area "it will fail because mock not received #area message".

Also you can verify that ANY message was sent to particular object:

	mock := Mock new.

	mock someMessage should be: 100.

	mock should receive anyMessage.
		
And both variants are supported:

	mock := Mock new.
	rect := 0@0 corner: 2@3.	
	rect stub.
	
	mock someMessage.
	
	Any should receive anyMessage. "will fail because rect not received any message".
	
	rect width.
	
	Any should receive anyMessage. "will not fail because both objects received at least one message"
	
Any class is specific object spec which means "any" object. You can uses any kind of specs to verify message send for set of objects:
	
	rect := 0@0 corner: 2@3.
	rect stub.	
	rect area.
	
	rect2 := 0@0 corner: 4@5.
	rect2 width.	
		
	(Kind of: Rectangle) should receive width. "will not fail because both rect''s received message #width"
	(Kind of: Rectangle) should receive area "will fail because rect2 not received message #area"

	mock := Mock new.
	(Kind of: Rectangle) should receive width. "will not fail because mock is not kind of Rectangle"
'
]

{ #category : #pages }
MocketryHelp class >> verifyMessageSendsCount [
	^ HelpTopic 
		title: 'Verify message sends count'
		contents:
'Mocketry allows to verify how many times object received particular message:

	mock := Mock new.
	
	mock someMessage.
	mock should receive someMessage once.
	
	mock someMessage.
	mock should receive someMessage twice.
	
	mock someMessage.
	mock should receive someMessage exactly: 3.
	mock should receive someMessage atLeast: 2.
	mock should receive someMessage atMost: 3.
	mock should receive someMessage atLeast: 1 atMost: 5.

Same works to verify that set of objects received particular message expected number of times:

	mock := Mock new.
	mock2 := Mock new.
		
	mock someMessage; someMessage.
	mock2 someMessage.
	
	Any should receive someMessage twice. "will fail because mock2 received #someMessage only once"
	
	mock2 someMessage.
	Any should receive someMessage twice. "will not fail because both mocks received #someMessage twice"
'
]

{ #category : #pages }
MocketryHelp class >> verifyMessagesWithArguments [
	^ HelpTopic 
		title: 'Verify messages with arguments'
		contents:
'In place of message arguments you can use expected objects itself. Or you can put specifications for expected arguments:

	mock := Mock new.
	
	(mock messageWith: 10) should be: #ten.
	(mock messageWith: ''test'' should be: #anyString.
	
	mock should receive messageWith: 10.
	mock should receive messageWith: (Instance of: SmallInteger).
	mock should receive messageWith: ''test''.
	mock should receive messageWith: (Kind of: String).
	mock should receive messageWith: [:arg | arg isNumber].
'
]
