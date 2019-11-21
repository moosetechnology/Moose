"
Description
--------------------

I am a parser responsible of the MSE syntax parsing. I do not manage the creation of the entities, this part is delegated to a FMImporter.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	buffer:				<aBuffer>				Buffer used to keep a record of the previously read characters during the parsing.
	characterSet:		<aCharacterSet>		A character set cached to speed up the reading of the MSE.
	chararacter:			<aCharacter>			The last character read on the stream.
	importer:				<aFMImporter>		The FMImporter responsible of the management of the entities to be imported.
	lastUpdate:			<anInteger>			Time in millisecond since the last progress bar update.
	progBar:				<aProgressBar>		A progress bar to display the parsing progress.
	stream:				<aStream>				The stream containing the MSE to be read.

"
Class {
	#name : #FMMSEParser,
	#superclass : #Object,
	#instVars : [
		'stream',
		'progBar',
		'lastUpdate',
		'characterSet',
		'chararacter',
		'buffer',
		'importer'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #expressions }
FMMSEParser >> Document [
	"Matches a document node (returns a boolean)."

	"Document := EOF { openDocument; closeDocument }
		| OPEN { openDocument } Entity* CLOSE { closeDocument }"

	self tWHITESPACE.
	self atEnd
		ifTrue: [ importer beginDocument ]
		ifFalse: [ self tOPEN
				ifFalse: [ ^ self syntaxError ].
			importer beginDocument.
			[ self Entity ] whileTrue.
			self tCLOSE
				ifFalse: [ ^ self syntaxError ] ].
	importer endDocument.
	self tWHITESPACE.
	^ true
]

{ #category : #expressions }
FMMSEParser >> Entity [
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

{ #category : #expressions }
FMMSEParser >> Identifier [
	"Matches numerical identifier (returns Number or nil)."

	"Identifier := digit+"

	(self characterSet isDigit: chararacter)
		ifFalse: [ ^ nil ].
	
	buffer reset.
	buffer nextPut: chararacter.
	[ self characterSet isDigit: self next ] whileTrue: [ buffer nextPut: chararacter ].
	self tWHITESPACE.
	^ Integer readFrom: buffer contents readStream
]

{ #category : #expressions }
FMMSEParser >> Number [
	"Matches a number (returns Number or nil)."

	"Number := hypen? digit+ ( dot digit+ ( e hypen? digit+ )? )?"

	| pos |
	pos := self position.
	buffer reset.
	"hypen?	"
	$- == chararacter
		ifTrue: [ buffer nextPut: chararacter.
			self next ].
	"digit+"
	(self characterSet isDigit: chararacter)
		ifFalse: [ self backtrack: pos.
			^ nil ].
	[ buffer nextPut: chararacter.
	self characterSet isDigit: self next ] whileTrue.
	"(dot"
	$. == chararacter
		ifTrue: [ buffer nextPut: chararacter.
			self next.
			"digit+"
			(self characterSet isDigit: chararacter)
				ifFalse: [ self syntaxError.
					^ nil ].
			[ buffer nextPut: chararacter.
			self characterSet isDigit: self next ] whileTrue.
			"(e"
			$e == chararacter
				ifTrue: [ buffer nextPut: chararacter.
					self next.
					"hypen?"
					$- == chararacter
						ifTrue: [ buffer nextPut: chararacter.
							self next ].
					"digit+"
					(self characterSet isDigit: chararacter)
						ifFalse: [ self syntaxError.
							^ nil ].
					[ buffer nextPut: chararacter.
					self characterSet isDigit: self next ] whileTrue
					")?)?" ] ].
	self tWHITESPACE.
	^ Number readFrom: buffer contents readStream
]

{ #category : #expressions }
FMMSEParser >> Primitive [
	"Matches primitive value (returns boolean)."

	| primitive |
	primitive := self String.
	primitive ifNotNil: [ importer primitive: primitive. ^ true ].
	primitive := self Number.
	primitive ifNotNil: [ importer primitive: primitive. ^ true ].
	self tTRUE ifTrue: [ importer primitive: true. ^ true ].
	self tFALSE ifTrue: [ importer primitive: false. ^ true ].
	^ false
]

{ #category : #expressions }
FMMSEParser >> Property [
	"Matches a property node (returns boolean)."

	"Property := OPEN n:NAME { beginProperty(n) } Value* CLOSE { endProperty(n) }"

	| pos name |
	pos := self position.
	self tOPEN ifFalse: [ ^ self backtrack: pos ].
	name := self tNAME.
	name ifNil: [ ^ self backtrack: pos ].
	importer
		inProperty: name
		do: [ [ self Value ] whileTrue.
			self tCLOSE ifFalse: [ ^ self syntaxError ] ].
	self tWHITESPACE.
	^ true
]

{ #category : #expressions }
FMMSEParser >> Reference [
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

{ #category : #expressions }
FMMSEParser >> Reference2 [
	"Matches a Reference node (returns boolean)."
	"Reference --> OPEN REF n:Name { client referenceName: n } CLOSE"
	| position name |
	position := self position.
	self tOPEN ifFalse: [ ^ self backtrack: position ].
	self tREF ifFalse: [ ^ self backtrack: position ].
	name := self tFULLNAME.
	name ifNil: [ ^ self backtrack: position ].
	importer referenceName: name.
	self tCLOSE ifFalse: [ ^ self syntaxError ].
	self tWHITESPACE.
	^ true
]

{ #category : #expressions }
FMMSEParser >> Serial [
	"Matches a serial number node (returns boolean)."
	"Serial --> OPEN ID n:Identifier { client serial: n } CLOSE"
	| position serial |
	position := self position.
	self tOPEN ifFalse: [ ^ self backtrack: position ].
	self tID ifFalse: [ ^ self backtrack: position ].
	serial := self Identifier.
	serial ifNil: [ ^ self backtrack: position ].
	importer serial: serial.
	self tCLOSE ifFalse: [ self syntaxError ].
	self tWHITESPACE.
	^ true
]

{ #category : #expressions }
FMMSEParser >> String [
	$' == chararacter ifFalse: [ ^ nil ].

	buffer reset.

	[ [ self next.
	chararacter ifNil: [ self syntaxError ].
	$' == chararacter ] whileFalse: [ buffer nextPut: chararacter ].
	$' == self next ] whileTrue: [ buffer nextPut: chararacter ].
	self tWHITESPACE.
	^ buffer contents
]

{ #category : #expressions }
FMMSEParser >> Value [
	"Matchs a value (returns true)."

	"Value := Reference | Primitive | Entity"

	^ self Primitive or: [ self Reference or: [ self Reference2 or: [ self Entity ] ] ]
]

{ #category : #testing }
FMMSEParser >> atEnd [
	^ chararacter isNil
]

{ #category : #private }
FMMSEParser >> backtrack: integer [
	"Backtracks to given integer."

	integer ~~ stream position
		ifTrue: [ stream position: integer - 1.
			self next	"fetch peek again" ].
	^ false
]

{ #category : #running }
FMMSEParser >> basicRun [
	self Document.
	self atEnd ifFalse: [ ^ self syntaxError ]
]

{ #category : #accessing }
FMMSEParser >> characterSet [
	^ characterSet ifNil: [ characterSet := chararacter characterSet ]
]

{ #category : #accessing }
FMMSEParser >> fromString: mseString [ 
	self stream: mseString readStream
]

{ #category : #accessing }
FMMSEParser >> importer [
	^ importer
]

{ #category : #accessing }
FMMSEParser >> importer: aFMImporter [
	importer := aFMImporter
]

{ #category : #running }
FMMSEParser >> incrementProgressBar [
	(progBar isNotNil and: [ (Time millisecondsSince: lastUpdate) >= 500 ]) ifFalse: [ ^ self ].
	progBar value: self position.
	lastUpdate := Time millisecondClockValue
]

{ #category : #tokens }
FMMSEParser >> matchesWord: aString [
	"I am checking if the next part of the stream watches a word. If it matches, I also eat the next whitespace and return true. Else I return false (I do not backtrack)"

	aString do: [ :char | char == chararacter ifTrue: [ self next ] ifFalse: [ ^ false ] ].
	self tWHITESPACE.
	^ true
]

{ #category : #private }
FMMSEParser >> next [
	^ chararacter := stream next
]

{ #category : #testing }
FMMSEParser >> nextCharIsAlphanumeric [
	self next.
	^ (self characterSet isLetter: chararacter) or: [ self characterSet isDigit: chararacter ]
]

{ #category : #private }
FMMSEParser >> peek [
	^ chararacter
]

{ #category : #private }
FMMSEParser >> position [
	^ stream position
]

{ #category : #running }
FMMSEParser >> run [
	UIManager default
		displayProgress: 'Parsing ' , self stream localName
		from: 1
		to: self stream size
		during: [ :bar | 
			progBar := bar.
			lastUpdate := 0.
			self basicRun ]
]

{ #category : #accessing }
FMMSEParser >> stream [
	^ stream
]

{ #category : #accessing }
FMMSEParser >> stream: aStream [
	stream := aStream.
	buffer := '' writeStream.
	self next	"look ahead"
]

{ #category : #private }
FMMSEParser >> syntaxError [
	self syntaxError: 'Syntax error at ' , self position printString.
	^ nil
]

{ #category : #private }
FMMSEParser >> syntaxError: aString [
	(FMSyntaxError new
		parser: self;
		messageText: aString) signal.

	" Evaluate the following line to get text around the error:
		(stream contents copyFrom: self pos -10 to: self pos + 10) inspect.
	"

	^ nil
]

{ #category : #tokens }
FMMSEParser >> tCLOSE [
	"Matches opening parenthesis (returns boolean)."

	^ self matchesWord: ')'
]

{ #category : #tokens }
FMMSEParser >> tFALSE [
	"Matches false keyword (returns boolean)."

	^ self matchesWord: 'false'
]

{ #category : #tokens }
FMMSEParser >> tFULLNAME [
	(self characterSet isLetter: chararacter) ifFalse: [ ^ nil ].

	buffer reset.
	[ buffer nextPut: chararacter.
	[ self nextCharIsAlphanumeric or: [ chararacter = $- ] ] whileTrue: [ buffer nextPut: chararacter ].
	$. == chararacter ]
		whileTrue: [ buffer nextPut: chararacter.
			(self characterSet isLetter: self next) ifFalse: [ ^ self syntaxError ] ].
	$: == chararacter ifTrue: [ ^ self syntaxError ].
	self tWHITESPACE.
	^ buffer contents
]

{ #category : #tokens }
FMMSEParser >> tID [
	"Match id keyword (returns boolean)."

	^ self matchesWord: 'id:'
]

{ #category : #tokens }
FMMSEParser >> tNAME [
	(self characterSet isLetter: chararacter) ifFalse: [ ^ nil ].

	buffer reset.
	buffer nextPut: chararacter.
	[ self nextCharIsAlphanumeric or: [ chararacter == $_ ] ] whileTrue: [ buffer nextPut: chararacter ].
	self tWHITESPACE.
	^ buffer contents
]

{ #category : #tokens }
FMMSEParser >> tOPEN [
	"Matches opening parenthesis (returns boolean)."

	^ self matchesWord: '('
]

{ #category : #tokens }
FMMSEParser >> tREF [
	"Matches ref keyword (returns boolean)."

	^ self matchesWord: 'ref:'
]

{ #category : #tokens }
FMMSEParser >> tTRUE [
	"Match 'true' and whitespace"

	^ self matchesWord: 'true'
]

{ #category : #tokens }
FMMSEParser >> tWHITESPACE [
	[ $" == chararacter
		ifTrue: [ [ [ self next.
			nil == chararacter ifTrue: [ ^ self syntaxError ].
			$" == chararacter ] whileFalse.
			$" == self next ] whileTrue ].
	chararacter isMSESeparator ] whileTrue: [ self next ]
]
