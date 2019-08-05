Class {
	#name : #FamixJavaFileAnchorTest,
	#superclass : #FamixJavaAbstractFileAnchorTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #helpers }
FamixJavaFileAnchorTest >> actualClass [
	^ FamixJavaFileAnchor
]

{ #category : #helpers }
FamixJavaFileAnchorTest >> anchorForClassTest [
	| file anchor |
	file := (FileSystem memory / 'test.java')
		ensureCreateFile;
		writeStreamDo: [ :s | s nextPutAll: self sourceCodeForTest ];
		yourself.
	anchor := self actualClass new
		startLine: 5;
		startColumn: 0;
		endLine: 21;
		endColumn: 2;
		yourself.
	anchor stub fileReference willReturn: file.
	^ anchor
]

{ #category : #tests }
FamixJavaFileAnchorTest >> testEmptySourceTextWhenNoEndAndStartLine [
	| fileAnchor |
	fileAnchor := self anchorForClassTest
		startLine: nil;
		startColumn: nil;
		endLine: nil;
		endColumn: nil;
		yourself.
	self assert: fileAnchor sourceText equals: self sourceCodeForTest
]

{ #category : #tests }
FamixJavaFileAnchorTest >> testEmptySourceTextWhenNoEndLine [
	| fileAnchor |
	fileAnchor := self anchorForClassTest
		startLine: 17;
		startColumn: 2;
		endLine: nil;
		endColumn: nil;
		yourself.
	self
		assert: fileAnchor sourceText
		equals:
			'public int throwDice() {
		return 9;
	}

}'
]

{ #category : #tests }
FamixJavaFileAnchorTest >> testEmptySourceTextWhenNoStartLine [
	| fileAnchor |
	fileAnchor := self anchorForClassTest
		startLine: nil;
		startColumn: nil;
		endLine: 19;
		endColumn: 3;
		yourself.
	self
		assert: fileAnchor sourceText
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

{ #category : #tests }
FamixJavaFileAnchorTest >> testMooseNameOn [
	| fileAnchor |
	fileAnchor := self actualClass new
		fileName: 'file';
		startLine: 1;
		endLine: 9;
		yourself.
	self assert: fileAnchor mooseName equals: 'file(1@nil-9@nil)'
]

{ #category : #tests }
FamixJavaFileAnchorTest >> testMooseNameWithColumns [
	| fileAnchor |
	fileAnchor := self actualClass new
		fileName: 'file';
		startLine: 1;
		startColumn: 2;
		endLine: 3;
		endColumn: 4;
		yourself.
	self assert: fileAnchor mooseName equals: 'file(1@2-3@4)'
]

{ #category : #tests }
FamixJavaFileAnchorTest >> testSourceText [
	| anchor |
	anchor := self anchorForClassTest
		startLine: 17;
		startColumn: 2;
		endLine: 19;
		endColumn: 3;
		yourself.
	self
		assert: anchor sourceText
		equals:
			'public int throwDice() {
		return 9;
	}'
]

{ #category : #tests }
FamixJavaFileAnchorTest >> testSourceTextConserveItsLineReturn [
	| file anchor |
	file := (FileSystem memory / 'test.java')
		ensureCreateFile;
		writeStreamDo: [ :s | s nextPutAll: (self sourceCodeForTest copyReplaceAll: String cr with: String crlf) ];
		yourself.
	anchor := self anchorForClassTest
		startLine: 17;
		startColumn: 2;
		endLine: 19;
		endColumn: 3;
		yourself.
	anchor stub fileReference willReturn: file.
	self
		assert: anchor sourceText
		equals:
			('public int throwDice() {
		return 9;
	}' copyReplaceAll: String cr with: String crlf)
]

{ #category : #tests }
FamixJavaFileAnchorTest >> testSourceTextEndingOnNewLine [
	| anchor |
	anchor := self anchorForClassTest
		startLine: 17;
		startColumn: 2;
		endLine: 22;
		endColumn: nil;
		yourself.
	anchor fileReference
		writeStreamDo: [ :s | 
			s
				setToEnd;
				cr ].
	self
		assert: anchor sourceText
		equals:
			'public int throwDice() {
		return 9;
	}

}
'
]

{ #category : #tests }
FamixJavaFileAnchorTest >> testSourceTextEndingOnTwoNewLine [
	| anchor |
	anchor := self anchorForClassTest
		startLine: 17;
		startColumn: 2;
		endLine: 23;
		endColumn: nil;
		yourself.
	anchor fileReference
		writeStreamDo: [ :s | 
			s
				setToEnd;
				cr;
				cr ].
	self
		assert: anchor sourceText
		equals:
			'public int throwDice() {
		return 9;
	}

}

'
]

{ #category : #tests }
FamixJavaFileAnchorTest >> testSourceTextInOneLine [
	| anchor |
	anchor := self anchorForClassTest
		startLine: 15;
		startColumn: 5;
		endLine: 15;
		endColumn: 34;
		yourself.
	self
		assert: anchor sourceText
		equals:
			'@see goosegame.Dice#throwDice'
]

{ #category : #tests }
FamixJavaFileAnchorTest >> testSourceTextWithLf [
	| file anchor |
	file := (FileSystem memory / 'test.java')
		ensureCreateFile;
		writeStreamDo: [ :s | s nextPutAll: (self sourceCodeForTest copyReplaceAll: String cr with: String lf) ];
		yourself.
	anchor := self anchorForClassTest
		startLine: 17;
		startColumn: 2;
		endLine: 19;
		endColumn: 3;
		yourself.
	anchor stub fileReference willReturn: file.
	self
		assert: anchor sourceText
		equals:
			('public int throwDice() {
		return 9;
	}' copyReplaceAll: String cr with: String lf)
]

{ #category : #tests }
FamixJavaFileAnchorTest >> testSourceTextWithoutNoEndColumn [
	| anchor |
	anchor := self anchorForClassTest
		startLine: 17;
		startColumn: 2;
		endLine: 19;
		endColumn: nil;
		yourself.
	self
		assert: anchor sourceText
		equals:
			'public int throwDice() {
		return 9;
	}'
]

{ #category : #tests }
FamixJavaFileAnchorTest >> testSourceTextWithoutNoStartColumn [
	| anchor |
	anchor := self anchorForClassTest
		startLine: 17;
		startColumn: nil;
		endLine: 19;
		endColumn: 3;
		yourself.
	self
		assert: anchor sourceText
		equals:
			'	public int throwDice() {
		return 9;
	}'
]