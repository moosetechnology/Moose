Class {
	#name : #PPOffsideRuleTest,
	#superclass : #PPAbstractParserTest,
	#instVars : [
		'column',
		'parser',
		'aligns',
		'context',
		'setOL',
		'removeOL',
		'onside',
		'offside',
		'indent',
		'dedent'
	],
	#category : #'PetitIndent-Tests'
}

{ #category : #accessing }
PPOffsideRuleTest >> context [
	^ context
]

{ #category : #running }
PPOffsideRuleTest >> setUp [
	column := #column asParser.
	aligns := #alignsOL asParser.
	onside := #onsideOL asParser.
	offside := #offsideOL asParser.
	
	setOL := #setOL asParser.
	removeOL := #removeOL asParser.
	
	indent := #indentOL asParser.
	dedent := #dedentOL asParser.

	context := PPContext new.
]

{ #category : #tests }
PPOffsideRuleTest >> testAlignsOL [
	context indentStack push: 1.
	self assert: aligns parse: ''.

	context indentStack push: 2.
	self assert: aligns fail: ''.	
	
	context indentStack push: 0.
	self assert: aligns fail: ''.	
]

{ #category : #tests }
PPOffsideRuleTest >> testColumn [
	self assert: column, 'a' asParser parse: 'a' to: #(1 'a').
	self assert: 'a' asParser, column parse: 'a' to: #('a' 2).
]

{ #category : #tests }
PPOffsideRuleTest >> testDedentOL [
	context indentStack push: 1.
	context indentStack push: 2.

	self assert: dedent parse: '' to: #dedent.
	self assert: context indentStack top = 1.

]

{ #category : #tests }
PPOffsideRuleTest >> testDedentOL2 [
	context indentStack push: 1.
	context indentStack push: 3.
	context indentStack push: 5.

	self assert: dedent parse: ''.
	self assert: context indentStack top = 3.

	self assert: dedent parse: ''.
	self assert: context indentStack top = 1.

]

{ #category : #tests }
PPOffsideRuleTest >> testIndentOL [
	context indentStack push: 1.
	self assert: indent parse: ' ' to: #indent.
	
	self assert: context indentStack top = 2.

]

{ #category : #tests }
PPOffsideRuleTest >> testIndentOL2 [
	context indentStack push: 1.
	self assert: indent parse: '  '.
	self assert: context indentStack top = 3.

]

{ #category : #tests }
PPOffsideRuleTest >> testOffsideOL [
	context indentStack push: 1.
	self assert: offside fail: ''.

	context indentStack push: 2.
	self assert: offside parse: ''.	
	
	context indentStack push: 0.
	self assert: offside fail: ''.	
]

{ #category : #tests }
PPOffsideRuleTest >> testOnsideOL [
	context indentStack push: 1.
	self assert: onside fail: ''.

	context indentStack push: 2.
	self assert: onside fail: ''.	
	
	context indentStack push: 0.
	self assert: onside parse: ''.	
]

{ #category : #tests }
PPOffsideRuleTest >> testRemoveOL [
	context indentStack push: 1.
	
	self assert: removeOL parse: ''.
	self assert: context indentStack isEmpty.


]

{ #category : #tests }
PPOffsideRuleTest >> testSetOL [
	self assert: setOL parse: ''.
	self assert: context indentStack top = 1.


]
