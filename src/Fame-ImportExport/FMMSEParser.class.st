Class {
	#name : #FMMSEParser,
	#superclass : #Object,
	#instVars : [
		'stream',
		'client',
		'buf',
		'char',
		'progBar',
		'lastUpdate',
		'characterSet'
	],
	#category : #'Fame-ImportExport'
}

{ #category : #expressions }
FMMSEParser >> Attribute [
	"Matches an attribute node (returns boolean)."

	"Attribute := OPEN n:NAME { beginAttribute(n) } Value* CLOSE { endAttribute(n) }"

	| pos n |
	pos := self pos.
	self tOPEN
		ifFalse: [ ^ self backtrack: pos ].
	n := self tNAME.
	n ifNil: [ ^ self backtrack: pos ].
	client beginAttribute: n.
	[ self Value ] whileTrue.
	self tCLOSE
		ifFalse: [ ^ self syntaxError ].
	client endAttribute: n.
	self tWHITESPACE.
	^ true
]

{ #category : #expressions }
FMMSEParser >> Document [
	"Matches a document node (returns a boolean)."

	"Document := EOF { openDocument; closeDocument }
		| OPEN { openDocument } Element* CLOSE { closeDocument }"

	self tWHITESPACE.
	self atEnd
		ifTrue: [ client beginDocument ]
		ifFalse: [ self tOPEN
				ifFalse: [ ^ self syntaxError ].
			client beginDocument.
			[ self Element ] whileTrue.
			self tCLOSE
				ifFalse: [ ^ self syntaxError ] ].
	client endDocument.
	self tWHITESPACE.
	^ true
]

{ #category : #expressions }
FMMSEParser >> Element [
	"Matches an element node (returns boolean)."
	"Element := OPEN n:FULLNAME { beginElement(n) } Serial? Attribute* CLOSE { endElement(n) }"
	| pos n |
	pos := self pos.
	self tOPEN ifFalse: [ ^ self backtrack: pos ].
	n := self tFULLNAME.
	n ifNil: [ ^ self backtrack: pos ].
	client beginElement: n.
	self Serial.
	[ self Attribute ] whileTrue.
	self tCLOSE ifFalse: [ ^ self syntaxError ].
	client endElement: n.
	self tWHITESPACE.
	
	self increment. "UI stuff"
	^ true
]

{ #category : #expressions }
FMMSEParser >> Identifier [
	"Matches numerical identifier (returns Number or nil)."

	"Identifier := digit+"

	(self characterSet isDigit: char)
		ifFalse: [ ^ nil ].
	
	buf reset.
	buf nextPut: char.
	[ self characterSet isDigit: self next ] whileTrue: [ buf nextPut: char ].
	self tWHITESPACE.
	^ Integer readFrom: buf contents readStream
]

{ #category : #expressions }
FMMSEParser >> Number [
	"Matches a number (returns Number or nil)."

	"Number := hypen? digit+ ( dot digit+ ( e hypen? digit+ )? )?"

	| pos |
	pos := self pos.
	buf reset.
	"hypen?	"
	$- == char
		ifTrue: [ buf nextPut: char.
			self next ].
	"digit+"
	(self characterSet isDigit: char)
		ifFalse: [ self backtrack: pos.
			^ nil ].
	[ buf nextPut: char.
	self characterSet isDigit: self next ] whileTrue.
	"(dot"
	$. == char
		ifTrue: [ buf nextPut: char.
			self next.
			"digit+"
			(self characterSet isDigit: char)
				ifFalse: [ self syntaxError.
					^ nil ].
			[ buf nextPut: char.
			self characterSet isDigit: self next ] whileTrue.
			"(e"
			$e == char
				ifTrue: [ buf nextPut: char.
					self next.
					"hypen?"
					$- == char
						ifTrue: [ buf nextPut: char.
							self next ].
					"digit+"
					(self characterSet isDigit: char)
						ifFalse: [ self syntaxError.
							^ nil ].
					[ buf nextPut: char.
					self characterSet isDigit: self next ] whileTrue
					")?)?" ] ].
	self tWHITESPACE.
	^ Number readFrom: buf contents readStream
]

{ #category : #expressions }
FMMSEParser >> Primitive [
	"Matches primitive value (returns boolean)."

	| p |
	p := self String.
	p ifNotNil: [ client primitive: p. ^ true ].
	p := self Number.
	p ifNotNil: [ client primitive: p. ^ true ].
	self tTRUE ifTrue: [ client primitive: true. ^ true ].
	self tFALSE ifTrue: [ client primitive: false. ^ true ].
	^ false
]

{ #category : #expressions }
FMMSEParser >> Reference [
	"Matches a Reference node (returns boolean)."
	"Reference --> OPEN REF n:Identifier { client referenceNumber: n } CLOSE"
	| pos serial |
	pos := self pos.
	self tOPEN ifFalse: [ ^ self backtrack: pos ].
	self tREF ifFalse: [ ^ self backtrack: pos ].
	serial := self Identifier.
	serial ifNil: [ ^ self backtrack: pos ].
	client referenceNumber: serial.
	self tCLOSE ifFalse: [ ^ self syntaxError ].
	self tWHITESPACE.
	^ true
]

{ #category : #expressions }
FMMSEParser >> Reference2 [
	"Matches a Reference node (returns boolean)."
	"Reference --> OPEN REF n:Name { client referenceName: n } CLOSE"
	| pos n |
	pos := self pos.
	self tOPEN ifFalse: [ ^ self backtrack: pos ].
	self tREF ifFalse: [ ^ self backtrack: pos ].
	n := self tFULLNAME.
	n ifNil: [ ^ self backtrack: pos ].
	client referenceName: n.
	self tCLOSE ifFalse: [ ^ self syntaxError ].
	self tWHITESPACE.
	^ true
]

{ #category : #expressions }
FMMSEParser >> Serial [
	"Matches a serial number node (returns boolean)."
	"Serial --> OPEN ID n:Identifier { client serial: n } CLOSE"
	| pos serial |
	pos := self pos.
	self tOPEN ifFalse: [ ^ self backtrack: pos ].
	self tID ifFalse: [ ^ self backtrack: pos ].
	serial := self Identifier.
	serial ifNil: [ ^ self backtrack: pos ].
	client serial: serial.
	self tCLOSE ifFalse: [ self syntaxError ].
	self tWHITESPACE.
	^ true
]

{ #category : #expressions }
FMMSEParser >> String [
	$' == char ifFalse: [ ^ nil ].
	
	buf reset.
	
	[ 
	[ self next.
	char ifNil: [ self syntaxError ].
	$' == char ] whileFalse: [ buf nextPut: char ].
	$' == self next ] whileTrue: [ buf nextPut: char ].
	self tWHITESPACE.
	^ buf contents
]

{ #category : #expressions }
FMMSEParser >> Value [
	"Matchs a value (returns true)."

	"Value := Reference | Primitive | Element"

	^ self Primitive or: [ self Reference or: [ self Reference2 or: [ self Element ] ] ]
]

{ #category : #testing }
FMMSEParser >> atEnd [
	^ char isNil
]

{ #category : #private }
FMMSEParser >> backtrack: integer [
	"Backtracks to given integer."

	integer ~~ stream position ifTrue: [
		stream position: integer - 1. 
		self next "fetch peek again" ]. 
	^false
]

{ #category : #running }
FMMSEParser >> basicRun [

	self Document.
	self atEnd ifFalse: [ ^self syntaxError ]
]

{ #category : #accessing }
FMMSEParser >> characterSet [
	^ characterSet ifNil: [ characterSet := char characterSet ]
]

{ #category : #accessing }
FMMSEParser >> client [

	^client
]

{ #category : #accessing }
FMMSEParser >> client: parseClient [

	client := parseClient
]

{ #category : #accessing }
FMMSEParser >> fromString: mseString [ 
	self stream: mseString readStream
]

{ #category : #running }
FMMSEParser >> increment [
	(progBar isNotNil and: [ (Time millisecondsSince: lastUpdate) >= 500 ])
		ifTrue: [ 
			progBar value: self pos.
			lastUpdate := Time millisecondClockValue ]
]

{ #category : #private }
FMMSEParser >> next [
	^char := stream next
]

{ #category : #testing }
FMMSEParser >> nextCharIsAlphanumeric [
	self next.
	^ (self characterSet isLetter: char) or: [ self characterSet isDigit: char ]
]

{ #category : #private }
FMMSEParser >> peek [
	^char
]

{ #category : #private }
FMMSEParser >> pos [
	^stream position 
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

	^stream
]

{ #category : #accessing }
FMMSEParser >> stream: aStream [

	stream := aStream.
	buf := String new writeStream.
	self next "look ahead"
]

{ #category : #private }
FMMSEParser >> syntaxError [
	self syntaxError: 'Syntax error at ', self pos printString.
	^nil.
]

{ #category : #private }
FMMSEParser >> syntaxError: aString [
	FMUtil default signal: (FMSyntaxError new parser: self; messageText: aString). 

	" Evaluate the following line to get text around the error:
		(stream contents copyFrom: self pos -10 to: self pos + 10) inspect.
	"
	
	^nil.
]

{ #category : #tokens }
FMMSEParser >> tCLOSE [
	"Matches opening parenthesis (returns boolean)."
	^ $) == char 
		ifTrue: 
			[ self
				next;
				tWHITESPACE.
			true ]
		ifFalse: [ false ]
]

{ #category : #tokens }
FMMSEParser >> tFALSE [
	"Matches false keyword (returns boolean)."
	$f == char ifTrue: 
		[ $a == self next ifTrue: 
			[ $l == self next ifTrue: 
				[ $s == self next ifTrue: 
					[ $e == self next ifTrue: 
						[ self
							next;
							tWHITESPACE.
						^ true ] ] ] ] ].
	^ false
]

{ #category : #tokens }
FMMSEParser >> tFULLNAME [
	(self characterSet isLetter: char) ifFalse: [ ^ nil ].
	
	buf reset.
	[	buf nextPut: char.
		[ self nextCharIsAlphanumeric or: [ char = $- ] ] whileTrue: [ buf nextPut: char ].
		$. == char ] whileTrue: 
			[	buf nextPut: char.
				(self characterSet isLetter: self next) ifFalse: [^self syntaxError ] ].
	$: == char ifTrue: [ ^self syntaxError ].
	self tWHITESPACE.
	^buf contents
]

{ #category : #tokens }
FMMSEParser >> tID [
	"Match id keyword (returns boolean)."
	$i == char ifTrue: 
		[ $d == self next ifTrue: 
			[ $: == self next ifTrue: 
				[ self
					next;
					tWHITESPACE.
				^ true ] ] ].
	^ false
]

{ #category : #tokens }
FMMSEParser >> tNAME [
	(self characterSet isLetter: char) ifFalse: [ ^ nil ].
	
	buf reset.
	buf nextPut: char.
	[ self nextCharIsAlphanumeric or: [char == $_] ] whileTrue: [ buf nextPut: char ].
	self tWHITESPACE.
	^ buf contents
]

{ #category : #tokens }
FMMSEParser >> tOPEN [
	"Matches opening parenthesis (returns boolean)."

	^ $( == char
		ifTrue: [ self
				next;
				tWHITESPACE.
			true ]
		ifFalse: [ false ]
]

{ #category : #tokens }
FMMSEParser >> tREF [
	"Matches ref keyword (returns boolean)."
	$r == char ifTrue: 
		[ $e == self next ifTrue: 
			[ $f == self next ifTrue: 
				[ $: == self next ifTrue: 
					[ self
						next;
						tWHITESPACE.
					^ true ] ] ] ].
	^ false
]

{ #category : #tokens }
FMMSEParser >> tTRUE [
	"Match 'true' and whitespace"
	$t == char ifTrue: 
		[ $r == self next ifTrue: 
			[ $u == self next ifTrue: 
				[ $e == self next ifTrue: 
					[ self
						next;
						tWHITESPACE.
					^ true ] ] ] ].
	^ false
]

{ #category : #tokens }
FMMSEParser >> tWHITESPACE [
	[ $" == char
		ifTrue: [ [ [ self next.
			nil == char ifTrue: [ ^ self syntaxError ].
			$" == char ] whileFalse.
			$" == self next ] whileTrue ].
	char isMSESeparator ] whileTrue: [ self next ]
]
