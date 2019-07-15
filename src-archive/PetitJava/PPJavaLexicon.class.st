"
A parser with a definitions for some basic Java gramar parts

Grammar rules follow as closely as possible the specification found in ""The Java Language Specification Third Edition""

URL = 
"
Class {
	#name : #PPJavaLexicon,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'unicodeEscape',
		'rawInputCharacter',
		'unicodeMarker',
		'hexDigit',
		'lineTerminator',
		'unicodeInputCharacter',
		'inputElements',
		'sub',
		'inputElement',
		'whiteSpace',
		'comment',
		'javaToken',
		'keyword',
		'literal',
		'separator',
		'operator',
		'identifier',
		'traditionalComment',
		'endOfLineComment',
		'commentTail',
		'charactersInLine',
		'commentTailStar',
		'notStar',
		'notStarNotSlash',
		'inputCharacter',
		'booleanLiteral',
		'nullLiteral',
		'identifierChars',
		'javaLetter',
		'javaLetterOrDigit',
		'keywords',
		'floatingPointLiteral',
		'integerLiteral',
		'characterLiteral',
		'stringLiteral',
		'hexIntegerLiteral',
		'octalIntegerLiteral',
		'decimalIntegerLiteral',
		'decimalNumeral',
		'integerTypeSuffix',
		'hexNumeral',
		'octalNumeral',
		'nonZeroDigit',
		'digits',
		'hexDigits',
		'octalDigits',
		'octalDigit',
		'hexadecimalFloatingPointLiteral',
		'decimalFloatingPointLiteral',
		'exponentPart',
		'floatTypeSuffix',
		'exponentIndicator',
		'signedInteger',
		'sign',
		'hexSignificand',
		'binaryExponent',
		'binaryExponentIndicator',
		'escapeSequence',
		'singleCharacter',
		'stringCharacters',
		'stringCharacter',
		'octalEscape',
		'zeroToThree',
		'input',
		'operators',
		'separators',
		'trueToken',
		'falseToken',
		'nullToken'
	],
	#category : #'PetitJava-Core'
}

