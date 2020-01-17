Class {
	#name : #FMJSONParser,
	#superclass : #FMMSEParser,
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #tokens }
FMJSONParser >> Document [
	"Matches a document node (returns a boolean)."

	"Document := EOF { openDocument; closeDocument }
		| OPEN { openDocument } Entity* CLOSE { closeDocument }"

	self tWHITESPACE.
	self atEnd
		ifTrue: [ importer beginDocument ]
		ifFalse: [ self tMultiOPEN
				ifFalse: [ ^ self syntaxError ].
			importer beginDocument.
			[ self Entity ] whileTrue.
			self tMultiCLOSE
				ifFalse: [ ^ self syntaxError ] ].
	importer endDocument.
	self tWHITESPACE.
	^ true
]

{ #category : #tokens }
FMJSONParser >> Entity [
	"Matches an entity node (returns boolean)."

	"Entity := OPEN n:FULLNAME { beginElement(n) } Serial? Property* CLOSE { endElement(n) }"

	| pos name |
	pos := self position.
	self tOPEN ifFalse: [ ^ self backtrack: pos ].
	name := self tFULLNAME.
	name ifNil: [ ^ self backtrack: pos ].
	importer
		inEntity: name
		do: [ self Serial.
			[ self Property ] whileTrue.
			self tCLOSE ifFalse: [ ^ self syntaxError ] ].

	self tWHITESPACE.

	self incrementProgressBar.	"UI stuff"
	^ true
]

{ #category : #tokens }
FMJSONParser >> Serial [
	"Matches a serial number node (returns boolean)."
	"Serial --> OPEN ID n:Identifier { client serial: n } CLOSE"
	| position serial |
	position := self position.
	self tID ifFalse: [ ^ self backtrack: position ].
	serial := self Identifier.
	serial ifNil: [ ^ self backtrack: position ].
	importer serial: serial.
	self tWHITESPACE.
	^ true
]

{ #category : #tokens }
FMJSONParser >> tCLOSE [
	^ self matchesWord: '}'
]

{ #category : #tokens }
FMJSONParser >> tFULLNAME [
	1halt.
	(self characterSet isLetter: chararacter) ifFalse: [ ^ nil ].

	buffer reset.
	[ 
	buffer nextPut: chararacter.
	[ self nextCharIsAlphanumeric or: [ chararacter ~= $, ] ] whileTrue: [ 
		buffer nextPut: chararacter ].
	$. == chararacter ] whileTrue: [ 
		buffer nextPut: chararacter.
		(self characterSet isLetter: self next) ifFalse: [ 
			^ self syntaxError ] ].
	$: == chararacter ifTrue: [ ^ self syntaxError ].
	self tWHITESPACE.
	^ buffer contents
]

{ #category : #tokens }
FMJSONParser >> tID [
	"Match id keyword (returns boolean)."

	^ self matchesWord: '"id":'
]

{ #category : #tokens }
FMJSONParser >> tMultiCLOSE [
	^ self matchesWord: ']'
]

{ #category : #tokens }
FMJSONParser >> tMultiOPEN [
	^ self matchesWord: '['
]

{ #category : #tokens }
FMJSONParser >> tOPEN [
	^ self matchesWord: '{'
]
