"
I define the scanner and parser for the FL programming language using the parser combinator framework PetitParser.
"
Class {
	#name : #FLFactorialGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'apply',
		'binary',
		'condition',
		'expression',
		'function',
		'literal',
		'operation',
		'variable',
		'add',
		'close',
		'cmp',
		'else',
		'equal',
		'id',
		'if',
		'num',
		'open',
		'sub',
		'then'
	],
	#category : #'Factorial-Language'
}

{ #category : #token }
FLFactorialGrammar >> add [
	^ $+ asParser flatten trim
]

{ #category : #grammar }
FLFactorialGrammar >> apply [
	^ open , id , expression star , close
]

{ #category : #grammar }
FLFactorialGrammar >> binary [
	^ open , expression , operation , expression , close
]

{ #category : #token }
FLFactorialGrammar >> close [
	^ $) asParser flatten trim
]

{ #category : #token }
FLFactorialGrammar >> cmp [
	^ '==' asParser flatten trim
]

{ #category : #grammar }
FLFactorialGrammar >> condition [
	^ if , expression , then , expression , else , expression
]

{ #category : #token }
FLFactorialGrammar >> else [
	^ 'else' asParser flatten trim
]

{ #category : #token }
FLFactorialGrammar >> equal [
	^ $= asParser flatten trim
]

{ #category : #grammar }
FLFactorialGrammar >> expression [
	^ apply / condition / binary / variable / literal
]

{ #category : #grammar }
FLFactorialGrammar >> function [
	^ id , variable star , equal , expression
]

{ #category : #token }
FLFactorialGrammar >> id [
	^ #letter asParser plus flatten trim
]

{ #category : #token }
FLFactorialGrammar >> if [
	^ 'if' asParser flatten trim
]

{ #category : #grammar }
FLFactorialGrammar >> literal [
	^ num
]

{ #category : #token }
FLFactorialGrammar >> num [
	^ #digit asParser plus flatten trim
]

{ #category : #token }
FLFactorialGrammar >> open [
	^ $( asParser flatten trim
]

{ #category : #grammar }
FLFactorialGrammar >> operation [
	^ cmp / add / sub
]

{ #category : #accessing }
FLFactorialGrammar >> start [
	^ function end
]

{ #category : #token }
FLFactorialGrammar >> sub [
	^ $- asParser flatten trim
]

{ #category : #token }
FLFactorialGrammar >> then [
	^ 'then' asParser flatten trim
]

{ #category : #grammar }
FLFactorialGrammar >> variable [
	^ id
]
