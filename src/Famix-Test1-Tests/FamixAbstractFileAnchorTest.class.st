Class {
	#name : #FamixAbstractFileAnchorTest,
	#superclass : #FamixSourceAnchorTest,
	#category : #'Famix-Test1-Tests-SourceAnchor'
}

{ #category : #testing }
FamixAbstractFileAnchorTest class >> isAbstract [
	^ self = FamixAbstractFileAnchorTest
]

{ #category : #helpers }
FamixAbstractFileAnchorTest >> anchorForClassTest [
	"I should return a file anchor of a class for some tests as testLineCount."

	^ self subclassResponsibility
]

{ #category : #helpers }
FamixAbstractFileAnchorTest >> sourceCodeForTest [
"We do not care that it is Java or not, we just need code. This test is on FamixTest1Anchor"
	^ 'package goosegame.dice;

import goosegame.Dice;

/**
 * Dice9 return 9 all the time. 
 */
public class Dice9 implements Dice {


	public Dice9() {
	}

	/* (non-Javadoc)
	 * @see goosegame.Dice#throwDice()
	 */
	public int throwDice() {
		return 9;
	}

}'
]

{ #category : #tests }
FamixAbstractFileAnchorTest >> testFileNameHasOnlySlashes [
	self 
		assert: (self actualClass new fileName: 'a\b/c\d/ef') fileName
		equals: 'a/b/c/d/ef'
]

{ #category : #tests }
FamixAbstractFileAnchorTest >> testLineCount [
	| file anchor |
	(file := FileSystem memory / 'test.txt')
		ensureCreateFile;
		writeStreamDo: [ :s | s << self sourceCodeForTest ].
	anchor := self anchorForClassTest.
	anchor stub fileReference willReturn: file.
	self assert: anchor lineCount equals: 17
]

{ #category : #tests }
FamixAbstractFileAnchorTest >> testLineCountWithCRLF [
	| file anchor |
	(file := FileSystem memory / 'test.txt')
		ensureCreateFile;
		writeStreamDo: [ :s | s << (self sourceCodeForTest copyReplaceAll: String cr with: String crlf) ].
	anchor := self anchorForClassTest.
	anchor stub fileReference willReturn: file.
	self assert: anchor lineCount equals: 17
]

{ #category : #tests }
FamixAbstractFileAnchorTest >> testSourceText [
	^ self subclassResponsibility
]
