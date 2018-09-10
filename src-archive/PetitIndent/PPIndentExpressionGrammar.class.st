"
I am an expression grammar where parentheses ( ) are replaced by indent and dedent
"
Class {
	#name : #PPIndentExpressionGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'add',
		'prod',
		'term',
		'mul',
		'prim',
		'parens',
		'number',
		'indent',
		'dedent',
		'nl'
	],
	#category : #'PetitIndent-Examples'
}

{ #category : #accessing }
PPIndentExpressionGrammar >> add [
   ^ prod , ($+ asParser olToken trimBlanks), term
]

{ #category : #'indent-dedent' }
PPIndentExpressionGrammar >> dedent [
	^ nl optional, #dedentOL asParser ==> #second
]

{ #category : #'indent-dedent' }
PPIndentExpressionGrammar >> indent [
	^ nl optional, #indentOL asParser ==> #second
]

{ #category : #accessing }
PPIndentExpressionGrammar >> mul [
   ^ prim , ($* asParser olToken trimBlanks) , prod
]

{ #category : #'indent-dedent' }
PPIndentExpressionGrammar >> nl [
	^ #newline asParser
]

{ #category : #accessing }
PPIndentExpressionGrammar >> number [
	| digit |
	digit := #digit asParser.
   ^ digit plus olToken ==> [ :token | token inputValue asNumber ]
]

{ #category : #accessing }
PPIndentExpressionGrammar >> parens [
   ^ indent, term , dedent
]

{ #category : #accessing }
PPIndentExpressionGrammar >> prim [
   ^ parens / number
]

{ #category : #accessing }
PPIndentExpressionGrammar >> prod [
   ^ mul / prim
]

{ #category : #accessing }
PPIndentExpressionGrammar >> start [
   ^ term end
]

{ #category : #accessing }
PPIndentExpressionGrammar >> term [
   ^ add / prod
]
