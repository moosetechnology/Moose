Class {
	#name : #FAMIXIndexedFileAnchorTest,
	#superclass : #FAMIXAbstractFileAnchorTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXIndexedFileAnchorTest >> actualClass [
	^ FAMIXIndexedFileAnchor 
]

{ #category : #helpers }
FAMIXIndexedFileAnchorTest >> anchorForClassTest [
	| file anchor |
	file := (FileSystem memory / 'test.java')
		ensureCreateFile;
		writeStreamDo: [ :s | s nextPutAll: self sourceCodeForTest ];
		yourself.
	anchor := self actualClass new
		startPos: 50;
		endPos: 253;
		yourself.
	anchor stub fileReference willReturn: file.
	^ anchor
]

{ #category : #tests }
FAMIXIndexedFileAnchorTest >> testFullSourceText [
	| anchor |
	anchor := self anchorForClassTest
		startPos: 1;
		endPos: self sourceCodeForTest size;
		yourself.
	self assert: anchor sourceText equals: self sourceCodeForTest
]

{ #category : #tests }
FAMIXIndexedFileAnchorTest >> testLineCountWithCRLF [
	| file anchor |
	(file := FileSystem memory / 'test.java')
		ensureCreateFile;
		writeStreamDo: [ :s | s << (self sourceCodeForTest copyReplaceAll: String cr with: String crlf) ].
	anchor := self actualClass new
		startPos: 54;
		endPos: 273;
		yourself.
	anchor stub fileReference willReturn: file.
	self assert: anchor lineCount equals: 17
]

{ #category : #tests }
FAMIXIndexedFileAnchorTest >> testLineCountWithoutEndPos [
	| anchor |
	anchor := self anchorForClassTest
		endPos: nil;
		yourself.
	self assert: anchor lineCount equals: 17
]

{ #category : #tests }
FAMIXIndexedFileAnchorTest >> testLineCountWithoutStartPos [
	| anchor |
	anchor := self anchorForClassTest
		startPos: nil;
		endPos: 89;
		yourself.
	self assert: anchor lineCount equals: 7
]

{ #category : #tests }
FAMIXIndexedFileAnchorTest >> testSourceText [
	| anchor |
	anchor := self anchorForClassTest
		startPos: 212;
		endPos: 250;
		yourself.
	anchor stub completeText willReturn: self sourceCodeForTest.
	self assert: anchor sourceText equals: 'public int throwDice() {
		return 9;
	}'
]

{ #category : #tests }
FAMIXIndexedFileAnchorTest >> testSourceTextWithoutEndPos [
	| anchor |
	anchor := self anchorForClassTest
		startPos: 212;
		endPos: nil;
		yourself.
	anchor stub completeText willReturn: self sourceCodeForTest.
	self
		assert: anchor sourceText
		equals:
			'public int throwDice() {
		return 9;
	}

}'
]

{ #category : #tests }
FAMIXIndexedFileAnchorTest >> testSourceTextWithoutStartAndEndPos [
	| anchor |
	anchor := self anchorForClassTest
		startPos: nil;
		endPos: nil;
		yourself.
	anchor stub completeText willReturn: self sourceCodeForTest.
	self assert: anchor sourceText equals: self sourceCodeForTest
]

{ #category : #tests }
FAMIXIndexedFileAnchorTest >> testSourceTextWithoutStartPos [
	| anchor |
	anchor := self anchorForClassTest
		startPos: nil;
		endPos: 250;
		yourself.
	anchor stub completeText willReturn: self sourceCodeForTest.
	self
		assert: anchor sourceText
		equals:
			'package goosegame.dice;

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
	}'
]
