"
A FamixJavaFileTest is a test class for testing the behavior of FamixJavaFile
"
Class {
	#name : #FamixJavaFileTest,
	#superclass : #FamixJavaAbstractFileTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #helpers }
FamixJavaFileTest >> actualClass [ 
		^ FamixJavaFile
]

{ #category : #helpers }
FamixJavaFileTest >> testNumberOfBytes [
	| sourceFile file |
	sourceFile := FileSystem memory / 'test.txt'.
	sourceFile ensureCreateFile.
	sourceFile writeStreamDo: [ :stream | stream << 'This is a test of 27 bytes.' ].
	file := self actualClass new
		name: 'test.txt';
		yourself.
	file stub fileReference willReturn: sourceFile.
	self assert: file numberOfBytes equals: 27
]

{ #category : #helpers }
FamixJavaFileTest >> testNumberOfCharacters [
	| sourceFile file |
	sourceFile := FileSystem memory / 'test.txt'.
	sourceFile ensureCreateFile.
	sourceFile writeStreamDo: [ :stream | stream << 'This is a test of 32 characters.' ].
	file := self actualClass new
		name: 'test.txt';
		yourself.
	file stub fileReference willReturn: sourceFile.
	self assert: file numberOfCharacters equals: 32
]

{ #category : #helpers }
FamixJavaFileTest >> testNumberOfCharactersWithCRLF [
	| sourceFile file |
	sourceFile := FileSystem memory / 'test.txt'.
	sourceFile ensureCreateFile.
	sourceFile writeStreamDo: [ :stream | stream << (String crlf join: #('This' 'is' 'a' 'test' 'of' '38' 'characters.')) ].
	file := self actualClass new
		name: 'test.txt';
		yourself.
	file stub fileReference willReturn: sourceFile.
	self assert: file numberOfCharacters equals: 38
]

{ #category : #helpers }
FamixJavaFileTest >> testNumberOfCharactersWithLineReturns [
	| sourceFile file |
	sourceFile := FileSystem memory / 'test.txt'.
	sourceFile ensureCreateFile.
	sourceFile writeStreamDo: [ :stream | stream << 'This
is
a
test
of
32
characters.' ].
	file := self actualClass new
		name: 'test.txt';
		yourself.
	file stub fileReference willReturn: sourceFile.
	self assert: file numberOfCharacters equals: 32
]

{ #category : #helpers }
FamixJavaFileTest >> testNumberOfEmptyLinesOfText [
	| sourceFile file |
	sourceFile := FileSystem memory / 'test.txt'.
	sourceFile ensureCreateFile.
	sourceFile
		writeStreamDo: [ :stream | 
			stream
				<<
					'This
is


a

test.' ].
	file := self actualClass new
		name: 'test.txt';
		yourself.
	file stub fileReference willReturn: sourceFile.
	self assert: file numberOfEmptyLinesOfText equals: 3
]

{ #category : #helpers }
FamixJavaFileTest >> testNumberOfEmptyLinesOfTextWithCRLF [
	| sourceFile file |
	sourceFile := FileSystem memory / 'test.txt'.
	sourceFile ensureCreateFile.
	sourceFile writeStreamDo: [ :stream | stream << (String crlf join: #('This' 'is' '' 'a' '' '' 'test.')) ].
	file := self actualClass new
		name: 'test.txt';
		yourself.
	file stub fileReference willReturn: sourceFile.
	self assert: file numberOfEmptyLinesOfText equals: 3
]

{ #category : #helpers }
FamixJavaFileTest >> testNumberOfEmptyLinesOfTextWithoutEmptyLine [
	| sourceFile file |
	sourceFile := FileSystem memory / 'test.txt'.
	sourceFile ensureCreateFile.
	sourceFile
		writeStreamDo: [ :stream | 
			stream
				<<
					'This
is
a
test.' ].
	file := self actualClass new
		name: 'test.txt';
		yourself.
	file stub fileReference willReturn: sourceFile.
	self assert: file numberOfEmptyLinesOfText equals: 0
]
