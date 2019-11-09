Class {
	#name : #FMTranslationUnitTests,
	#superclass : #TestCase,
	#instVars : [
		'unit'
	],
	#category : #'Fame-Tests'
}

{ #category : #tests }
FMTranslationUnitTests >> testCopyReplaceTranslationUnitAppliesAllTheRulesInOrder [
	unit := FMCopyReplaceTranslationUnit new.
	unit
		replacing: 'mix' with: 'Famix';
		replacing: 'Famix' with: 'ximaFh';
		replacing: 'h' with: '@'.
	self assert: (unit translate: 'hello') equals: '@ello'.
	self assert: (unit translate: 'famix') equals: 'faximaF@'.
	self assert: (unit translate: 'hi') equals: '@i'
]

{ #category : #tests }
FMTranslationUnitTests >> testCopyReplaceTranslationUnitCopyReplacesParts [
	unit := FMCopyReplaceTranslationUnit new.
	unit
		replacing: 'mix' with: 'Famix';
		replacing: 'h' with: '@'.
	self assert: (unit translate: 'hello') equals: '@ello'.
	self assert: (unit translate: 'famix') equals: 'faFamix'.
	self assert: (unit translate: 'hi') equals: '@i'
]

{ #category : #tests }
FMTranslationUnitTests >> testDictionaryTranslationUnitGivesTheSameString [
	unit := FMDictionaryTranslationUnit new.
	unit dictionary: { 'hello' -> 'olleh' . 'famix' -> 'ximaf' } asDictionary .

	self assert: (unit translate: 'hello') equals: 'olleh'.
	self assert: (unit translate: 'famix') equals: 'ximaf'.
	self assert: (unit translate: 'hi') equals: 'hi'.
]

{ #category : #tests }
FMTranslationUnitTests >> testNullUnitTranslatorGivesTheSameString [
	unit := FMNullTranslationUnit new.
	self assert: (unit translate: 'hi') equals: 'hi'
]
