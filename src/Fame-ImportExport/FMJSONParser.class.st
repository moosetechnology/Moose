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
		ifFalse: [" self tMultiOPEN
				ifFalse: [ ^ self syntaxError ]."
			importer beginDocument.
			self MultiEntity.
			"[ self Entity ] whileTrue.
			self tMultiCLOSE
				ifFalse: [ ^ self syntaxError ]" ].
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
	self tPropertySeparator.
	importer
		inEntity: name
		do: [ self Serial.
			self tPropertySeparator.
			[ self Property ] whileTrue.
			self tCLOSE ifFalse: [ ^ self syntaxError ] ].
	self tWHITESPACE.

	self incrementProgressBar.	"UI stuff"
	^ true
]

{ #category : #tokens }
FMJSONParser >> MultiEntity [
	self tMultiOPEN ifFalse: [ ^ self backtrack: self position ].
	[ 	self Entity. 	self incrementProgressBar. self tPropertySeparator ] whileTrue.
	self tMultiCLOSE ifFalse: [ ^ self syntaxError ].
	^ true
]

{ #category : #tokens }
FMJSONParser >> Property [
	"Matches a property node (returns boolean)."

	"Property := OPEN n:NAME { beginProperty(n) } Value* CLOSE { endProperty(n) }"

	| pos name |
	pos := self position.
	self tPropertyNameOPEN ifFalse: [ ^ self backtrack: pos ].
	name := self tNAME.
	self tPropertyNameClose ifFalse: [ ^ self backtrack: pos ].
	name ifNil: [ ^ self backtrack: pos ].
	importer inProperty: name do: [ 
		[ self Value ] whileTrue.
		self tPropertyValueCLOSE ifFalse: [ ^ self syntaxError ] ].
	self tWHITESPACE.
	^ true
]

{ #category : #tokens }
FMJSONParser >> Reference [
	"Matches a Reference node (returns boolean)."
	"Reference --> OPEN REF n:Identifier { client referenceNumber: n } CLOSE"
	| position serial |
	position := self position.
	self tOPEN ifFalse: [ ^ self backtrack: position ].
	self tREF ifFalse: [ ^ self backtrack: position ].
	serial := self Identifier.
	serial ifNil: [ ^ self backtrack: position ].
	importer referenceNumber: serial.
	self tCLOSE ifFalse: [ ^ self syntaxError ].
	self tWHITESPACE.
	^ true
]

{ #category : #tokens }
FMJSONParser >> Reference2 [
	"Matches a Reference node (returns boolean)."
	"Reference --> OPEN REF n:Name { client referenceName: n } CLOSE"
	| position name |
	position := self position.
	self tOPEN ifFalse: [ ^ self backtrack: position ].
	self tREF ifFalse: [ ^ self backtrack: position ].
	name := self String.
	name ifNil: [ ^ self backtrack: position ].
	importer referenceName: name.
	self tCLOSE ifFalse: [ ^ self syntaxError ].
	self tWHITESPACE.
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
FMJSONParser >> String [
	$" == chararacter ifFalse: [ ^ nil ].

	buffer reset.

	[ [ self next.
	chararacter ifNil: [ self syntaxError ].
	$" == chararacter ] whileFalse: [ buffer nextPut: chararacter ].
	$" == self next ] whileTrue: [ buffer nextPut: chararacter ].
	self tWHITESPACE.
	^ buffer contents
]

{ #category : #tokens }
FMJSONParser >> Value [
	"Matchs a value (returns true)."

	"Value := Reference | Primitive | Entity"

	^ self Primitive or: [ self Reference or: [ self Reference2 or: [ self MultiEntity ] ] ]
]

{ #category : #tokens }
FMJSONParser >> tCLOSE [
	^ self matchesWord: '}'
]

{ #category : #tokens }
FMJSONParser >> tFULLNAME [
	self tFULLNAMEPropertyOpen ifFalse: [ ^ nil ].
	
	buffer reset.
	[ 
	buffer nextPut: chararacter.
	[ self nextCharIsAlphanumeric or: [ chararacter ~= $" ] ] whileTrue: [ 
		buffer nextPut: chararacter ].
	$. == chararacter ] whileTrue: [ 
		buffer nextPut: chararacter.
		(self characterSet isLetter: self next) ifFalse: [ 
			^ self syntaxError ] ].
	$: == chararacter ifTrue: [ ^ self syntaxError ].
	self tFULLNAMEPropertyClose.
	^ buffer contents
]

{ #category : #tokens }
FMJSONParser >> tFULLNAMEPropertyClose [
	^ self matchesWord: '"'
]

{ #category : #tokens }
FMJSONParser >> tFULLNAMEPropertyOpen [
	^ self matchesWord: '"FM3":"'
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

{ #category : #tokens }
FMJSONParser >> tPropertyNameClose [
	^ self matchesWord: '":'
]

{ #category : #tokens }
FMJSONParser >> tPropertyNameOPEN [
	^ self matchesWord: '"'
]

{ #category : #tokens }
FMJSONParser >> tPropertySeparator [
	^ self matchesWord: ','
]

{ #category : #tokens }
FMJSONParser >> tPropertyValueCLOSE [
	^ (self matchesWord: ',') or: [ self matchesWord: ''  ]
]

{ #category : #tokens }
FMJSONParser >> tREF [
	"Matches ref keyword (returns boolean)."

	^ self matchesWord: '"ref":'
]

{ #category : #tokens }
FMJSONParser >> tWHITESPACE [
	^ [ self atEnd not and: [ chararacter isSeparator  ] ] whileTrue: [ self next ]
]
