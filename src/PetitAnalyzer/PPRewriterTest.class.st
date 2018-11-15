Class {
	#name : #PPRewriterTest,
	#superclass : #PPAbstractParserTest,
	#instVars : [
		'rewriter'
	],
	#category : #'PetitAnalyzer-Tests'
}

{ #category : #running }
PPRewriterTest >> setUp [
	rewriter := PPRewriter new
]

{ #category : #testing }
PPRewriterTest >> testDuplicationRemoval [
	| duplicate before between after result |
	duplicate := PPPattern any.
	before := PPListPattern any.
	between := PPListPattern any.
	after := PPListPattern any.
	rewriter replace: before / duplicate / between / duplicate / after with: before / duplicate / between / after.
	result := rewriter execute: $a asParser / $a asParser.
	self assert: rewriter hasChanged.
	self assert: result children size equals: 1.
	self assert: result children first literal equals: $a.
	result := rewriter execute: $b asParser / $a asParser / $a asParser.
	self assert: rewriter hasChanged.
	self assert: result children size equals: 2.
	self assert: result children first literal equals: $b.
	self assert: result children last literal equals: $a.
	result := rewriter execute: $a asParser / $b asParser / $a asParser.
	self assert: rewriter hasChanged.
	self assert: result children size equals: 2.
	self assert: result children first literal equals: $a.
	self assert: result children last literal equals: $b.
	result := rewriter execute: $a asParser / $a asParser / $b asParser.
	self assert: rewriter hasChanged.
	self assert: result children size equals: 2.
	self assert: result children first literal equals: $a.
	self assert: result children last literal equals: $b
]

{ #category : #testing }
PPRewriterTest >> testPatternRemoval [
	| pattern result |
	pattern := PPPattern class: PPLiteralObjectParser.
	rewriter replace: pattern / pattern with: pattern.
	result := rewriter execute: $a asParser / $a asParser.
	self assert: rewriter hasChanged.
	self assert: result class equals: PPLiteralObjectParser.
	self assert: result literal equals: $a.
	result := rewriter execute: $a asParser / $a asParser / $a asParser.
	self deny: rewriter hasChanged.
	self assert: result class equals: PPChoiceParser.
	self assert: result children size equals: 3
]

{ #category : #testing }
PPRewriterTest >> testPatternReplacement [
	| pattern result |
	pattern := PPPattern class: PPLiteralObjectParser.
	rewriter replace: pattern with: pattern , pattern.
	result := rewriter execute: $a asParser.
	self assert: rewriter hasChanged.
	self assert: result class equals: PPSequenceParser.
	self assert: result children first literal equals: $a.
	self assert: result children last literal equals: $a.
	result := rewriter execute: #any asParser.
	self deny: rewriter hasChanged.
	self assert: result class equals: PPPredicateObjectParser
]

{ #category : #testing }
PPRewriterTest >> testReplaceLiteral [
	| result |
	rewriter replace: $a asParser with: $b asParser.
	result := rewriter execute: $a asParser.
	self assert: rewriter hasChanged.
	self assert: result literal equals: $b.
	result := rewriter execute: $c asParser.
	self deny: rewriter hasChanged.
	self assert: result literal equals: $c.
	result := rewriter execute: $a asParser , $b asParser , $c asParser.
	self assert: rewriter hasChanged.
	self assert: result children size equals: 3.
	self assert: result children first literal equals: $b.
	self assert: result children last literal equals: $c
]

{ #category : #testing }
PPRewriterTest >> testSwapTwoPattern [
	| first second result |
	first := PPPattern any.
	second := PPPattern any.
	rewriter replace: first , second with: second , first.
	result := rewriter execute: $a asParser , $b asParser.
	self assert: rewriter hasChanged.
	self assert: result children first literal equals: $b.
	self assert: result children last literal equals: $a.
	result := rewriter execute: $a asParser / $b asParser.
	self deny: rewriter hasChanged.
	self assert: result children first literal equals: $a.
	self assert: result children last literal equals: $b
]

{ #category : #testing }
PPRewriterTest >> testWrapLiteral [
	| result |
	rewriter replace: $a asParser withValueFrom: [ :parser | parser token ].
	result := rewriter execute: $a asParser.
	self assert: rewriter hasChanged.
	self assert: result class equals: PPTokenParser.
	self assert: result children first literal equals: $a.
	result := rewriter execute: $c asParser.
	self deny: rewriter hasChanged.
	self assert: result literal equals: $c.
	result := rewriter execute: $a asParser , $b asParser.
	self assert: rewriter hasChanged.
	self assert: result children first class equals: PPTokenParser.
	self assert: result children first children first literal equals: $a.
	self assert: result children last class equals: PPLiteralObjectParser.
	self assert: result children last literal equals: $b
]
