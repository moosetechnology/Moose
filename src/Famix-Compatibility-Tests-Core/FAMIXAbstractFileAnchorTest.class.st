"
I am an abstract test class for the tests of FAMIXAbstractFileAnchor's subclasses
"
Class {
	#name : #FAMIXAbstractFileAnchorTest,
	#superclass : #FAMIXSourceAnchorTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #testing }
FAMIXAbstractFileAnchorTest class >> isAbstract [
	^ self = FAMIXAbstractFileAnchorTest
]

{ #category : #helpers }
FAMIXAbstractFileAnchorTest >> anchorForClassTest [
	"I should return a file anchor of a class for some tests as testLineCount."

	^ self subclassResponsibility
]

{ #category : #tests }
FAMIXAbstractFileAnchorTest >> sourceCodeForTest [
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
FAMIXAbstractFileAnchorTest >> testFileNameHasOnlySlashes [
	self 
		assert: (self actualClass new fileName: 'a\b/c\d/ef') fileName
		equals: 'a/b/c/d/ef'
]

{ #category : #tests }
FAMIXAbstractFileAnchorTest >> testLineCount [
	| file anchor |
	(file := FileSystem memory / 'test.txt')
		ensureCreateFile;
		writeStreamDo: [ :s | s << self sourceCodeForTest ].
	anchor := self anchorForClassTest.
	anchor stub fileReference willReturn: file.
	self assert: anchor lineCount equals: 17
]

{ #category : #tests }
FAMIXAbstractFileAnchorTest >> testLineCountWithCRLF [
	| file anchor |
	(file := FileSystem memory / 'test.txt')
		ensureCreateFile;
		writeStreamDo: [ :s | s << (self sourceCodeForTest copyReplaceAll: String cr with: String crlf) ].
	anchor := self anchorForClassTest.
	anchor stub fileReference willReturn: file.
	self assert: anchor lineCount equals: 17
]
