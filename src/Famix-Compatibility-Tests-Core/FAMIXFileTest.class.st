"
A FAMIXFileTest is a test class for testing the behavior of FAMIXFile
"
Class {
	#name : #FAMIXFileTest,
	#superclass : #FAMIXAbstractFileTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXFileTest >> actualClass [
	^ FAMIXFile
]

{ #category : #helpers }
FAMIXFileTest >> testNumberOfBytes [
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
FAMIXFileTest >> testNumberOfCharacters [
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
FAMIXFileTest >> testNumberOfCharactersWithCRLF [
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
FAMIXFileTest >> testNumberOfCharactersWithLineReturns [
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
FAMIXFileTest >> testNumberOfEmptyLinesOfText [
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
FAMIXFileTest >> testNumberOfEmptyLinesOfTextWithCRLF [
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
FAMIXFileTest >> testNumberOfEmptyLinesOfTextWithoutEmptyLine [
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
