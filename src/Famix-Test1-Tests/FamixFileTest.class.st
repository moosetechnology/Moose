Class {
	#name : #FamixFileTest,
	#superclass : #FamixAbstractFileTest,
	#category : #'Famix-Test1-Tests-Files'
}

{ #category : #helpers }
FamixFileTest >> actualClass [
	^ FamixTest1File
]

{ #category : #tests }
FamixFileTest >> testNumberOfBytes [
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

{ #category : #tests }
FamixFileTest >> testNumberOfCharacters [
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

{ #category : #tests }
FamixFileTest >> testNumberOfCharactersWithCRLF [
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

{ #category : #tests }
FamixFileTest >> testNumberOfCharactersWithLineReturns [
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

{ #category : #tests }
FamixFileTest >> testNumberOfEmptyLinesOfText [
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

{ #category : #tests }
FamixFileTest >> testNumberOfEmptyLinesOfTextWithCRLF [
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

{ #category : #tests }
FamixFileTest >> testNumberOfEmptyLinesOfTextWithoutEmptyLine [
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
