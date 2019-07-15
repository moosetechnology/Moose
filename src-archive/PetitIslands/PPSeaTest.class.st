Class {
	#name : #PPSeaTest,
	#superclass : #PPAbstractParserTest,
	#instVars : [
		'result',
		'context'
	],
	#category : #'PetitIslands-Tests'
}

{ #category : #indentation }
PPSeaTest >> align [
	| aligns |
	
	aligns := self aligns.
	
	^ (aligns not, #space asParser) star, aligns
]

{ #category : #indentation }
PPSeaTest >> aligns [
	^ [ :ctx | 
		ctx indentStack isEmpty ifFalse: [ 
			ctx indentStack top parseOn: ctx ] 
		ifTrue: [ PPFailure message: 'stack is empty' context: ctx ]
	] asParser
]

{ #category : #parsing }
PPSeaTest >> assert: parser parse: input [
	result := super assert: parser parse: input
]

{ #category : #indentation }
PPSeaTest >> blank [
	^ #blank asParser
]

{ #category : #accessing }
PPSeaTest >> context [
	context ifNil: [ ^ super context ].
	^ context
]

{ #category : #'parse support' }
PPSeaTest >> identifier [ 
 	^ ((#letter asParser / $# asParser), (#letter asParser / #digit asParser) star) flatten 
]

{ #category : #'tests - water objects' }
PPSeaTest >> multilineCommentParser [
	^ '/*' asParser, (#any asParser starLazy: '*/' asParser), '*/' asParser.
]

{ #category : #'parse support' }
PPSeaTest >> nestedBlock [
	| blockIsland block nilIsland |
	blockIsland := self seaInstance.
	nilIsland := self nilIsland.
	
	block := PPDelegateParser new.
	block setParser: (${ asParser,  (blockIsland plus / nilIsland), $} asParser).
	block name: 'block'.
	
	blockIsland island: block.
	blockIsland name: 'block island'.
	^ block
]

{ #category : #'parse support' }
PPSeaTest >> nilIsland [
	|  nilIsland |
	nilIsland := self seaInstance.
	
	nilIsland island: nil asParser.
	nilIsland name: 'nil island'.
	
	^ nilIsland
]

{ #category : #indentation }
PPSeaTest >> restoreIl [
	^ [ :ctx | ctx indentStack pop ] asParser
]

{ #category : #'parse support' }
PPSeaTest >> sea: parser [
	^ self seaInstance island: parser.
]

{ #category : #'parse support' }
PPSeaTest >> sea: parser water: water [
	^ self seaInstance 
		island: parser;
		water: water;
		yourself
	
]

{ #category : #'parse support' }
PPSeaTest >> seaClass [ 
	^ PPSea  
]

{ #category : #'parse support' }
PPSeaTest >> seaInstance [
	^ self seaClass new 
]

{ #category : #indentation }
PPSeaTest >> setIl [
	^ [ :ctx | 
		| level comp p blank |
		level := ctx column.
		blank := self blank.
	
		comp := PPCompareParser 
						on: [ :_ctx | _ctx column = level  ] 
						message: 'expected level: ', level asString.
		p := comp.
	
		ctx indentStack push: p.
	] asParser
]

{ #category : #running }
PPSeaTest >> setUp [
	super setUp.
	context := nil
]

{ #category : #'tests - water objects' }
PPSeaTest >> singleCommentParser [
	| nl |
	nl := #newline asParser.
	^ '//' asParser, (#any asParser starLazy: nl), nl.
]

{ #category : #'tests - indentation' }
PPSeaTest >> testAlign [
	|  align p setIl restoreIl blank |
	
	setIl := #setIl asParser.
	restoreIl := #restoreIl asParser.
	align := #align asParser.
	blank := #blank asParser.
	
	p := blank, setIl, 'a' asParser, align, 'b' asParser, restoreIl.
	
	self assert: p  parse: ' a     
 b'.
]

{ #category : #testing }
PPSeaTest >> testBlock [
	| block  |

	block := self nestedBlock.
	
	self assert: block parse: '{}'.
	self assert: result size = 3.
	self assert: result first = ${.
	self assert: result third = $}.
	
	self assert: block parse: '{ }'.
	self assert: result size = 3.
	self assert: result first = ${.
	self assert: result third = $}.	
		
	self assert: block parse: '{ { } }'.
	self assert: result size = 3.
	self assert: result first = ${.
	self assert: result third = $}.	
		
		
	self assert: block parse: '{ { {{} } } }'.
	self assert: result isCollection.
	self assert: result  size = 3.
	self assert: result  first = ${.
	self assert: result  second first second first = ${.
	self assert: result  second first second second first second first = ${.
	self assert: result  second first second second first second third = $}.
	self assert: result  second first second third = $}.	
	self assert: result  third = $}.
	
	
	self assert: block parse: '{ { 
		{{} } 
	} }'.
	self assert: result isCollection.
	self assert: result  size = 3.
	self assert: result  first = ${.
	self assert: result  second first second first = ${.
	self assert: result  second first second second first second first = ${.
	self assert: result  second first second second first second third = $}.
	self assert: result  second first second third = $}.	
	self assert: result  third = $}.				
]

{ #category : #testing }
PPSeaTest >> testBoundary [
	|  p end body start |
	
	"use non-trivial end-of-class a complex end"
	end := 'end' asParser trimBlanks, 'of' asParser trimBlanks, 'class' asParser trimBlanks ==> [:args | #eoc].
	body := self nilIsland.
	start := 'class' asParser trim, self identifier.
	p := start, body, end.
	
	self assert: p parse: 'class Foo end of class'.
	self assert: result size = 4.
	self assert: result second = 'Foo'.
	self assert: result third first = ''.
	self assert: result third last = ''.
	
	self assert: p parse: 'class Foo .... end of class'.
	self assert: result size = 4.
	self assert: result second = 'Foo'.
	self assert: result third first = ' ....'.
	self assert: result third last = ''.
	
	self assert: p parse: 'class Foo .... end ... end of class'.
	self assert: result size = 4.
	self assert: result second = 'Foo'.
	
	self assert: p parse: 'class Foo .... end of ... end of class'.
	self assert: result size = 4.
	self assert: result second = 'Foo'.
	self assert: result third first = ' .... end of ...'.
	self assert: result third last = ''.


]

{ #category : #testing }
PPSeaTest >> testBoundary2 [
	
	|   epilog  id p |
	"use optional boundary"
	epilog := 'end' asParser optional.
	id := self identifier.
	p := ((self sea: id), epilog) plus.

	self assert: p parse: '...foo..end...bar...end'.	
	
	self assert: result first first first = '...'.
	self assert: result first first second = 'foo'.
	self assert: result first first third = '..'.
	
	self assert: result first second = 'end'.

	self assert: result second first first = '...'.
	self assert: result second first second = 'bar'.
	self assert: result second first third = '...'.
	self assert: result second second = 'end'.
]

{ #category : #'tests - complex' }
PPSeaTest >> testClass [
	| text   file class |
	text := '
// some comment
namespace cde {

public class Foo 
endclass

public class 123 // invalid class
public struct {}

class bar endclass
class Zorg endclass
}	
	'.
	
	class := ('public' asParser trim optional, 'class' asParser trim, self identifier,  'endclass' asParser trim) 
		==> [:t | t third] .
	file := ((self sea: class) ==> [:t | t second ]) plus.	
	
	result := file parse: text.
	self assert: result size = 3.
	self assert: result first = 'Foo'.
	self assert: result second = 'bar'.
	self assert: result third = 'Zorg'.

]

{ #category : #'tests - complex' }
PPSeaTest >> testFile [
	| text using imports class file |
	text := '
	
using a.b.c;
using c.d.e;
// some comment
namespace cde {

public class Foo 
endclass

public class 123 // invalid class
public struct {}

class bar endclass
}	
	'.
	
	using := 'using' asParser trim, (self identifier, ('.' asParser, self identifier) star) flatten ==> [:t | t second].
	
	imports := (self sea: using) star.
	
	class := ('public' asParser trim optional, 'class' asParser trim, self identifier,  'endclass' asParser trim) 
		==> [:t | t third] .
	file := imports, ((self sea: class) ==> [:t | t second ]) plus.	
	
	result := file parse: text.
	
	self assert: result isPetitFailure not.

]

{ #category : #'tests - complex' }
PPSeaTest >> testFile2 [
	| text using imports class file |
	text := '
	
using a.b.c;
using c.d.e;
// some comment
namespace cde {

class Foo 
endclass

public class 123 // invalid class
public struct {}

class bar endclass
}	
	'.
	
	using := 'using' asParser trim, (self identifier, ('.' asParser, self identifier) star) flatten ==> [:t | t second].
	
	imports := (self sea: using) star.
	
	class := ('public' asParser trim optional, 'class' asParser trim, self identifier,  'endclass' asParser trim) 
		==> [:t | t third] .
	file := imports, ((self sea: class) ==> [:t | t second ]) plus.	
	
	result := file parse: text.
	
	self assert: result isPetitFailure not.

]

{ #category : #'tests - complex' }
PPSeaTest >> testImports [
	| text using imports   |
	text := '

/** whatever */	
using a.b.c;
// another comment
using c.d.e;
// some comment
namespace cde {
}	
	'.
	
	using := 'using' asParser trim, (self identifier, ('.' asParser, self identifier) star) flatten ==> [:t | t second].
	imports := ((self sea: using) ==> [:t | t second ]) star.
	
	result := imports parse: text.
	
	self assert: result size = 2.
	self assert: result first = 'a.b.c'.
	self assert: result second = 'c.d.e'.

]

{ #category : #'tests - indentation' }
PPSeaTest >> testIndentation [
	|  aligns push island p |
	
	aligns := #aligns asParser.
	push := (nil asParser ==> [ :e | 'a' asParser]) push.
	
	island := push, aligns.	
		
	self assert: island parse: 'a'.
	self assert: island fail: '.a'.
	
	p := self sea: island.
	self assert: p  parse: 'a'.
	self assert: p  parse: '..a'.
]

{ #category : #'tests - indentation' }
PPSeaTest >> testIndentation2 [
	|  aligns push  p |
	
	aligns := #aligns asParser.
	push := (nil asParser ==> [ :e | 'a' asParser]) push.
	
	p := push, (self sea: aligns) plus.
	self assert: p  parse: 'a'.
	self assert: p  parse: '..a'.
	self assert: p  parse: '..a.aa'.	
	self assert: p  parse: '..a..a...a'.
	
	self assert: result second size = 3.
]

{ #category : #'tests - indentation' }
PPSeaTest >> testIndentation3 [
	|  aligns push pop  p |
	
	aligns := #aligns asParser.
	push := (nil asParser ==> [ :e | 'a' asParser]) push.
	pop := #pop asParser.
	
	p := push, (self sea: aligns) plus, pop.
	
	self assert: p  parse: 'a'.
	self assert: p  parse: '..a'.
	self assert: p  parse: '..a.aa'.	
	self assert: p  parse: '..a..a...a'.
]

{ #category : #'tests - indentation' }
PPSeaTest >> testIndentationBlock [
	|  begin content end block setIl restoreIl     |
	
	setIl:= #setIl asParser.
	restoreIl := #restoreIl asParser.
	
	begin := setIl, 'begin' asParser ==> [:e | #begin ].
	content := 'foo' asParser.
	end := 'end' asParser, restoreIl ==> [:e | #end ].
	block := PPDelegateParser new.
	
	block setParser: 	begin trimLeft,
								(self sea: (block / content) trimOnside)  star,
							end trimAlign.
			
	self assert: block parse: '
		begin
			foo
			bar
			foo
		end'.

	self assert: result size = 3.
	self assert: result second size = 2.
	self assert: result second first second = 'foo'.
	
	self assert: block parse: '
		begin
			foo
			foo
		end'.

	self assert: result size = 3.
	self assert: result second size = 2.
	self assert: result second first second = 'foo'.
	self assert: result second second second = 'foo'.
]

{ #category : #'tests - indentation' }
PPSeaTest >> testIndentationBlock2 [
	|  begin content end block setIl restoreIl     |
	
	setIl:= #setIl asParser.
	restoreIl := #restoreIl asParser.
		
	begin := setIl, 'begin' asParser ==> [:e | #begin ].
	content := 'foo' asParser plus.
	end := 'end' asParser, restoreIl ==> [:e | #end ].
	block := PPDelegateParser new.
	
	block setParser: 	begin trimLeft,
								(self sea: (block / content) trimOnside)  star,
							end trimAlign.
			
	self assert: block parse: '
		begin
			foo
			bar
			begin
				bar
				foo
				foo
				baz
			end
			bar
			foo
		end'.

	self assert: result size = 3.
	self assert: result second size = 3.
	self assert: result second second second second size = 2.
]

{ #category : #'tests - indentation' }
PPSeaTest >> testIndentationBlock3 [
	|  begin content end block setIl restoreIl     |
	
	setIl:= #setIl asParser.
	restoreIl := #restoreIl asParser.
	
	begin := setIl, 'begin' asParser ==> [:e | #begin ].
	content := 'foo' asParser plus.
	end := 'end' asParser, restoreIl ==> [:e | #end ].
	block := PPDelegateParser new.
	
	block setParser: 	begin trimLeft,
								(self sea: ((block / content) trimOnside)) star,
							end trimAlign.
			
	self assert: block parse: '
		begin
			foo
			begin
				bar
				foo
			end
			begin
				bar
			bar
			foo
		end'.

	self assert: result size = 3.
	self assert: result second size = 3.
]

{ #category : #'tests - indentation' }
PPSeaTest >> testIndentationBlock4 [
	|  begin content end block setIl restoreIl     |
	
	setIl:= #setIl asParser.
	restoreIl := #restoreIl asParser.
	
	begin := setIl, 'begin' asParser ==> [:e | #begin ].
	content := 'foo' asParser plus.
	end := 'end' asParser, restoreIl ==> [:e | #end ].
	block := PPDelegateParser new.
	
	block setParser: 	begin trimLeft,
								(self sea: (block / content) trimOnside) star,
							end trimAlign.
			
	self assert: (block sea ==> #second) star parse: '
		begin
			foo
			bar
			foo
		end
		
		begin
			bar
		
		begin
			foo
			bar
		end'.

	self assert: result size = 2.
	self assert: result first second size = 2.
	self assert: result second second size = 1.	
]

{ #category : #'tests - indentation' }
PPSeaTest >> testIndentationCompare [
	|  aligns p setIl restoreIl |
	
	aligns := self aligns.
	setIl := self setIl.
	restoreIl := self restoreIl.
	
	p := (setIl, aligns, restoreIl, (aligns not)).
	
	self assert: p  parse: ''.
]

{ #category : #testing }
PPSeaTest >> testIslandAfterIslandPlus [
	
	| island2 islandParser2 island1 islandParser1 parser |
	island1 := 'aa' asParser, 'bb' asParser.
	islandParser1 := self seaInstance.
	islandParser1 island: island1.
	
	island2 := 'cc' asParser.
	islandParser2 := self seaInstance.
	islandParser2 island: island2.
	
	parser := (islandParser1, islandParser2) plus.
	 
	result := islandParser1 parse: '__ aabb __ cc __'.
	self assert: result isPetitFailure not.

]

{ #category : #testing }
PPSeaTest >> testIslandAfterIslandPlus2 [
	
	| island2 islandParser2 island1 islandParser1 parser |
	
	island1 := 'aa' asParser, 'bb' asParser.
	islandParser1 := self seaInstance.
	islandParser1 island: island1.
	
	island2 := 'cc' asParser.
	islandParser2 := self seaInstance.
	islandParser2 sea: island2.
	
	parser := (islandParser1, islandParser2) plus.
	 
	result := islandParser1 parse: '__ aaxx __ cc __'.
	self assert: result isPetitFailure.

]

{ #category : #testing }
PPSeaTest >> testIslandDetection [
	| island parser |
	island := 'class' asParser, self identifier trim, 'endclass' asParser.
	parser := self sea: island.
	
	self assert: parser parse: 'class Foo endclass'.
	self assert: result size = 3.
	self assert: result second second = 'Foo'.

	self assert: parser parse: '/*comment*/ class Foo endclass'.
	self assert: result size = 3.
	self assert: result second second = 'Foo'.

	self assert: parser parse: '/*comment class Bar */ class Foo endclass'.
	self assert: result size = 3.
	self assert: result second second = 'Foo'.

	self assert: parser parse: '/*comment class Bar */ class Foo endclass //something more'.
	self assert: result size = 3.
	self assert: result second second = 'Foo'.

	self assert: parser parse: '/*comment class Bar endclass */ class Foo endclass //something more'.
	self assert: result size = 3.
	self assert: result second second = 'Bar'.

]

{ #category : #testing }
PPSeaTest >> testIslandPlus [
	
	| island  parser |
	island := self sea: 'X' asParser.
	parser := island plus.
	
	self assert: parser parse: '....X....'.
	self assert: result size = 1.
	self assert: result first first = '....'.
	self assert: result first third = '....'.

	self assert: parser parse: '...X...X...XX'.
	self assert: result size = 4.

	self assert: result second first = ''.
	self assert: result second third = '...'.
	self assert: result third first = ''.
	self assert: result third third = ''.
	self assert: result fourth first = ''.
	self assert: result fourth third = ''.

	self assert: parser fail: '.....'.
]

{ #category : #testing }
PPSeaTest >> testIslandPlus2 [
	
	| island  parser |
	island := self sea: ('class' asParser, self identifier trim).
	parser := island plus.
	
	self assert: parser parse: '....class Foo....'.
	self assert: result size = 1.
	self assert: result first second second = 'Foo'.


	self assert: parser parse: '....class . class Foo....'.
	self assert: result size = 1.
	self assert: result first second second = 'Foo'.

	self assert: parser parse: '....class . class Foo class Bar....'.
	self assert: result size = 2.
	self assert: result first second second = 'Foo'.
	self assert: result second second second = 'Bar'.



	self assert: parser fail: '.....'.
]

{ #category : #testing }
PPSeaTest >> testIslandSequence [
	
	|  parser   a b c |
	"Island sequence will never cross the boundery of 'c'"
	a := 'a' asParser.
	b := 'b' asParser.
	c := 'c' asParser.
	
	parser := ((self sea: a), (self sea: b)) wrapped, c.
	
	self assert: parser parse: '..a...b...c'.
	self assert: parser fail: '..a..c...b..c'.
	self assert: parser fail: '..c..a.....b..c'.
]

{ #category : #testing }
PPSeaTest >> testIslandSequence2 [
	| p a b |
	
	a := self sea: ('a' asParser plus).
	a name: 'a island'.
	
	b := self sea: 'b' asParser.
	b name: 'b island'.
	
	p := a optional, (b / self nilIsland).
	self assert: p  parse: 'a'.
	self assert: result size = 2.
	self assert: result first notNil.
	self assert: result second size = 3.
	self assert: result second second = nil.
	
	self assert: p parse: '..ab'.
	
	self assert: result isPetitFailure not.
	self assert: result size = 2.
	self assert: result first notNil.
	self assert: result second size = 3.
	self assert: result second second = 'b'.
	
	self assert: p parse: 'a..b'.
	
	self assert: result isPetitFailure not.
	self assert: result size = 2.
	self assert: result first notNil.
	self assert: result second size = 3.
	self assert: result second second = 'b'.
	
	self assert: p parse: 'ab...'.
	
	self assert: result isPetitFailure not.
	self assert: result size = 2.
	self assert: result first notNil.
	self assert: result second size = 3.
	self assert: result second second = 'b'.
	
	self assert: p parse: '...a...b...'.
	
	self assert: result isPetitFailure not.
	self assert: result size = 2.
	self assert: result first notNil.
	self assert: result second size = 3.
	self assert: result second second = 'b'.
	
	self assert: p parse: '...a...b...'.
	
	self assert: result isPetitFailure not.
	self assert: result size = 2.
	self assert: result first notNil.
	self assert: result second size = 3.
	self assert: result second second = 'b'.
	
	self assert: p end parse: '...b...'.
	
	self assert: result isPetitFailure not.
	self assert: result size = 2.
	self assert: result first isNil.
	self assert: result second size = 3.
	self assert: result second second = 'b'.
]

{ #category : #testing }
PPSeaTest >> testIslandSequence3 [
	
	| parser   body class extends |
	class := self sea: 'class' asParser trim, self identifier trim.	
	extends := self sea: 'extends' asParser trim, self identifier trim.
	body := self sea: self nestedBlock.

	parser := (class, extends optional, body) plus.
	self assert: parser parse: '
	/* lorem ipsum */ 
	class Foo { whatever } 
	
	// something more 
	class Bar extends Zorg { blah blah bla } 
	// this is the end'.
	
	self assert: result isPetitFailure not.
	self assert: result size = 2. 
]

{ #category : #testing }
PPSeaTest >> testIslandSequence4 [
	
	|  parser  a b c  eps |
	"Island sequence will never cross the boundery of 'c'"
	a := 'a' asParser.
	b := 'b' asParser.
	c := 'c' asParser.
	eps := nil asParser.
	
	parser := (self sea: a), b optional, (self sea: eps), c.
	
	self assert: parser parse: '..a...b...c'.
	"This fails, but it should not. Right now, the problem is, that eps island 
		does not allow for epsilon parse, if the current position is the water
		position. Yet, in this case, it should allow for.
		
		You should find a better way, how to prefer non-epsilon parses than using
		nonEpsilon (used right now)
	"
	self assert: parser parse: 'ac'.
	self assert: parser parse: '..a...c'.
]

{ #category : #testing }
PPSeaTest >> testIslandStar [
	|  p  |
	
	
	p := (self sea: 'a' asParser) star, 'b' asParser. 
	self assert: p parse: 'b'.
	self assert: result size = 2.
	self assert: result first size = 0.
	
	self assert: p parse: 'ab'.
	self assert: result size = 2.
	self assert: result first size = 1.
	
	self assert: p parse: 'aab'.
	self assert: result size = 2.
	self assert: result first size = 2.
	
	self assert: p parse: '...aab'.
	self assert: result size = 2.
	self assert: result first size = 2.
	
	self assert: p parse: '...aa...b'.
	self assert: result size = 2.
	self assert: result first size = 2.
	
	self assert: p parse: '...a...a...b'.
	self assert: result size = 2.
	self assert: result first size = 2.

	self assert: p parse: '...a...a...aa...b'.
	self assert: result size = 2.
	self assert: result first size = 4.
	
	"Thats the question, if I want this:"
	self assert: p fail: '...b'.

]

{ #category : #testing }
PPSeaTest >> testIslandStar2 [
	|  p  |
	
	
	p := (self sea: 'a' asParser) star, 'b' asParser optional. 
	self assert: p parse: 'aa'.
	self assert: result size = 2.
	self assert: result first size = 2.
	
	self assert: p parse: '....aa'.
	self assert: result size = 2.
	self assert: result first size = 2.
	
	self assert: p parse: '...a...a...'.
	self assert: result size = 2.
	self assert: result first size = 2.
	
	self assert: p parse: '...a...a...b'.
	self assert: result size = 2.
	self assert: result first size = 2.
	self assert: result second = 'b'.
]

{ #category : #testing }
PPSeaTest >> testIslandStar3 [
	|  p  |
	
	
	p := (self sea: 'a' asParser) star, (self sea: nil asParser). 
	
	self assert: p parse: '....'.
	self assert: result size = 2.
	self assert: result first size = 0.
	
	self assert: p parse: 'aa'.
	self assert: result size = 2.
	self assert: result first size = 2.
	
	self assert: p parse: '....aa'.
	self assert: result size = 2.
	self assert: result first size = 2.
	
	self assert: p parse: '...a...a...'.
	self assert: result size = 2.
	self assert: result first size = 2.
	
	self assert: p parse: '...a...a...b'.
	self assert: result size = 2.
	self assert: result first size = 2.
	self assert: result second second = nil.
]

{ #category : #'tests - water objects' }
PPSeaTest >> testMultilineComment [
	|  parser |
	parser := self multilineCommentParser.
	
	self assert: parser parse: '/* hello there */'.
	self assert: parser parse: '/* class Bar endclass */'.

]

{ #category : #testing }
PPSeaTest >> testNestedIsland [
	
	|  nestedIsland before after topIsland |
	nestedIsland := self sea: 'X' asParser.
	
	before := 'before' asParser.
	after := 'after' asParser.
	topIsland := self sea: (before, nestedIsland, after).
	
	self assert: nestedIsland parse: 'before...X...ater'.
	self assert: topIsland parse: 'beforeXafter'.
	
	self assert: topIsland parse: '....before..X..after....'.
	self assert: result size = 3.
	self assert: result second size = 3.
	self assert: result second second size = 3.
	self assert: result second second second = 'X'.
	
	self assert: topIsland parse: '....X....before...X....after'.
	self assert: topIsland parse: '....before.......after....before..X...after'.

	self assert: topIsland fail: '....before.......after...'.	
	self assert: topIsland fail: '....before.......after...X'.	
	self assert: topIsland fail: '....before.......after...X...after'.		

]

{ #category : #testing }
PPSeaTest >> testNestedIsland2 [
	
	|  nestedIsland before after topIsland |
	nestedIsland := self sea: 'after' asParser.
	
	before := 'before' asParser.
	after := 'after' asParser.
	topIsland := self sea: (before, nestedIsland, after).
	
	self assert: nestedIsland parse: '..after..'.
	self assert: topIsland parse: 'before..after..after'.
	self assert: topIsland parse: '....before...after....after...'.
	self assert: topIsland fail: '....before...after...'.
	
	topIsland := self sea: (before, (nestedIsland / (nil asParser sea)), after).
	self assert: topIsland parse: '....before...after....after...'.
	self assert: topIsland parse: '..before...after..'.


]

{ #category : #testing }
PPSeaTest >> testNilIsland [
	
	| nilIsland  p |

	nilIsland := self nilIsland.
	

	p := ${ asParser, nilIsland, $} asParser.

	self assert: p parse: '{}'.
	
	self assert: result isCollection.
	self assert: result size = 3.
	self assert: result first = ${.
	self assert: result third = $}.	
	

	self assert: p parse: '{ }'.
	self assert: result isCollection.
	self assert: result size = 3.
	self assert: result first = ${.
	self assert: result third = $}.
	

	self assert: p parse: '{ ... }'.
	self assert: result isCollection.
	self assert: result size = 3.
	self assert: result first = ${.
	self assert: result third = $}.
]

{ #category : #'tests - nonempty' }
PPSeaTest >> testNonEmptyParser [
	| p |
	p := 'a' asParser optional nonEmpty.
	
	self assert: p parse: 'a'.
	self assert: p fail: ''.
]

{ #category : #'tests - nonempty' }
PPSeaTest >> testNonEmptyParser2 [
	| p |
	context := PPContext new.
	
	context propertyAt: #foo put: #baz.
	p := [ :ctx | ctx propertyAt: #foo put: #bar ] asParser nonEmpty.
	
	result := p parse: '' withContext: context.
	self assert: (context propertyAt: #foo) = #baz. 
	self assert: result isPetitFailure.
]

{ #category : #testing }
PPSeaTest >> testOptionalIsland [
	
	| island parser   |
	
	island := self sea: ('a' asParser / 'b' asParser optional).
	parser := island, 'c' asParser.
	
	self assert: parser parse: '....a....b...c'.
	self assert: result first second = 'a'.
	self assert: result second = 'c'.
	
	self assert: parser parse: '....d....b...c'.
	self assert: result first second = 'b'.
	self assert: result second = 'c'.
	
	self assert: parser parse: '....d....d...c'.
	self assert: result first second = nil.
	self assert: result second = 'c'.

	self assert: parser parse: '...c'.
]

{ #category : #'tests - water objects' }
PPSeaTest >> testWaterObjects [
	| parser |
	parser := (self sea: ('class' asParser, self identifier trim, 'endclass' asParser ==> #second)) star.

	self assert: parser parse: ' /* hello there */ class Foo endclass'.
	self assert: result size = 1.
	self assert: result first second = 'Foo'.
	
	self assert: parser parse: ' /* class Bar endclass */ class Foo endclass'.
	self assert: result size = 2.
	self assert: result first second = 'Bar'.
	self assert: result second second = 'Foo'.
	
	parser := (self sea: ('class' asParser, self identifier trim, 'endclass' asParser ==> #second) water: self multilineCommentParser / #any asParser) star.

	self assert: parser parse: ' /* class Bar endclass */ class Foo endclass'.
	self assert: result size = 1.
	self assert: result first second = 'Foo'.
]

{ #category : #'tests - water objects' }
PPSeaTest >> testWaterObjects2 [
	| parser source |
	context := PPContext new.

	parser := (self sea: ('class' asParser, self identifier trim, 'endclass' asParser ==> #second)
						 water: self multilineCommentParser / self singleCommentParser / #any asParser) 				star.
	
	source := ' /* class Bar endclass */ 
	class Foo 
	endclass
	/* 
	   class Borg
	   endclass
	*/
	// class Qwark endclass 
	class Zorg 
	endclass
	'.
	
	self assert: parser parse: source.
	self assert: result size = 2.
	self assert: result first second = 'Foo'.	
	self assert: result second second = 'Zorg'.	

]
