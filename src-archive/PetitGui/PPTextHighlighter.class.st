"
This is a utility class for creating a highlighted text. For this we need:
- a parser: PPParser
- an attributeMapper

Here is a template to use it:

PPTextHighlighter new
	parser: YourParser new;
	color: 'tokenName1' with: Color blue;
	color: 'tokenName2' with: Color gray;
	highlight: aString.
	
There is more to this as one can also use bold: etc to add further TextAttributes.
"
Class {
	#name : #PPTextHighlighter,
	#superclass : #Object,
	#instVars : [
		'parser',
		'attributeMapper'
	],
	#category : #'PetitGui-Core'
}

{ #category : #public }
PPTextHighlighter >> addAttribute: aTextAttribute for: anElementString [ 
	| attributes |
	attributes := self attributeMapper at: anElementString ifAbsentPut: [OrderedCollection new].
	attributes add: aTextAttribute
]

{ #category : #accessing }
PPTextHighlighter >> attributeMapper [ 
	"returns a dictionary with keys corresponding to parser names and 
	values corresponding to a collection of TextAttributes"
	^ attributeMapper
]

{ #category : #accessing }
PPTextHighlighter >> attributeMapper: aDictionary [ 
	attributeMapper := aDictionary
]

{ #category : #public }
PPTextHighlighter >> bold: anElementString [
	self addAttribute: TextEmphasis bold for: anElementString
]

{ #category : #public }
PPTextHighlighter >> color: anElementString with: aColor [
	self addAttribute: (TextColor new color: aColor) for: anElementString
]

{ #category : #public }
PPTextHighlighter >> highlight: aString [
	| text highlighter |
	text := aString asText.
	highlighter := parser transform: [ :p |
		attributeMapper at: p name
			ifPresent: [ :attributes | 
				p token ==> [ :token | 
					attributes do: [:each |
						text 
							addAttribute: each 
							from: token start 
							to: token stop ] ] ]
			ifAbsent: [ p ] ].
	highlighter parse: text.
	^ text
]

{ #category : #initialization }
PPTextHighlighter >> initialize [
	parser := #any asParser.
	attributeMapper := Dictionary new
]

{ #category : #accessing }
PPTextHighlighter >> parser [
	^ parser
]

{ #category : #accessing }
PPTextHighlighter >> parser: aParser [
	parser := aParser
]
