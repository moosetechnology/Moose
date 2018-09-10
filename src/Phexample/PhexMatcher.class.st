"
A PhexMatcher is the sort of thing that works out if your example behaves properly or not. Most of the magic happens in expect:using:. 

Please notice that = works unlike in most classes. Therefore, do not store me in a collection!

If you wish to forward to another 'should' method call, the state of this matcher
would be lost. Instead, call either expect*, which works fine, or, if nothing else works,
use self should:. Note that this is much slower and leads to messier stack traces than 
calling expect

Instance Variables
	state:		the items matched so far
	value:		

state
	- xxxxx

value
	- xxxxx

"
Class {
	#name : #PhexMatcher,
	#superclass : #SpecOfShouldExpression,
	#instVars : [
		'state'
	],
	#category : #'Phexample-Core'
}

{ #category : #initialization }
PhexMatcher class >> initialize [
	self beCurrent
]

{ #category : #documentation }
PhexMatcher class >> rewriteRules [
	"Use this TreeRewriter to rewrite existing SUnit tests to Phexample.
	To run the rewrite rules open the following menu:
		Classlist -> refactor -> rewrite code.
	Copy paste the following code in and save it to execute the rewrite rules.
	"
	^RBParseTreeRewriter new
		replace: 'self assert: [ `@expression ]' with: 'self assert: `@expression';
		replace: 'self deny: `@expression' with: 'self assert: `@expression not';
		replace: 'self assert: `@value = `@expected' with: '`@value should equal: `@expected';
		replace: 'self assert: `@value ~= `@expected' with: '`@value should not equal: `@expected';
		replace: 'self assert: `@value > `@expected' with: '`@value should > `@expected';
		replace: 'self assert: `@value < `@expected' with: '`@value should < `@expected';
		replace: 'self assert: `@value >= `@expected' with: '`@value should >= `@expected';
		replace: 'self assert: `@value <= `@expected' with: '`@value should <= `@expected';
		replace: 'self assert: (`@value isKindOf: `@type)' with: '`@value should beKindOf: `@type';
		replace: 'self assert: `@expression isNil' with: '`@expression should be isNil';
		replace: 'self assert: `@expression notNil' with: '`@expression should be notNil';
		replace: 'self assert: `@expression `test not' with: '`@expression should not be `test'
			when: [:node | node arguments first receiver selector matchesRegex: '(is|has|not).+|atEnd' ];
		replace: 'self assert: `@expression `test' with: '`@expression should be `test'
			when: [:node | node arguments first selector matchesRegex: '(is|has|not).+|atEnd' ];
		replace: 'self assert: (`@collection includes: `@element) not' with: '`@collection should not be includes: `@element';
		replace: 'self assert: (`@collection includes: `@element)' with: '`@collection should be includes: `@element';
		yourself.
	

]

{ #category : #creation }
PhexMatcher class >> with: anObject [ 
	^ self new setValue: anObject
]

{ #category : #creation }
PhexMatcher class >> with: anObject state: aState [
	^ self new setValue: anObject;
		 state: aState;
		 yourself
]

{ #category : #expecting }
PhexMatcher >> < expected [
	self beLessThan: expected
]

{ #category : #expecting }
PhexMatcher >> <= expected [
	self beLessOrEqualThan: expected
]

{ #category : #expecting }
PhexMatcher >> > expected [
	^self beGreaterThan: expected
]

{ #category : #expecting }
PhexMatcher >> >= expected [
	^self beGreaterOrEqualThan: expected
]

{ #category : #expecting }
PhexMatcher >> beCloseTo: expected [
	^ self expect: expected using: #closeTo:
]

{ #category : #'expecting-boolean' }
PhexMatcher >> beFalse [
	^self be: false
]

{ #category : #expecting }
PhexMatcher >> beSameAs: expected [
	^ self be: expected
]

{ #category : #'expecting-boolean' }
PhexMatcher >> beTrue [
	^self be: true
]

{ #category : #'expecting-change' }
PhexMatcher >> change: aBlock [ 
	| before after |
	before := aBlock value.
	receiver value.
	after := aBlock value.
	before should not equal: after.	
]

{ #category : #'expecting-change' }
PhexMatcher >> change: aBlock from: before to: after [
	(self should: aBlock value) = before.
	receiver value.
	(self should: aBlock value)  = after.
]

{ #category : #'TDD todos' }
PhexMatcher >> do: aDescription [
	"TODO"
	Error signal: aDescription
]

{ #category : #'expecting-collections' }
PhexMatcher >> equalIgnoringOrder: anotherCollection [
	self expect: [ receiver sorted = anotherCollection sorted] 
		describeShould:  ['Expected <1p> to equal <2p> ignoring order, but didn''t.' 
				expandMacrosWith: receiver 
				with: anotherCollection ]  
		describeShouldNot: ['Expected <1p> to not equal <2p> ignoring order, but did.'
			 	expandMacrosWith: receiver
				with: anotherCollection ]
]

{ #category : #private }
PhexMatcher >> expect: aBlock describeShould: shouldBlock describeShouldNot: shouldNotBlock [
	self isShould ifTrue: [
		aBlock value ifFalse: [TestFailure signal: shouldBlock value].
		^nil ].
	self isShouldNot ifTrue: [
		aBlock value ifTrue: [TestFailure signal: shouldNotBlock value].
		^nil ].
	self error: 'illegal state ', state asString
]

{ #category : #private }
PhexMatcher >> expect: expected using: aSymbol [
	^self expect: [ receiver perform: aSymbol with: expected ]
  		describeShould: [ ('expected <1p> but got <2p> (using <3s>)'
								expandMacrosWith: expected
								with: receiver
								with: aSymbol) ]
  		describeShouldNot: [ ('expected not to get <1p> but got <2p> (using <3s>)'
								expandMacrosWith: expected
								with: receiver
								with: aSymbol) ]

]

{ #category : #private }
PhexMatcher >> expectSameHash: expected [
	receiver hash = expected hash ifFalse: [
		TestFailure signal: ('expected same hash for <1p> and <2p> (using hash implied by =)'
			expandMacrosWith: receiver
			with: expected) ].
	^nil
]

{ #category : #private }
PhexMatcher >> expectedUnknownMessageToReturn: expected [ 
	state := state copyWithout: #be.
	^self expect: [ receiver = expected ]
		describeShould: [ 'expected #<1s> to be <2p>' 
				expandMacrosWith: self findNameOfUnknownMessage
				with: expected ]
		describeShouldNot: [ 'did not expect #<1s> to be <2p>' 
				expandMacrosWith: self findNameOfUnknownMessage
				with: expected ]
	
]

{ #category : #'expecting-boolean' }
PhexMatcher >> false [
	 ^self expectedUnknownMessageToReturn: false
]

{ #category : #private }
PhexMatcher >> findNameOfUnknownMessage [
	"	1. walk up the stack until we are outside of this instance.
		2. collect all sent message from bytecode up to program counter.
		3. drop messages until #should and return previous. "
	| frame scanner sent |
	frame := thisContext.
	[	frame := frame sender. 
		frame receiver == self ] whileTrue.
	scanner := InstructionStream on: frame method.
	sent := Stack new.
	scanner scanFor: [ :bytecode | 
		sent push: scanner selectorToSendOrSelf.
		(frame pc - 1) <= scanner pc ].
	[	sent isEmpty ifTrue: [ ^'<unknown>' ].
		sent pop = #should ] whileFalse.
	sent top isSymbol ifFalse: [ ^'<unknown>' ].
	^sent top
]

{ #category : #'TDD todos' }
PhexMatcher >> implement: aDescription [
	"TODO"
	Error signal: aDescription
]

{ #category : #'TDD todos' }
PhexMatcher >> implemented [
	"TODO"
	Error signal.
]

{ #category : #private }
PhexMatcher >> initialize [ 
	super initialize.
	state := #()
]

{ #category : #private }
PhexMatcher >> isShould [
	^state = #() or: [state = #(be)]
]

{ #category : #private }
PhexMatcher >> isShouldNot [
	^state = #(not) or: [state = #(not be)]
]

{ #category : #'expecting-boolean' }
PhexMatcher >> nil [
	^self be: nil
]

{ #category : #expecting }
PhexMatcher >> not [
	super not.
	state := state copyWith: #not
]

{ #category : #'expecting-performance' }
PhexMatcher >> runWithin: aDuration [ 
	^ self
		expect: [[receiver value.
			true]
				valueWithin: aDuration
				onTimeout: [false]]
		describeShould: ['expected to run within <1p> but took longer' expandMacrosWith: aDuration]
		describeShouldNot: ['expected to take longer then <1p> but was faster' expandMacrosWith: aDuration]
]

{ #category : #private }
PhexMatcher >> setValue: anObject [
	receiver := anObject 
]

{ #category : #private }
PhexMatcher >> should: anObject [
	"If you wish to forward to another 'should method call, the state of this matcher
	 would be lost. Instead, call either expect*, which works fine, or, if nothing else works,
	use self should:. Note that this is much slower and leads to messier stack traces than 
	calling expect*."
	^ PhexMatcher with: anObject state: state copy
]

{ #category : #'expecting-error' }
PhexMatcher >> signal: errorClass [ 
	self raise: errorClass
]

{ #category : #'expecting-error' }
PhexMatcher >> signal: errorClass withMessageText: message [

	receiver on: Exception do: [ :ex | 
		(self should: ex) beKindOf: errorClass.
		message isBlock 
			ifTrue: [ message value: ex messageText ]
			ifFalse: [ (self should: ex messageText) = message ].
		^self].
	self expect: false
		 describeShould: [ 'Should raise <1p> but was none' expandMacrosWith: errorClass]
		 describeShouldNot:  [ 'Should not raise <1p> but did' expandMacrosWith: errorClass].
]

{ #category : #accessing }
PhexMatcher >> state [
	^ state
]

{ #category : #accessing }
PhexMatcher >> state: anObject [
	state := anObject
]

{ #category : #'TDD todos' }
PhexMatcher >> testFor: aDescription [
	"TODO"
	Error signal: aDescription
]

{ #category : #'expecting-boolean' }
PhexMatcher >> true [
	^self expectedUnknownMessageToReturn: true
]

{ #category : #expecting }
PhexMatcher >> ~= expected [
	self not equal: expected
	
]
