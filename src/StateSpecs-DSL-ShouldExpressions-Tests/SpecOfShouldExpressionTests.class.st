Class {
	#name : #SpecOfShouldExpressionTests,
	#superclass : #TestCase,
	#category : 'StateSpecs-DSL-ShouldExpressions-Tests'
}

{ #category : #tests }
SpecOfShouldExpressionTests >> customTestForArbitraryBlock [

	
	5 should satisfy: [:num | num < 0]
	
	"5 should satisfy: [:num | num > 0]"
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testBeBooleanProperty [
	self shouldnt: [#() should be isEmpty] raise: SpecOfFailed.
	self should: [#(1 2) should be isEmpty] raise: SpecOfFailed.

	self should: [#() should not be isEmpty] raise: SpecOfFailed.
	self shouldnt: [#(1 2) should not be isEmpty] raise: SpecOfFailed.

	self shouldnt: [10 should be between: 1 and: 50] raise: SpecOfFailed.
	self should: [10 should be between: 1 and: 2] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testBeBooleanPropertyDescription [

	| errorMessage |
	[#(1 2) should be isEmpty] on: SpecOfFailed do: [:err | 
		errorMessage := err messageText].
	
	self assert: errorMessage equals: '#(1 2) should be isEmpty'
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testBeBooleanPropertyDescriptionWhenNegationExists [

	| errorMessage |
	[#() should not be isEmpty] on: SpecOfFailed do: [:err | 
		errorMessage := err messageText].
	
	self assert: errorMessage equals: '#() should not be isEmpty'
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testCollectionEquality [
	self shouldnt: [#(1 2 3) should equal: #(1 2 3)] raise: SpecOfFailed.
	self shouldnt: [#(2 1 3) should equal: #(1 2 3)] raise: SpecOfFailed.
	self should: [#(1 2) should equal: #(1 2 3)] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testCollectionIncludesItem [
	self shouldnt: [#(10 20) should include: 10] raise: SpecOfFailed.
	self should: [#(10 20) should include: 15] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testCollectionItem [
	| subject |
	subject := (Dictionary new)
				add: 1 -> 2;
				add: 3 -> 4; 
				yourself.
	self shouldnt: [subject should include: 2 at: 1] raise: SpecOfFailed.
	self should: [subject should include: 100 at: 3] raise: SpecOfFailed.
	self should: [subject should include: 2 at: 300] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testCollectionOrderedEquality [
	self shouldnt: [#(1 2 3) should equalInOrder: #(1 2 3)] raise: SpecOfFailed.
	self should: [#(2 1 3) should equalInOrder: #(1 2 3)] raise: SpecOfFailed.
	self should: [#(1 2) should equalInOrder: #(1 2 3)] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testCollectionSize [
	self shouldnt: [#(10 20) should haveSize: 2] raise: SpecOfFailed.
	self should: [#(10 20) should haveSize: 3] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testCreationFromObject [
	| subject result |
	subject := Object new.
	result := subject should.
	self assert: (result isKindOf: SpecOfShouldExpression).
	self assert: result receiver == subject
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testDictionaryIncludesKey [
	| subject |
	subject := (Dictionary new)
				add: 1 -> 2;
				add: 3 -> 4;
				yourself.
	self shouldnt: [subject should includeKey: 1] raise: SpecOfFailed.
	self should: [subject should includeKey: 2] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testFloatEquality [

	self deny: 0.1 + 0.2 = 0.3.
	self shouldnt: [(0.1 + 0.2) should equal: 0.3 ] raise: SpecOfFailed.
	self deny: 0.1 + 0.2 * 10 = 3.
	self shouldnt: [(0.1 + 0.2 * 10) should equal: 3 ] raise: SpecOfFailed.	
	
	self shouldnt: [10.0 should equal: 10 ] raise: SpecOfFailed.
	self shouldnt: [0.0 should equal: 0] raise: SpecOfFailed.
	self should: [(0.1 + 0.2) should equal: 0.31] raise: SpecOfFailed.	
	self should: [0.1 should equal: Object new] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testGreaterThan [
	self shouldnt: [5 should beGreaterThan: 4] raise: SpecOfFailed.
	self should: [5 should beGreaterThan: 5] raise: SpecOfFailed.
	self should: [5 should beGreaterThan: 6] raise: SpecOfFailed.
	
	self shouldnt: [5 should beGreaterOrEqualThan: 4] raise: SpecOfFailed.
	self shouldnt: [5 should beGreaterOrEqualThan: 5] raise: SpecOfFailed.
	self should: [5 should beGreaterOrEqualThan: 6] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testInstanceOfClass [
	self shouldnt: [5 should beInstanceOf: SmallInteger] raise: SpecOfFailed.
	self should: [-5 should beInstanceOf: Integer] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testKindOfClass [
	self shouldnt: [5 should beKindOf: Integer] raise: SpecOfFailed.
	self should: [5.0 should beKindOf: Integer] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testLessThan [
	self shouldnt: [5 should beLessThan: 6] raise: SpecOfFailed.
	self should: [5 should beLessThan: 5] raise: SpecOfFailed.
	self should: [5 should beLessThan: 3] raise: SpecOfFailed.
	
	self shouldnt: [5 should beLessOrEqualThan: 6] raise: SpecOfFailed.
	self shouldnt: [5 should beLessOrEqualThan: 5] raise: SpecOfFailed.
	self should: [5 should beLessOrEqualThan: 4] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testNumberEquality [

	self deny: 3 = (0.1 + 0.2 * 10).
	self shouldnt: [3 should equal: 0.1 + 0.2 * 10] raise: SpecOfFailed.	
	
	self shouldnt: [3 should equal: 3] raise: SpecOfFailed.
	self shouldnt: [10 should equal: 10.0 ] raise: SpecOfFailed.
	self shouldnt: [0 should equal: 0.0] raise: SpecOfFailed.

	self should: [3 should equal: 3.001] raise: SpecOfFailed.	
	self should: [3 should equal: Object new] raise: SpecOfFailed.
	

	
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testNumberFloatingComparison [
	self shouldnt: [11 should equal: 10 within: 2 ] raise: SpecOfFailed.
	self should: [11 should equal: 10 within: 0.5] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testObjectsEquality [
	self shouldnt: ['some' should equal: 'some'] raise: SpecOfFailed.
	self should: ['some' should equal: 'other'] raise: SpecOfFailed.
	self shouldnt: [5 should not equal: 6] raise: SpecOfFailed.
	self should: [5 should not equal: 5] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testObjectsEqualityWithFailureDescription [
	| errorDescription |
	self shouldnt: [5 should equal: 5 description: 'anything good here'] raise: SpecOfFailed.
		
	['some' should equal: 'other' description: 'it should fail here'] on: SpecOfFailed do: [:err | 	
		errorDescription := err messageText].

	self assert: errorDescription equals: 'it should fail here'.
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testObjectsIdentity [
	self shouldnt: [5 should be: 5] raise: SpecOfFailed.
	self should: ['asd' should be: 'asd' copy] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testObjectsIdentityWithFailureDescription [
	| errorDescription |
	self shouldnt: [5 should be: 5 description: 'anything good here'] raise: SpecOfFailed.
	
	['some' should be: 'other' description: 'it should fail here'] on: SpecOfFailed do: [:err | 	
		errorDescription := err messageText].

	self assert: errorDescription equals: 'it should fail here'
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testOrderedCollectionEquality [
	self shouldnt: [#(1 2 3) asOrderedCollection should equal: #(1 2 3)] raise: SpecOfFailed.
	self should: [#(1 2 3) asOrderedCollection should equal: #(5 4)] raise: SpecOfFailed 
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testPointEquality [
	
	self deny: 0.1 + 0.2 @ 0.1 = (0.3 @ 0.1).
	self shouldnt: [(0.1 + 0.2 @ 0.1) should equal: 0.3 @ 0.1]	raise: SpecOfFailed.
		
	self should: [(0.1 + 0.2 @ 0.1) should equal: 0.301 @ 0.1]	raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testPointFloatingComparison [
	self shouldnt: [(0.7 @ 0.7) should equal: 0 @ 0 within: 1]
		raise: SpecOfFailed.
	self should: [(0.8 @ 0.8) should equal: 0 @ 0 within: 1] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testPropertyBuilderPrinting [
	
	| propertyBuilder actual |
	propertyBuilder := (10@20) where x.
	
	actual := propertyBuilder printString.
	
	self assert: actual equals: 'Got "10" from (10@20) x'
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testPropertyValidation [
	self shouldnt: [(10@20) where x] raise: SpecOfFailed.
	self should: [10 where x] raise: MessageNotUnderstood.
	
	self shouldnt: [(10@20) where x should equal: 10] raise: SpecOfFailed.
	self shouldnt: [(10@(20@40)) where y x should equal: 20] raise: SpecOfFailed.
	
	self should: [(10@20) where x should equal: 50] raise: SpecOfFailed.
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testPropertyValidationFailureDescription [

	| errorMessage |
	[(10 @ 20) where x should equal: 30] on: SpecOfFailed do: [:err | 
		errorMessage := err messageText].
	
	self assert: errorMessage equals: 'Got "10" from (10@20) x but it should equal "30"'
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testPropertyValueValidation [
		
	self shouldnt: [10 where value should be: 10] raise: SpecOfFailed.
	self should: [10 where value should be: 20] raise: SpecOfFailed.
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testPropertyWithArgsValidationFailureDescription [

	| errorMessage |
	[((0 @ 1) where distanceTo: (0@2)) should equal: 30] on: SpecOfFailed do: [:err | 
		errorMessage := err messageText].
	
	self assert: errorMessage equals: 'Got "1" from (0@1) distanceTo: (0@2) but it should equal "30"'
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testPropertyWithBooleanSubPropertyValidation [
	
	self shouldnt: [#(first #()) where second should be isEmpty] raise: SpecOfFailed.
	self should: [#(first #(1 2)) where second should be isEmpty] raise: SpecOfFailed.
	
	[#(first #(1 2)) where second should be isEmpty] on: SpecOfFailed do: [:err | 
		self assert: err messageText equals: 'Got "#(1 2)" from #(#first #(1 2)) second but it should be isEmpty'	
	].
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testPropertyWithBooleanSubPropertyValidationWhenSpecWithDenial [
	
	self should: [#(first #()) where second should not be isEmpty] raise: SpecOfFailed.
	
	[#(first #()) where second should not be isEmpty] on: SpecOfFailed do: [:err | 
		self assert: err messageText equals: 'Got "#()" from #(#first #()) second but it should not be isEmpty'	
	].
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testRaisingExeption [
	self shouldnt: [[1 / 0] should raise: ZeroDivide] raise: SpecOfFailed.
	self should: [[1 / 0] should raise: Error] raise: SpecOfFailed.
	self should: [[1 / 3] should raise: ZeroDivide] raise: SpecOfFailed.
	self shouldnt: [[1 / 0] should fail] raise: SpecOfFailed. 
	self should: [[1 / 3] should fail] raise: SpecOfFailed.
	self shouldnt: [[1 / 1] should not raise: ZeroDivide] raise: SpecOfFailed.
	self should: [[1 / 0] should not raise: ZeroDivide] raise: SpecOfFailed.
		
	self shouldnt: [[1 someMessage] should raise: MessageNotUnderstood] raise: SpecOfFailed.
	self shouldnt: [[1 should be: 2] should raise: SpecOfFailed] raise: SpecOfFailed.
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testRespondToMessage [
	self shouldnt: [5 should respondTo: #+] raise: SpecOfFailed.
	self should: [Object new should respondTo: #+] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testSatisfyingBlock [
	self shouldnt: [5 should satisfy: [:num | num > 0]] raise: SpecOfFailed.
	self should: [-5 should satisfy: [:num | num > 0]] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testStringBeginsWithPrefix [
	self shouldnt: ['test string' should beginWith: 'test'] raise: SpecOfFailed.
	self shouldnt: ['test string' should beginWith: 'Test'] raise: SpecOfFailed.
	self should: ['some test string' should beginWith: 'test'] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testStringBeginsWithPrefixCaseSensitive [
	self shouldnt: ['test string' should beginWith: 'test' caseSensitive: true] raise: SpecOfFailed.
	self should: ['test string' should beginWith: 'Test' caseSensitive: true] raise: SpecOfFailed.
	self should: ['some test string' should beginWith: 'test' caseSensitive: true] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testStringEndsWithSuffix [
	self shouldnt: ['string test' should endWith: 'test'] raise: SpecOfFailed.
	self shouldnt: ['string test' should endWith: 'Test'] raise: SpecOfFailed.
	self should: ['some test string' should endWith: 'test'] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testStringEndsWithSuffixCaseSensitive [
	self shouldnt: ['string test' should endWith: 'test' caseSensitive: true] raise: SpecOfFailed.
	self should: ['string test' should endWith: 'Test' caseSensitive: true] raise: SpecOfFailed.
	self should: ['some test string' should endWith: 'test' caseSensitive: true] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testStringEquality [
	self shouldnt: ['some' should equal: 'some'] raise: SpecOfFailed.
	self should: ['1234' should equal: '1324'] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testStringIncludesSubstring [
	self shouldnt: ['some test string' should includeSubstring: 'test'] raise: SpecOfFailed.
	self shouldnt: ['some test string' should includeSubstring: 'Test'] raise: SpecOfFailed.
	self should: ['some string' should includeSubstring: 'test'] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testStringIncludesSubstringCaseSensitive [
	self shouldnt: [
		'some test string' should includeSubstring: 'test' caseSensitive: true] raise: SpecOfFailed.
	self should: [
		'some test string' should includeSubstring: 'Test'  caseSensitive: true] raise: SpecOfFailed.
	self should: [
		'some string' should includeSubstring: 'test' caseSensitive: true] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testStringMatchesWithRegex [
	self shouldnt: ['test string' should matchRegex: '^test'] raise: SpecOfFailed.
	self shouldnt: ['test string' should matchRegex: '^Test'] raise: SpecOfFailed.
	self should: ['some test string' should matchRegex: '^test'] raise: SpecOfFailed
]

{ #category : #tests }
SpecOfShouldExpressionTests >> testStringMatchesWithRegexCaseSensitive [
	self shouldnt: ['test string' should matchRegex: '^test' caseSensitive: true] raise: SpecOfFailed.
	self should: ['test string' should matchRegex: '^Test' caseSensitive: true] raise: SpecOfFailed.
	self should: ['some test string' should matchRegex: '^test' caseSensitive: true] raise: SpecOfFailed
]