{ #category : #accessing }
PPJavaLexicon class >> ignoredNames [
	"Answer a collection of instance-variables that should not be automatically initialized with productions, but that are used internal to the composite parser."

	| newArray |	
	newArray := Array new: ((self namesToIgnore size) + (super ignoredNames size)).
	newArray
		replaceFrom: 1
		to: self namesToIgnore size
		with: self namesToIgnore.
	newArray
		replaceFrom: (self namesToIgnore size + 1)
		to: newArray size
		with: super ignoredNames.	
	^newArray
]

{ #category : #accessing }
PPJavaLexicon class >> namesToIgnore [

	^#('keywords' 'operators' 'separators')
]

{ #category : #utility }
PPJavaLexicon >> asToken: aParser [

	^aParser javaToken
]

{ #category : #'grammar-literals-floating' }
PPJavaLexicon >> binaryExponent [

 ^ binaryExponentIndicator , signedInteger
]

{ #category : #'grammar-literals-floating' }
PPJavaLexicon >> binaryExponentIndicator [

  ^ PP2PredicateObjectNode anyOf: 'pP'
]

{ #category : #'grammar-literals-boolean' }
PPJavaLexicon >> booleanLiteral [ 

 ^ trueToken / falseToken
]

{ #category : #'grammar-literals-character' }
PPJavaLexicon >> characterLiteral [ 

 ^ ($' asPParser , ( escapeSequence / singleCharacter ), $' asPParser) javaToken
]

{ #category : #'grammar-comments' }
PPJavaLexicon >> charactersInLine [   

	^ inputCharacter plus
]

{ #category : #'grammar-comments' }
PPJavaLexicon >> comment [
	"traditional -> /*
	 endOfLine -> //"
	^ traditionalComment / endOfLineComment
]

{ #category : #'grammar-comments' }
PPJavaLexicon >> commentTail [

	^ 	('*' asPParser , commentTailStar ) /
		(notStar , commentTail)
]

{ #category : #'grammar-comments' }
PPJavaLexicon >> commentTailStar [ 

	^ ('/' asPParser ) /
	  ('*' asPParser , commentTailStar ) /
	  (notStarNotSlash , commentTail )
]

{ #category : #'grammar-literals-floating' }
PPJavaLexicon >> decimalFloatingPointLiteral [

	|dot|
	dot := $. asPParser.

 ^ ( ( (dot , digits) 
        / 
        (digits , dot , digits optional)) , 
			exponentPart optional , floatTypeSuffix optional ) 
  	/ 
  	(digits , 
		( (exponentPart , floatTypeSuffix optional) 
		  /
		  (exponentPart optional , floatTypeSuffix) ))
]

{ #category : #'grammar-literals-integer' }
PPJavaLexicon >> decimalIntegerLiteral [

 ^ decimalNumeral , (integerTypeSuffix optional)
]

{ #category : #'grammar-literals-integer' }
PPJavaLexicon >> decimalNumeral [ 

	^($0 asPParser) / (nonZeroDigit , digits optional) 
]

{ #category : #'grammar-literals-integer' }
PPJavaLexicon >> digits [ 
	"digit is already defined, no need to redefine it"
	^#digit asPParser plus
]

{ #category : #utility }
PPJavaLexicon >> emptySquaredParenthesis [

	^ self asToken: '[' asPParser trim, ']' asPParser
]

{ #category : #'grammar-comments' }
PPJavaLexicon >> endOfLineComment [ 

	^ '//' asPParser , charactersInLine optional
]

{ #category : #'grammar-literals-escape' }
PPJavaLexicon >> escapeSequence [ 

	^ ($\ asPParser , (PP2PredicateObjectNode anyOf: 'btnfr""''\' ) ) /
	   octalEscape 
]

{ #category : #'grammar-literals-floating' }
PPJavaLexicon >> exponentIndicator [

  ^ PP2PredicateObjectNode anyOf: 'eE'
]

{ #category : #'grammar-literals-floating' }
PPJavaLexicon >> exponentPart [

 ^ exponentIndicator , signedInteger
]

{ #category : #'grammar-literals-boolean' }
PPJavaLexicon >> falseToken [
	^ ('false' asPParser , #word asPParser not) javaToken
]

{ #category : #'grammar-literals-floating' }
PPJavaLexicon >> floatTypeSuffix [

	^ PP2PredicateObjectNode anyOf: 'fFdD'
]

{ #category : #'grammar-literals-floating' }
PPJavaLexicon >> floatingPointLiteral [

  ^ (hexadecimalFloatingPointLiteral / decimalFloatingPointLiteral) javaToken
]

{ #category : #'grammar-unicode-escapes' }
PPJavaLexicon >> hexDigit [ 

	^#hex asPParser
]

{ #category : #'grammar-literals-integer' }
PPJavaLexicon >> hexDigits [ 

	^hexDigit plus
]

{ #category : #'grammar-literals-integer' }
PPJavaLexicon >> hexIntegerLiteral [ 

  ^ hexNumeral , (integerTypeSuffix optional)
]

{ #category : #'grammar-literals-integer' }
PPJavaLexicon >> hexNumeral [ 

	^$0 asPParser, (PP2PredicateObjectNode anyOf: 'xX' ), hexDigits
]

{ #category : #'grammar-literals-floating' }
PPJavaLexicon >> hexSignificand [ 
	|dot|
	dot := $. asPParser.

 ^  (hexNumeral , dot optional) /
    ($0 asPParser , (PP2PredicateObjectNode anyOf: 'xX') , hexDigits optional , dot , hexDigits )
]

{ #category : #'grammar-literals-floating' }
PPJavaLexicon >> hexadecimalFloatingPointLiteral [

 ^ hexSignificand , binaryExponent , floatTypeSuffix optional
]

{ #category : #'grammar-identifiers' }
PPJavaLexicon >> identifier [ 

	^  self asToken: (((keyword not) , (booleanLiteral not) , (nullLiteral not) , identifierChars ))
]

{ #category : #'grammar-identifiers' }
PPJavaLexicon >> identifierChars [
	
	^ javaLetter plus , javaLetterOrDigit star
]

{ #category : #initialization }
PPJavaLexicon >> initialize [

	super initialize.
	
	self initializeKeywords.
	self initializeOperators.
	self initializeSeparators.
]

{ #category : #initialization }
PPJavaLexicon >> initializeKeywords [

	| values |
	keywords := Dictionary new.
	values := #('abstract' 'assert' 'boolean' 'break' 'byte' 'case'  'catch' 'char' 'class' 'const'
	   'continue' 'default' 'do' 'double' 'else' 'enum' 'extends' 'final'  'finally' 'float'
	   'for' 'if' 'goto' 'implements' 'import' 'instanceof' 'int' 'interface' 'long' 'native'
	   'new' 'package' 'private' 'protected' 'public' 'return' 'short' 'static' 'strictfp' 'super'
	   'switch' 'synchronized' 'this' 'throw' 'throws' 'transient' 'try' 'void' 'volatile' 'while').
	
	values do: [:eachKeyword |
		keywords at: eachKeyword 
			put: (PP2UnresolvedNode named: ('keyword', eachKeyword first asUppercase asString , eachKeyword allButFirst))		
		].
	
	keywords keysAndValuesDo:  [:key :value |
		(keywords at: key) def: (key asPParser ,  #word asPParser not)]
]

{ #category : #initialization }
PPJavaLexicon >> initializeOperators [

	| values |
	operators := Dictionary new.
	values := #(	'>>>=' '>>>' '>>=' '>>' '>=' '>'	'<<=' '<<' '<=' '<'	'++' '+=' '+'	'--' '-=' '-'	'&&' '&=' '&'
					'||' '|=' '|'	'*=' '*'	'%=' '%'	'/=' '/'	'^=' '^'	'!=' '!'	'==' '='	'~'	'?'	':'	'@' ).
	" @ ? perhaps for annotation but not in the doc "
	values do: [:eachOperator |
		operators at: eachOperator 
			put: (PP2UnresolvedNode named: ('operator', eachOperator asString))		
		].
	
	operators  keysAndValuesDo:  [:key :value |
		(operators at: key) def: (key asPParser)]
]

{ #category : #initialization }
PPJavaLexicon >> initializeSeparators [

	| values |
	separators := Dictionary new.
	values := #( '(' ')' '{' '}' '[' ']' ';' ',' '.' ).
	
	values do: [:eachSeparator |
		separators at: eachSeparator 
			put: (PP2UnresolvedNode named: ('separator', eachSeparator asString))		
		].
	
	separators  keysAndValuesDo:  [:key :value |
		(separators at: key) def: (key asPParser)]
]

{ #category : #'grammar-input' }
PPJavaLexicon >> input [

	^ (inputElements optional) , (sub optional)
]

{ #category : #'grammar-lineTerminators' }
PPJavaLexicon >> inputCharacter [ 

	^(lineTerminator not) , unicodeInputCharacter ==> #second
]

{ #category : #'grammar-input' }
PPJavaLexicon >> inputElement [

	^ whiteSpace / comment / javaToken
]

{ #category : #'grammar-input' }
PPJavaLexicon >> inputElements [

	^ inputElement plus
]

{ #category : #'grammar-literals-integer' }
PPJavaLexicon >> integerLiteral [

  ^ (hexIntegerLiteral / octalIntegerLiteral / decimalIntegerLiteral) javaToken
]

{ #category : #'grammar-literals-integer' }
PPJavaLexicon >> integerTypeSuffix [

	^ PP2PredicateObjectNode anyOf: 'lL'
]

{ #category : #'grammar-identifiers' }
PPJavaLexicon >> javaLetter [

	^ (#letter asPParser) / (PP2PredicateObjectNode anyOf: '_$')
]

{ #category : #'grammar-identifiers' }
PPJavaLexicon >> javaLetterOrDigit [

	^ javaLetter / (#digit asPParser)
]

{ #category : #'grammar-input' }
PPJavaLexicon >> javaToken [


	^ identifier / keyword / literal / separator / operator
]

{ #category : #'grammar-keywords' }
PPJavaLexicon >> keyword [

		| keywordParsers |
		
		keywordParsers := keywords keys asSortedCollection collect: [:eachKey | keywords at: eachKey ].
		^ self asToken: ( (keywordParsers reduce: [ :a :b | a / b ]) )

	"Modified (format): / 21-04-2015 / 15:27:29 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'grammar-lineTerminators' }
PPJavaLexicon >> lineTerminator [

	self flag: 'Hack alert - should be fixed immediately in PJTraditionalCommentsNode>>comment:'.

		^ (((Character codePoint: 10) asPParser) ==> [ :lf | Array with: lf with: nil ])
		  / (((Character codePoint: 13) asPParser , ((Character codePoint: 10) asPParser ) optional )) ==> [ :nodes | Array with: nodes first with: nil ]

	"Modified: / 21-04-2015 / 17:16:50 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'grammar-literals' }
PPJavaLexicon >> literal [
	"a literal must be a single token. Whitespaces are not allowed inside the literal"
	
	^ nullLiteral / booleanLiteral / floatingPointLiteral / integerLiteral / characterLiteral / stringLiteral
]

{ #category : #'grammar-literals-integer' }
PPJavaLexicon >> nonZeroDigit [ 

	^PP2PredicateObjectNode anyOf: '123456789'.
]

{ #category : #'grammar-comments' }
PPJavaLexicon >> notStar [

	^  ('*' asPParser not , inputCharacter)/lineTerminator
]

{ #category : #'grammar-comments' }
PPJavaLexicon >> notStarNotSlash [  

	^ lineTerminator / ((PP2PredicateObjectNode anyOf: '*/') not , inputCharacter )
]

{ #category : #'grammar-literals-null' }
PPJavaLexicon >> nullLiteral [ 

 ^ nullToken
]

{ #category : #'grammar-literals-boolean' }
PPJavaLexicon >> nullToken [
	^ ('null' asPParser , #word asPParser not) javaToken
]

{ #category : #'grammar-literals-integer' }
PPJavaLexicon >> octalDigit [ 

	^PP2PredicateObjectNode anyOf: '01234567'
]

{ #category : #'grammar-literals-integer' }
PPJavaLexicon >> octalDigits [

	^ octalDigit plus
]

{ #category : #'grammar-literals-escape' }
PPJavaLexicon >> octalEscape [

	^ $\ asPParser , ( (zeroToThree , octalDigit , octalDigit) / (octalDigit , octalDigit optional) )
]

{ #category : #'grammar-literals-integer' }
PPJavaLexicon >> octalIntegerLiteral [ 

 ^ octalNumeral , (integerTypeSuffix optional)
]

{ #category : #'grammar-literals-integer' }
PPJavaLexicon >> octalNumeral [ 

	^($0 asPParser) , octalDigits
]

{ #category : #'grammar-operators' }
PPJavaLexicon >> operator [
		| operatorParsers |
		
		operatorParsers := operators keys asSortedCollection collect: [:eachKey | operators at: eachKey ].                                                
		^self asToken:  (operatorParsers reduce: [ :a :b | a / b ])

	"Modified: / 21-04-2015 / 15:26:21 / Jan Vrany <jan.vrany@fit.cvut.cz>"
]

{ #category : #'grammar-unicode-escapes' }
PPJavaLexicon >> rawInputCharacter [

	^#any asPParser
]

{ #category : #'grammar-separators' }
PPJavaLexicon >> separator [	
	^self asToken: (PP2PredicateObjectNode anyOf: '(){}[];,.' )
]

{ #category : #'grammar-literals-floating' }
PPJavaLexicon >> sign [

  ^ PP2PredicateObjectNode anyOf: '-+'
]

{ #category : #'grammar-literals-floating' }
PPJavaLexicon >> signedInteger [

  ^ sign optional , digits
]

{ #category : #'grammar-literals-character' }
PPJavaLexicon >> singleCharacter [ 	

	^( PP2PredicateObjectNode anyOf: '''\') not , inputCharacter ==> #second
]

{ #category : #accessing }
PPJavaLexicon >> start [
	"Default start production."

	^ input end
]

{ #category : #'grammar-literals-string' }
PPJavaLexicon >> stringCharacter [
		
	^ ( ( PP2PredicateObjectNode anyOf: '"\') not , inputCharacter ==> #second ) /
	   escapeSequence 
]

{ #category : #'grammar-literals-string' }
PPJavaLexicon >> stringCharacters [

	^ stringCharacter plus
]

{ #category : #'grammar-literals-string' }
PPJavaLexicon >> stringLiteral [ 

 ^ ($" asPParser , stringCharacters optional , $" asPParser) javaToken
]

{ #category : #'grammar-input' }
PPJavaLexicon >> sub [

	^ (Character value: 26) asPParser 
]

{ #category : #utility }
PPJavaLexicon >> tokenFor: aString [

	^self asToken: (keywords at: aString 
						ifAbsent: [separators at: aString 
							ifAbsent: [operators at: aString] ])
]

{ #category : #'grammar-comments' }
PPJavaLexicon >> traditionalComment [

	^ '/*' asPParser , commentTail
]

{ #category : #'grammar-literals-boolean' }
PPJavaLexicon >> trueToken [
	^ ('true' asPParser , #word asPParser not) javaToken
]

{ #category : #'grammar-unicode-escapes' }
PPJavaLexicon >> unicodeEscape [

	^ $\ asPParser , unicodeMarker , hexDigit , hexDigit , hexDigit , hexDigit
]

{ #category : #'grammar-unicode-escapes' }
PPJavaLexicon >> unicodeInputCharacter [
	 ^ unicodeEscape / rawInputCharacter
]

{ #category : #'grammar-unicode-escapes' }
PPJavaLexicon >> unicodeMarker [

	^$u asPParser plus
]

{ #category : #'grammar-whiteSpace' }
PPJavaLexicon >> whiteSpace [

	^ (Character space asPParser ) /
	  (Character tab asPParser ) /
	  ((Character value: 12) asPParser ) /
		lineTerminator 
]

{ #category : #'grammar-literals-escape' }
PPJavaLexicon >> zeroToThree [

	^PP2PredicateObjectNode anyOf: '0123'
]
