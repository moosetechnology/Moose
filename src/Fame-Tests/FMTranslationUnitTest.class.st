Class {
	#name : #FMTranslationUnitTest,
	#superclass : #TestCase,
	#instVars : [
		'unit'
	],
	#category : #'Fame-Tests'
}

{ #category : #tests }
FMTranslationUnitTest >> testCopyReplaceTranslationUnitAppliesAllTheRulesInOrder [
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
FMTranslationUnitTest >> testCopyReplaceTranslationUnitCopyReplacesParts [
	unit := FMCopyReplaceTranslationUnit new.
	unit
		replacing: 'mix' with: 'Famix';
		replacing: 'h' with: '@'.
	self assert: (unit translate: 'hello') equals: '@ello'.
	self assert: (unit translate: 'famix') equals: 'faFamix'.
	self assert: (unit translate: 'hi') equals: '@i'
]

{ #category : #tests }
FMTranslationUnitTest >> testDictionaryTranslationUnitGivesTheSameString [
	unit := FMDictionaryTranslationUnit new.
	unit dictionary: { 'hello' -> 'olleh' . 'famix' -> 'ximaf' } asDictionary .

	self assert: (unit translate: 'hello') equals: 'olleh'.
	self assert: (unit translate: 'famix') equals: 'ximaf'.
	self assert: (unit translate: 'hi') equals: 'hi'.
]

{ #category : #tests }
FMTranslationUnitTest >> testNullUnitTranslatorGivesTheSameString [
	unit := FMNullTranslationUnit new.
	self assert: (unit translate: 'hi') equals: 'hi'
]
