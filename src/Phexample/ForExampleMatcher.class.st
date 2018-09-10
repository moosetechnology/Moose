Class {
	#name : #ForExampleMatcher,
	#superclass : #Phexample,
	#category : #'Phexample-Test'
}

{ #category : #'examples-expecting' }
ForExampleMatcher >> shouldBeCloseTo [
  600.123456789 should beCloseTo: 600.1.
	600.123456789 should not beCloseTo: 600.0.
	600.123456789 should not beCloseTo: 600.2
]

{ #category : #'examples-expecting-boolean' }
ForExampleMatcher >> shouldBeFalse [
  (Set with: 42) isEmpty should beFalse.
]

{ #category : #'examples-expecting-reflection' }
ForExampleMatcher >> shouldBeKindOf [
	'hello' should beKindOf: String
]

{ #category : #'examples-expecting-reflection' }
ForExampleMatcher >> shouldBeKindOfSuperclass [
	'hello' should beKindOf: Collection
]

{ #category : #'examples-expecting' }
ForExampleMatcher >> shouldBeSame [
	self should beSameAs: self 
]

{ #category : #'examples-expecting-boolean' }
ForExampleMatcher >> shouldBeTrue [
	Set new isEmpty should beTrue.

]

{ #category : #'examples-expecting-string' }
ForExampleMatcher >> shouldBeginWith [ 
	'abcdef' should beginWith: 'abc'.
]

{ #category : #'examples-expecting-change' }
ForExampleMatcher >> shouldChange [
	| list |
	list := OrderedCollection new.
	[ list add: nil ] should change: [ list size ]
]

{ #category : #'examples-expecting-change' }
ForExampleMatcher >> shouldChangeFromTo [
	| list |
	list := OrderedCollection new add: nil; add: nil; yourself.
	[ list add: nil ] should change: [ list size ] from: 2 to: 3.
]

{ #category : #'examples-expecting-boolean' }
ForExampleMatcher >> shouldContainNameOfBooleanPropertyInMessageTextWhenFailing [
	[ nil notNil should beTrue ] should
		signal: SpecOfFailed
		withMessageText: 'expected #notNil to be true'
]

{ #category : #'examples-expecting-string' }
ForExampleMatcher >> shouldEndWith [
	'abcdef' should endWith: 'def'.
]

{ #category : #'examples-expecting' }
ForExampleMatcher >> shouldEqualFive [
	(2 + 3) should equal: 5
]

{ #category : #'examples-expecting-collections' }
ForExampleMatcher >> shouldEqualIgnoringOrder [
	'Hi Niko' should equalIgnoringOrder: 'iH ikoN'.
	'Hi Niko' should not equalIgnoringOrder: 'Hi Niko2'.
	'Hi Niko' should not equalIgnoringOrder: 'Hi Niko '. "Trailing space."
]

{ #category : #'examples-expecting' }
ForExampleMatcher >> shouldGreaterThan [
  6 should > 5 
]

{ #category : #'examples-expecting-boolean' }
ForExampleMatcher >> shouldHandlePathologicCaseOfBooleanPropertyWhenFailing [
	[ nil should beTrue ] should
		signal: SpecOfFailed
		withMessageText: 'expected #<unknown> to be true'
]

{ #category : #examples }
ForExampleMatcher >> shouldHaveTestsInThisClass [
	self class allTestSelectors isEmpty should not be: true.
	self class allTestSelectors size should > 20.
	
	
]

{ #category : #'examples-expecting-collections' }
ForExampleMatcher >> shouldInclude [
	#(foo bar) should include: #foo
]

{ #category : #'examples-expecting-boolean' }
ForExampleMatcher >> shouldIncludeFoo [
	(#(foo bar qux) includes: #foo) should beTrue.

]

{ #category : #'examples-expecting' }
ForExampleMatcher >> shouldLesserThan [
  5 should < 6
]

{ #category : #'examples-expecting-string' }
ForExampleMatcher >> shouldMatchRegex [
	'aaa' should matchRegex: 'a*'.
]

{ #category : #'examples-expecting-boolean' }
ForExampleMatcher >> shouldNotBeFalse [
  |set|
	set := Set new. 
	set isEmpty should not be: false.
	^set
]

{ #category : #'examples-expecting-reflection' }
ForExampleMatcher >> shouldNotBeKindOfSubclass [
	'hello' should not beKindOf: Symbol
]

{ #category : #'examples-expecting-boolean' }
ForExampleMatcher >> shouldNotBeTrue [
  	(Set with: 42) isEmpty should not beTrue.
]

{ #category : #'examples-expecting' }
ForExampleMatcher >> shouldNotEqualSeven [
	(2 + 3) should not equal: 7
]

{ #category : #'examples-expecting-collections' }
ForExampleMatcher >> shouldNotInclude [
	#(foo bar) should not include: #qux
]

{ #category : #'examples-expecting-string' }
ForExampleMatcher >> shouldNotMatchRegex [
	'aaa' should not matchRegex: 'ba*'.
]

{ #category : #'examples-expecting-reflection' }
ForExampleMatcher >> shouldNotRespondTo [
	Object new should not respondTo: #zork
]

{ #category : #'examples-expecting-error' }
ForExampleMatcher >> shouldNotSignalIfNothingFailed [
	[   ] should not signal: Error.
]

{ #category : #'examples-expecting-error' }
ForExampleMatcher >> shouldNotSignalWithMessageText [
	[ ] should not signal: Error withMessageText: 'bla'
]

{ #category : #'examples-expecting-reflection' }
ForExampleMatcher >> shouldRespondTo [
	Object new should respondTo: #yourself
]

{ #category : #'examples-expecting-performance' }
ForExampleMatcher >> shouldRunWithin [
	[ "makes the Kessel Run in less than twelve parsecs" ] should runWithin: 10 milliSeconds 
]

{ #category : #'examples-expecting-error' }
ForExampleMatcher >> shouldSignalIfUnexpectedSignalOfSubtype [

	[ [ 5 should equal: 6] should not signal: TestFailure ] should 
		signal: SpecOfFailed
		withMessageText:  'Should not raise TestFailure but did'
]

{ #category : #'examples-expecting-boolean' }
ForExampleMatcher >> shouldSignalWhenBeFalseFails [
	[ Set new isEmpty should beFalse ] should
		signal: SpecOfFailed
		withMessageText: 'expected #isEmpty to be false'
]

{ #category : #'examples-expecting' }
ForExampleMatcher >> shouldSignalWhenBeSameFails [
	[ 'string' copy should beSameAs: 'string' copy ] 
		should signal: SpecOfFailed 
		withMessageText: 'expected ''string'' but got ''string'' (using ==)'
]

{ #category : #'examples-expecting-boolean' }
ForExampleMatcher >> shouldSignalWhenBeTrueFails [
	[ (Set with: 42) isEmpty should beTrue ] should
		signal: SpecOfFailed
		withMessageText: 'expected #isEmpty to be true'
]

{ #category : #'examples-expecting-string' }
ForExampleMatcher >> shouldSignalWhenBeginsWithFails [
	[ 'abcdef' should beginWith: 'abcX' ] should 
		signal: SpecOfFailed 
		withMessageText: 'expected ''abcX'' but got ''abcdef'' (using beginsWith:)' 
]

{ #category : #'examples-expecting-string' }
ForExampleMatcher >> shouldSignalWhenEndWithFails [
	[ 'abcdef' should endWith: 'Xdef' ] should 
		signal: SpecOfFailed 
		withMessageText: 'expected ''Xdef'' but got ''abcdef'' (using endsWith:)' 
]

{ #category : #'examples-expecting-string' }
ForExampleMatcher >> shouldSignalWhenMatchRegexFails [
	[ 'aaa' should matchRegex: 'ba*' ] should 
		signal: SpecOfFailed 
		withMessageText: 'expected ''ba*'' but got ''aaa'' (using matchesRegex:)'
]

{ #category : #'examples-expecting-boolean' }
ForExampleMatcher >> shouldSignalWhenNotBeFalseFails [
	[ (Set with: 42) isEmpty should not beFalse ] should
		signal: SpecOfFailed
		withMessageText: 'did not expect #isEmpty to be false'
]

{ #category : #'examples-expecting-boolean' }
ForExampleMatcher >> shouldSignalWhenNotBeTrueFails [
	[ Set new isEmpty should not beTrue ] should
		signal: SpecOfFailed
		withMessageText: 'did not expect #isEmpty to be true'
]

{ #category : #'examples-expecting-string' }
ForExampleMatcher >> shouldSignalWhenNotMatchRegexFails [
	[ 'aaa' should not matchRegex: 'a*' ] should 
		signal: SpecOfFailed 
		withMessageText: 'expected not to get ''a*'' but got ''aaa'' (using matchesRegex:)'
]

{ #category : #'examples-expecting-reflection' }
ForExampleMatcher >> shouldSignalWhenRespondToFails [
	[ Object new should respondTo: #zork ] should
		signal: SpecOfFailed
		withMessageText: 'expected an Object to respond to #zork (using respondsTo:)' 
]

{ #category : #'examples-expecting-performance' }
ForExampleMatcher >> shouldSignalWhenRunWithinFails [
	[ [ (Delay forMilliseconds: 20) wait ] should runWithin: 10 milliSeconds ] should signal: TestFailure
]

{ #category : #'examples-expecting-error' }
ForExampleMatcher >> shouldSignalWhenSignalWithMessageTextFails [
	[ [ self error: 'foo' ] should 
		signal: Error 
		withMessageText: 'bar' ] on: SpecOfFailed
		do: [ :ex | 
			ex messageText should equal: 'expected ''bar'' but got ''foo'' (using =)' ]
]

{ #category : #'examples-expecting-error' }
ForExampleMatcher >> shouldSignalWithMessage [
	
	[ 5 should equal: 6 ] should 
		signal: SpecOfFailed
		withMessageText: 'expected 6 but got 5 (using =)'
]

{ #category : #'examples-expecting-error' }
ForExampleMatcher >> shouldSignalWithMessageBlock [
	
	[ self error: 'test error' ] should 
		signal: Error
		withMessageText: [ :m | 
			m should beKindOf: String.
			m isEmpty should not be: true.
			m should equal: 'test error'.
		]
]
