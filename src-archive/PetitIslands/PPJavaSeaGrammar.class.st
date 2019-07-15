"
A JavaParser is a island parser, that can extract method names from a java file.

Instance Variables
	arguments:		<Object>
	block:		<Object>
	classBody:		<Object>
	classDef:		<Object>
	classId:		<Object>
	javaClass:		<Object>
	javaClassIsland:		<Object>
	methodBody:		<Object>
	methodDef:		<Object>
	methodModifiers:		<Object>
	methodName:		<Object>
	modifiers:		<Object>
	semicolon:		<Object>
	throws:		<Object>
	type:		<Object>

arguments
	- xxxxx

block
	- xxxxx

classBody
	- xxxxx

classDef
	- xxxxx

classId
	- xxxxx

javaClass
	- xxxxx

javaClassIsland
	- xxxxx

methodBody
	- xxxxx

methodDef
	- xxxxx

methodModifiers
	- xxxxx

methodName
	- xxxxx

modifiers
	- xxxxx

semicolon
	- xxxxx

throws
	- xxxxx

type
	- xxxxx

"
Class {
	#name : #PPJavaSeaGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'javaClass',
		'classDef',
		'classBody',
		'methodDef',
		'arguments',
		'methodBody',
		'methodName',
		'block',
		'modifiers',
		'classId',
		'type',
		'javaClassSea',
		'methodModifiers',
		'semicolon',
		'comment',
		'singleLineComment',
		'string',
		'water',
		'letters',
		'spaces',
		'javaClassInClassBody',
		'methodDefInClassBody'
	],
	#category : #'PetitIslands-Examples'
}

{ #category : #method }
PPJavaSeaGrammar >> arguments [
	^ $( asParser, nil asParser sea,  $) asParser trim
]

{ #category : #class }
PPJavaSeaGrammar >> block [
	^ (${ asParser,
		((block sea: water) plus / nil asParser sea: water),
	$} asParser) ==> [:tokens | nil ]
		
]

{ #category : #class }
PPJavaSeaGrammar >> classBody [
	 ^ 
	(${ asParser,
		(
		(
			((methodDefInClassBody / javaClassInClassBody) sea: water) ==> #second
		) plus /
		((nil asParser sea: water) ==> [ :tokens | OrderedCollection new ])
		),
	$} asParser) 
	
	map: [:_open :_content :_close | _content ]
]

{ #category : #class }
PPJavaSeaGrammar >> classDef [
	^ (modifiers trim, 'class' asParser, classId trim)
]

{ #category : #class }
PPJavaSeaGrammar >> classId [
	^ (#uppercase asParser, (#letter asParser / #digit asParser / $_ asParser) star) flatten 
]

{ #category : #support }
PPJavaSeaGrammar >> collectMethodNames: javaClassResult [
	| name methods |
	self halt: 'deprecated'.
	name := javaClassResult first.
	methods := javaClassResult second.
	
	^ methods collect: [ :m | Array with: name with: methods first with: methods second ]
]

{ #category : #'comments and strings' }
PPJavaSeaGrammar >> comment [
	| end |
	end := '*/' asParser.
	^ ('/*' asParser, (end negate star), end)
]

{ #category : #class }
PPJavaSeaGrammar >> javaClass [
	^ classDef, ((classBody sea:water) ==> #second)
]

{ #category : #class }
PPJavaSeaGrammar >> javaClassInClassBody [
	^ javaClass
]

{ #category : #class }
PPJavaSeaGrammar >> javaClassSea [
	^ (javaClass sea: water) ==> #second
]

{ #category : #method }
PPJavaSeaGrammar >> letters [
	^ (#letter asParser plus)
]

{ #category : #method }
PPJavaSeaGrammar >> methodBody [ 
	^ semicolon / block
]

{ #category : #method }
PPJavaSeaGrammar >> methodDef [
	^ methodModifiers, 
		((type sea: water), ((methodName, arguments) sea:water)) wrapped, 
		methodBody
]

{ #category : #method }
PPJavaSeaGrammar >> methodDefInClassBody [
	^ methodDef
]

{ #category : #class }
PPJavaSeaGrammar >> methodModifiers [
	^( ('public' asParser / 'private' asParser / 'protected' asParser) optional, 
	  'static' asParser trim optional, 
	  'final' asParser trim optional,
	  'abstract' asParser trim optional,
	  'synchronized' asParser trim optional,	
	  'native' asParser trim optional) ==> [ :tokens | nil ]
]

{ #category : #method }
PPJavaSeaGrammar >> methodName [
	^ ((#letter asParser / $_ asParser), (#letter asParser / #digit asParser / $_ asParser) star) flatten trimBlanks
]

{ #category : #class }
PPJavaSeaGrammar >> modifiers [
	^ ('public' asParser / 'private' asParser) optional, 'final' asParser trim optional, 'abstract' asParser trim optional
]

{ #category : #method }
PPJavaSeaGrammar >> semicolon [
	^ ';' asParser
]

{ #category : #'comments and strings' }
PPJavaSeaGrammar >> singleLineComment [
	| end |
	end := #newline asParser.
	^ ('//' asParser, (end negate star), end)
]

{ #category : #method }
PPJavaSeaGrammar >> spaces [
	^ #space asParser plus
]

{ #category : #accessing }
PPJavaSeaGrammar >> start [
	^ javaClassSea
]

{ #category : #'comments and strings' }
PPJavaSeaGrammar >> string [
	| end |
	end := $" asParser.
	^ ($" asParser, (#any asParser starLazy: end), end)
		name: 'stringSeq';
		yourself.
]

{ #category : #method }
PPJavaSeaGrammar >> throws [
	self halt: 'deprecated'.
	^ 'throws' asParser trim, type trim, ($, asParser, type trim) star
]

{ #category : #method }
PPJavaSeaGrammar >> type [
	^ (#letter asParser, (#letter asParser / #digit asParser / $_ asParser) star) flatten 
]

{ #category : #method }
PPJavaSeaGrammar >> water [
	"
		This will allow to skip over
			- Strings, 
			- Comments 
			- and blocks 
		when parsing water. This way, comments and strings cannot confuse the result.
	"

	^ comment / string / singleLineComment / block / letters / spaces / #any asParser
]
