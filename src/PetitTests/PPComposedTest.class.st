Class {
	#name : #PPComposedTest,
	#superclass : #PPAbstractParserTest,
	#category : #'PetitTests-Tests'
}

{ #category : #accessing }
PPComposedTest >> comment [
	^ ($" asParser , $" asParser negate star , $" asParser) flatten
]

{ #category : #accessing }
PPComposedTest >> identifier [
	^ (#letter asParser , #word asParser star) flatten
]

{ #category : #accessing }
PPComposedTest >> number [
	^ ($- asParser optional , #digit asParser plus , ($. asParser , #digit asParser plus) optional) flatten
]

{ #category : #'testing-examples' }
PPComposedTest >> testComment [
	self assert: self comment parse: '""' to: '""'.
	self assert: self comment parse: '"a"' to: '"a"'.
	self assert: self comment parse: '"ab"' to: '"ab"'.
	self assert: self comment parse: '"abc"' to: '"abc"'.

	self assert: self comment parse: '""a' to: '""' end: 2.
	self assert: self comment parse: '"a"a' to: '"a"' end: 3.
	self assert: self comment parse: '"ab"a' to: '"ab"' end: 4.
	self assert: self comment parse: '"abc"a' to: '"abc"' end: 5.

	self assert: self comment fail: '"'.
	self assert: self comment fail: '"a'.
	self assert: self comment fail: '"aa'.
	self assert: self comment fail: 'a"'.
	self assert: self comment fail: 'aa"'
]

{ #category : #testing }
PPComposedTest >> testDoubledString [
	| parser |
	parser := ($' asParser , (($' asParser , $' asParser) / $' asParser negate) star flatten , $' asParser) 
		==> [ :nodes | nodes second copyReplaceAll: '''''' with: '''' ].

	self assert: parser parse: '''''' to: ''.
	self assert: parser parse: '''a''' to: 'a'.
	self assert: parser parse: '''ab''' to: 'ab'.
	self assert: parser parse: '''a''''b''' to: 'a''b'.
	self assert: parser parse: '''a''''''''b''' to: 'a''''b'
]

{ #category : #testing }
PPComposedTest >> testEvenNumber [
	"Create a grammar that parses an even number of a's and b's."
	
	| a as b bs s |
	a := $a asParser ==> [ :char | as := as + 1 ].
	b := $b asParser ==> [ :char | bs := bs + 1 ].
	s := (a / b) star >=> [ :stream :cc |
		as := bs := 0.
		cc value.
		(as even and: [ bs even ])
			ifFalse: [ PPFailure message: 'Even number of a and b expected' context: stream at: 0 ] ].

	self assert: s fail: 'a' end: 1.
	self assert: s fail: 'b' end: 1.
	self assert: s fail: 'ab' end: 2.
	self assert: s fail: 'ba' end: 2.
	self assert: s fail: 'aaa' end: 3.
	self assert: s fail: 'bbb' end: 3.
	self assert: s fail: 'aab' end: 3.
	self assert: s fail: 'abb' end: 3.
	
	self assert: s parse: ''.
	self assert: s parse: 'aa'.
	self assert: s parse: 'bb'.
	self assert: s parse: 'aaaa'.
	self assert: s parse: 'aabb'.
	self assert: s parse: 'abab'.
	self assert: s parse: 'baba'.
	self assert: s parse: 'bbaa'.
	self assert: s parse: 'bbbb'
]

{ #category : #'testing-examples' }
PPComposedTest >> testIdentifier [
	self assert: self identifier parse: 'a' to: 'a'.
	self assert: self identifier parse: 'a1' to: 'a1'.
	self assert: self identifier parse: 'a12' to: 'a12'.
	self assert: self identifier parse: 'ab' to: 'ab'.
	self assert: self identifier parse: 'a1b' to: 'a1b'.

	self assert: self identifier parse: 'a_' to: 'a' end: 1.
	self assert: self identifier parse: 'a1-' to: 'a1' end: 2.
	self assert: self identifier parse: 'a12+' to: 'a12' end: 3.
	self assert: self identifier parse: 'ab^' to: 'ab' end: 2.
	self assert: self identifier parse: 'a1b*' to: 'a1b' end: 3.

	self assert: self identifier fail: ''.
	self assert: self identifier fail: '1'.
	self assert: self identifier fail: '1a'
]

{ #category : #testing }
PPComposedTest >> testIfThenElse [
	"S ::= if C then S else S | if C then S | X"

	| start if then else cond expr parser |
	start := PPDelegateParser new.
	if := 'if' asParser token trim.
	then := 'then' asParser token trim.
	else := 'else' asParser token trim.
	cond := 'C' asParser token trim.
	expr := 'X' asParser token trim.
	start setParser: (if , cond , then , start , else , start) / (if , cond , then , start) / expr.
	parser := start end.
	self assert: parser parse: 'X'.
	self assert: parser parse: 'if C then X'.
	self assert: parser parse: 'if C then X else X'.
	self assert: parser parse: 'if C then if C then X'.
	self assert: parser parse: 'if C then if C then X else if C then X'.
	self assert: parser parse: 'if C then if C then X else X else if C then X'.
	self assert: parser parse: 'if C then if C then X else X else if C then X else X'.
	self assert: parser fail: 'if C'.
	self assert: parser fail: 'if C else X'.
	self assert: parser fail: 'if C then if C'
]

{ #category : #testing }
PPComposedTest >> testLeftRecursion [
	"S ::= S 'x' S / '1'"
	
	| parser |
	parser := PPDelegateParser new.
	parser setParser: ((parser , $x asParser , parser) / $1 asParser) memoized flatten.

	self assert: parser parse: '1' to: '1'.
	self assert: parser parse: '1x1' to: '1x1'.
	self assert: parser parse: '1x1x1' to: '1x1x1'.
	self assert: parser parse: '1x1x1x1' to: '1x1x1x1'.
	self assert: parser parse: '1x1x1x1x1' to: '1x1x1x1x1'.
	self assert: parser parse: '1x1x1x1x1x1' to: '1x1x1x1x1x1'
]

{ #category : #testing }
PPComposedTest >> testListOfIntegers [
	"S ::= S , number | number"
	
	| number list parser |
	number := #digit asParser plus flatten trim
		==> [ :node | node asInteger ].
	list := (number separatedBy: $, asParser token trim)
		==> [ :node | node select: [ :each | each isKindOf: Integer ] ].
	parser := list end.

	self assert: parser parse: '1' to: (1 to: 1) asArray.
	self assert: parser parse: '1,2' to: (1 to: 2) asArray.
	self assert: parser parse: '1,2,3' to: (1 to: 3) asArray.
	self assert: parser parse: '1,2,3,4' to: (1 to: 4) asArray.
	self assert: parser parse: '1,2,3,4,5' to: (1 to: 5) asArray.

	self assert: parser parse: '1' to: (1 to: 1) asArray.
	self assert: parser parse: '1, 2' to: (1 to: 2) asArray.
	self assert: parser parse: '1, 2, 3' to: (1 to: 3) asArray.
	self assert: parser parse: '1, 2, 3, 4' to: (1 to: 4) asArray.
	self assert: parser parse: '1, 2, 3, 4, 5' to: (1 to: 5) asArray.

	self assert: parser parse: '1' to: (1 to: 1) asArray.
	self assert: parser parse: '1 ,2' to: (1 to: 2) asArray.
	self assert: parser parse: '1 ,2 ,3' to: (1 to: 3) asArray.
	self assert: parser parse: '1 ,2 ,3 ,4' to: (1 to: 4) asArray.
	self assert: parser parse: '1 ,2 ,3 ,4 ,5' to: (1 to: 5) asArray.
	
	self assert: parser fail: ''.
	self assert: parser fail: ','.
	self assert: parser fail: '1,'.
	self assert: parser fail: '1,,2'
]

{ #category : #testing }
PPComposedTest >> testNestedComments [
	"C ::= B I* E"
	"I ::= !E (C | T)"
	"B ::= /*"
	"E ::= */"
	"T ::= ."
	
	| begin end any inside parser |
	begin := '/*' asParser.
	end := '*/' asParser.
	any := #any asParser.
	
	parser := PPDelegateParser new.
	inside := end not , (parser / any).
	parser setParser: begin , inside star , end.
	
	self assert: parser parse: '/*ab*/cd' end: 6.
	self assert: parser parse: '/*a/*b*/c*/'.
	self assert: parser fail: '/*a/*b*/c'
]

{ #category : #'testing-examples' }
PPComposedTest >> testNumber [
	self assert: self number parse: '1' to: '1'.
	self assert: self number parse: '12' to: '12'.
	self assert: self number parse: '12.3' to: '12.3'.
	self assert: self number parse: '12.34' to: '12.34'.

	self assert: self number parse: '1..' to: '1' end: 1.
	self assert: self number parse: '12-' to: '12' end: 2.
	self assert: self number parse: '12.3.' to: '12.3' end: 4.
	self assert: self number parse: '12.34.' to: '12.34' end: 5.
	
	self assert: self number parse: '-1' to: '-1'.
	self assert: self number parse: '-12' to: '-12'.
	self assert: self number parse: '-12.3' to: '-12.3'.
	self assert: self number parse: '-12.34' to: '-12.34'.
	
	self assert: self number fail: ''.
	self assert: self number fail: '-'.
	self assert: self number fail: '.'.
	self assert: self number fail: '.1'
]

{ #category : #testing }
PPComposedTest >> testPalindrome [
	"S0 ::= a S1 a | b S1 b | ...
	 S1 ::= S0 | epsilon"
	
	| s0 s1 parser |
	s0 := PPDelegateParser new.
	s1 := PPDelegateParser new.
	s0 setParser: ($a asParser , s1 , $a asParser)
		/ ($b asParser , s1 , $b asParser)
		/ ($c asParser , s1 , $c asParser).	
	s1 setParser: s0 / nil asParser.
	parser := s0 flatten end.

	self assert: parser parse: 'aa' to: 'aa'.
	self assert: parser parse: 'bb' to: 'bb'.
	self assert: parser parse: 'cc' to: 'cc'.
	
	self assert: parser parse: 'abba' to: 'abba'.
	self assert: parser parse: 'baab' to: 'baab'.

	self assert: parser parse: 'abccba' to: 'abccba'.
	self assert: parser parse: 'abaaba' to: 'abaaba'.
	self assert: parser parse: 'cbaabc' to: 'cbaabc'.

	self assert: parser fail: 'a'.
	self assert: parser fail: 'ab'.
	self assert: parser fail: 'aab'.
	self assert: parser fail: 'abccbb'
]

{ #category : #testing }
PPComposedTest >> testParseAaaBbb [
	"S0 ::= a S1 b
	 S1 ::= S0 | epsilon"
	
	| s0 s1 parser |
	s0 := PPDelegateParser new.
	s1 := PPDelegateParser new.
	s0 setParser: $a asParser , s1 , $b asParser.
	s1 setParser: s0 / nil asParser.
	parser := s0 flatten.

	self assert: parser parse: 'ab' to: 'ab'.
	self assert: parser parse: 'aabb' to: 'aabb'.
	self assert: parser parse: 'aaabbb' to: 'aaabbb'.
	self assert: parser parse: 'aaaabbbb' to: 'aaaabbbb'.

	self assert: parser parse: 'abb' to: 'ab' end: 2.
	self assert: parser parse: 'aabbb' to: 'aabb' end: 4.
	self assert: parser parse: 'aaabbbb' to: 'aaabbb' end: 6.
	self assert: parser parse: 'aaaabbbbb' to: 'aaaabbbb' end: 8.

	self assert: parser fail: 'a'.
	self assert: parser fail: 'b'.
	self assert: parser fail: 'aab'.
	self assert: parser fail: 'aaabb'
]

{ #category : #testing }
PPComposedTest >> testParseAaaaaa [
	"S ::= a a S | epsilon"
	
	| s0 s1 parser |
	s0 := PPDelegateParser new.
	s1 := $a asParser , $a asParser , s0.
	s0 setParser: s1 / nil asParser.
	parser := s0 flatten.

	self assert: parser parse: '' to: ''.
	self assert: parser parse: 'aa' to: 'aa'.
	self assert: parser parse: 'aaaa' to: 'aaaa'.
	self assert: parser parse: 'aaaaaa' to: 'aaaaaa'.

	self assert: parser parse: 'a' to: '' end: 0.
	self assert: parser parse: 'aaa' to: 'aa' end: 2.
	self assert: parser parse: 'aaaaa' to: 'aaaa' end: 4.
	self assert: parser parse: 'aaaaaaa' to: 'aaaaaa' end: 6
]

{ #category : #testing }
PPComposedTest >> testParseAbAbAb [
	"S ::= (A B)+"
	
	| parser |
	parser := ($a asParser , $b asParser) plus flatten.

	self assert: parser parse: 'ab' to: 'ab'.
	self assert: parser parse: 'abab' to: 'abab'.
	self assert: parser parse: 'ababab' to: 'ababab'.
	self assert: parser parse: 'abababab' to: 'abababab'.

	self assert: parser parse: 'abb' to: 'ab' end: 2.
	self assert: parser parse: 'ababa' to: 'abab' end: 4.
	self assert: parser parse: 'abababb' to: 'ababab' end: 6.
	self assert: parser parse: 'ababababa' to: 'abababab' end: 8.
	
	self assert: parser fail: ''.
	self assert: parser fail: 'a'.
	self assert: parser fail: 'bab'
]

{ #category : #testing }
PPComposedTest >> testParseAbabbb [
	"S ::= (A | B)+"

	| parser |
	parser := ($a asParser / $b asParser) plus flatten.

	self assert: parser parse: 'a' to: 'a'.
	self assert: parser parse: 'b' to: 'b'.
	self assert: parser parse: 'ab' to: 'ab'.
	self assert: parser parse: 'ba' to: 'ba'.
	self assert: parser parse: 'aaa' to: 'aaa'.
	self assert: parser parse: 'aab' to: 'aab'.
	self assert: parser parse: 'aba' to: 'aba'.
	self assert: parser parse: 'baa' to: 'baa'.
	self assert: parser parse: 'abb' to: 'abb'.
	self assert: parser parse: 'bab' to: 'bab'.
	self assert: parser parse: 'bba' to: 'bba'.
	self assert: parser parse: 'bbb' to: 'bbb'.

	self assert: parser parse: 'ac' to: 'a' end: 1.
	self assert: parser parse: 'bc' to: 'b' end: 1.
	self assert: parser parse: 'abc' to: 'ab' end: 2.
	self assert: parser parse: 'bac' to: 'ba' end: 2.
	
	self assert: parser fail: ''.
	self assert: parser fail: 'c'
]

{ #category : #testing }
PPComposedTest >> testParseAnBnCn [
	"PEGs for a non context- free language: 
		
		a^n , b^n , c^n
		
	S <- &P1 P2 
	P1 <- AB 'c' 
	AB <- 'a' AB 'b' / epsilon
	P2 <- 'a'* BC end
	BC <- 'b' BC 'c' / epsilon"
	
	| s p1 ab p2 bc |
	s := PPDelegateParser new.
	p1 := PPDelegateParser new.
	ab := PPDelegateParser new.
	p2 := PPDelegateParser new.
	bc := PPDelegateParser new.
	
	s setParser: (p1 and , p2 end) flatten.
	p1 setParser: ab , $c asParser.
	ab setParser: ($a asParser , ab , $b asParser) optional.
	p2 setParser: $a asParser star , bc.
	bc setParser: ($b asParser , bc , $c asParser) optional.
	
	self assert: s parse: 'abc' to: 'abc'.
	self assert: s parse: 'aabbcc' to: 'aabbcc'.
	self assert: s parse: 'aaabbbccc' to: 'aaabbbccc'.

	self assert: s fail: 'bc'.
	self assert: s fail: 'ac'.
	self assert: s fail: 'ab'.
	self assert: s fail: 'abbcc'.
	self assert: s fail: 'aabcc'.
	self assert: s fail: 'aabbc'
]

{ #category : #'testing-examples' }
PPComposedTest >> testReturn [
	| number spaces return |
	number := #digit asParser plus flatten.
	spaces := #space asParser star.
	return := (spaces , $^ asParser token , spaces , number)
		==> [ :nodes | Array with: #return with: (nodes at: 4) ].

	self assert: return parse: '^1' to: #(return '1').
	self assert: return parse: '^12' to: #(return '12').
	self assert: return parse: '^ 123' to: #(return '123').
	self assert: return parse: '^  1234' to: #(return '1234').
	
	self assert: return fail: '1'.
	self assert: return fail: '^'
]
