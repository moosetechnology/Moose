Class {
	#name : #DelphiScanner,
	#superclass : #SmaCCScanner,
	#instVars : [
		'ifDefCount',
		'definedItems',
		'undefinedItems',
		'ifDefs',
		'optComments',
		'optDepths',
		'parseOpt'
	],
	#classInstVars : [
		'definedItems',
		'undefinedItems'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #accessing }
DelphiScanner class >> definedItems [
	definedItems isNil
		ifTrue: [ self
				definedItems:
					#('MSWINDOWS' 'PC_MAPPED_EXCEPTIONS' 'PIC' 'VERSION3' 'CHAR_TYPES_INITIALIZED' 'CASE_MAP_INITIALIZED' 'USEGREEDYPASCAL' 'ADSDELPHI2006' 'CONDITIONALEXPRESSIONS' 'USEJCLDEBUG' 'WIN32' 'VER36') ].
	^ definedItems
]

{ #category : #accessing }
DelphiScanner class >> definedItems: aCollection [
	definedItems := Set withAll: (aCollection collect: [ :each | each asUppercase ])
]

{ #category : #'generated-initialization' }
DelphiScanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(135 'ABSOLUTE' 18) #(135 'ABSTRACT' 19) #(135 'AND' 20) #(135 'ARRAY' 21) #(135 'AS' 22) #(135 'ASM' 23) #(135 'ASSEMBLER' 24) #(135 'AT' 130) #(135 'BEGIN' 25) #(135 'CASE' 26) #(135 'CDECL' 27) #(135 'CLASS' 28) #(135 'CONST' 29) #(135 'CONSTRUCTOR' 30) #(135 'DEFAULT' 31) #(135 'DEPRECATED' 32) #(135 'DESTRUCTOR' 33) #(135 'DISPID' 34) #(135 'DISPINTERFACE' 35) #(135 'DIV' 36) #(135 'DO' 37) #(135 'DOWNTO' 38) #(135 'DYNAMIC' 39) #(135 'ELSE' 40) #(135 'END' 41) #(135 'EXCEPT' 42) #(135 'EXPORT' 43) #(135 'EXPORTS' 44) #(135 'EXTERNAL' 45) #(135 'FAR' 46) #(135 'FILE' 47) #(135 'FINAL' 48) #(135 'FINALIZATION' 49) #(135 'FINALLY' 50) #(135 'FOR' 51) #(135 'FORWARD' 52) #(135 'FUNCTION' 53) #(135 'GOTO' 54) #(135 'HELPER' 55) #(135 'IF' 56) #(135 'IMPLEMENTATION' 57) #(135 'IMPLEMENTS' 58) #(135 'IN' 59) #(135 'INDEX' 60) #(135 'INHERITED' 61) #(135 'INITIALIZATION' 62) #(135 'INLINE' 63) #(135 'INTERFACE' 64) #(135 'IS' 65) #(135 'LABEL' 66) #(135 'LIBRARY' 67) #(135 'LOCAL' 68) #(135 'MEM' 69) #(135 'MEMW' 70) #(135 'MESSAGE' 71) #(135 'MOD' 72) #(135 'NAME' 73) #(135 'NEAR' 74) #(135 'NODEFAULT' 75) #(135 'NOT' 76) #(135 'OBJECT' 77) #(135 'OF' 78) #(135 'ON' 79) #(135 'OPERATOR' 80) #(135 'OR' 81) #(135 'OUT' 82) #(135 'OVERLOAD' 83) #(135 'OVERRIDE' 84) #(135 'PACKED' 85) #(135 'PASCAL' 86) #(135 'PLATFORM' 87) #(135 'PRIVATE' 88) #(135 'PROCEDURE' 89) #(135 'PROGRAM' 90) #(135 'PROPERTY' 91) #(135 'PROTECTED' 92) #(135 'PUBLIC' 93) #(135 'PUBLISHED' 94) #(135 'RAISE' 95) #(135 'READ' 96) #(135 'READONLY' 97) #(135 'RECORD' 98) #(135 'REGISTER' 99) #(135 'REINTRODUCE' 100) #(135 'REPEAT' 101) #(135 'RESOURCESTRING' 102) #(135 'SAFECALL' 103) #(135 'SEALED' 104) #(135 'SET' 105) #(135 'SHL' 106) #(135 'SHR' 107) #(135 'STATIC' 108) #(135 'STDCALL' 109) #(135 'STORED' 110) #(135 'STRICT' 111) #(135 'THEN' 112) #(135 'THREADVAR' 113) #(135 'TO' 114) #(135 'TRY' 115) #(135 'TYPE' 116) #(135 'UNIT' 117) #(135 'UNSAFE' 118) #(135 'UNTIL' 119) #(135 'USES' 120) #(135 'VAR' 121) #(135 'VIRTUAL' 122) #(135 'WHILE' 123) #(135 'WITH' 124) #(135 'WRITE' 125) #(135 'WRITEONLY' 126) #(135 'XOR' 127) #(136 'ABSOLUTE' 18) #(136 'ABSTRACT' 19) #(136 'AND' 20) #(136 'ARRAY' 21) #(136 'AS' 22) #(136 'ASM' 23) #(136 'ASSEMBLER' 24) #(136 'AT' 130) #(136 'BEGIN' 25) #(136 'CASE' 26) #(136 'CDECL' 27) #(136 'CLASS' 28) #(136 'CONST' 29) #(136 'CONSTRUCTOR' 30) #(136 'DEFAULT' 31) #(136 'DEPRECATED' 32) #(136 'DESTRUCTOR' 33) #(136 'DISPID' 34) #(136 'DISPINTERFACE' 35) #(136 'DIV' 36) #(136 'DO' 37) #(136 'DOWNTO' 38) #(136 'DYNAMIC' 39) #(136 'ELSE' 40) #(136 'END' 41) #(136 'EXCEPT' 42) #(136 'EXPORT' 43) #(136 'EXPORTS' 44) #(136 'EXTERNAL' 45) #(136 'FAR' 46) #(136 'FILE' 47) #(136 'FINAL' 48) #(136 'FINALIZATION' 49) #(136 'FINALLY' 50) #(136 'FOR' 51) #(136 'FORWARD' 52) #(136 'FUNCTION' 53) #(136 'GOTO' 54) #(136 'HELPER' 55) #(136 'IF' 56) #(136 'IMPLEMENTATION' 57) #(136 'IMPLEMENTS' 58) #(136 'IN' 59) #(136 'INDEX' 60) #(136 'INHERITED' 61) #(136 'INITIALIZATION' 62) #(136 'INLINE' 63) #(136 'INTERFACE' 64) #(136 'IS' 65) #(136 'LABEL' 66) #(136 'LIBRARY' 67) #(136 'LOCAL' 68) #(136 'MEM' 69) #(136 'MEMW' 70) #(136 'MESSAGE' 71) #(136 'MOD' 72) #(136 'NAME' 73) #(136 'NEAR' 74) #(136 'NODEFAULT' 75) #(136 'NOT' 76) #(136 'OBJECT' 77) #(136 'OF' 78) #(136 'ON' 79) #(136 'OPERATOR' 80) #(136 'OR' 81) #(136 'OUT' 82) #(136 'OVERLOAD' 83) #(136 'OVERRIDE' 84) #(136 'PACKED' 85) #(136 'PASCAL' 86) #(136 'PLATFORM' 87) #(136 'PRIVATE' 88) #(136 'PROCEDURE' 89) #(136 'PROGRAM' 90) #(136 'PROPERTY' 91) #(136 'PROTECTED' 92) #(136 'PUBLIC' 93) #(136 'PUBLISHED' 94) #(136 'RAISE' 95) #(136 'READ' 96) #(136 'READONLY' 97) #(136 'RECORD' 98) #(136 'REGISTER' 99) #(136 'REINTRODUCE' 100) #(136 'REPEAT' 101) #(136 'RESOURCESTRING' 102) #(136 'SAFECALL' 103) #(136 'SEALED' 104) #(136 'SET' 105) #(136 'SHL' 106) #(136 'SHR' 107) #(136 'STATIC' 108) #(136 'STDCALL' 109) #(136 'STORED' 110) #(136 'STRICT' 111) #(136 'THEN' 112) #(136 'THREADVAR' 113) #(136 'TO' 114) #(136 'TRY' 115) #(136 'TYPE' 116) #(136 'UNIT' 117) #(136 'UNSAFE' 118) #(136 'UNTIL' 119) #(136 'USES' 120) #(136 'VAR' 121) #(136 'VIRTUAL' 122) #(136 'WHILE' 123) #(136 'WITH' 124) #(136 'WRITE' 125) #(136 'WRITEONLY' 126) #(136 'XOR' 127))
		do: [ :each | 
			(keywordMap at: each first ifAbsentPut: [ Dictionary new ])
				at: (each at: 2)
				put: each last ].
	^ keywordMap
]

{ #category : #accessing }
DelphiScanner class >> undefinedItems [
	undefinedItems isNil
		ifTrue: [ self
				undefinedItems:
					#('LINUX' 'DECLARE_GPL' 'DEBUG' 'ELF' 'STATIC_UNWIND' 'UNIX' 'KYLIX' 'HOOK_DLL_EXCEPTIONS' 'COMPILER_7_UP' 'WPDF_SOURCE' 'USECOMPATIBLEDC' 'ADSDELPHI4_OR_NEWER' 'USEGREEDYASM' 'CLR' 'BCB' 'DELPHI3' 'DELPHI4' 'DELPHI5' 'DELPHI6' 'DELPHI7' 'DEMO' 'LISTSERVER' 'METAFILE' 'PRNDIB_CKBOOL' 'PRNDIB_CKOVERFLOW' 'VSNET' 'TMSDOTNET' 'VER80' 'DOTNET' 'GRAPHICONTROL' 'CLX' 'TMSCLX' 'UMB') ].
	^ undefinedItems
]

{ #category : #accessing }
DelphiScanner class >> undefinedItems: aCollection [
	undefinedItems := Set withAll: (aCollection collect: [ :each | each asUppercase ])
]

{ #category : #generated }
DelphiScanner >> atId [
	^ 130
]

{ #category : #private }
DelphiScanner >> comment [
	| comment |
	comment := outputStream contents.
	(optDepths includes: ifDefCount)
		ifTrue:
			[ ('{$ELSE*' match: comment)
				ifTrue:
					[ optComments add: (Array with: start + 1 with: matchEnd).
					^ super comment ].
			(('{$ENDIF*' match: comment) or: [ '{$IFEND*' match: comment ])
				ifTrue:
					[ optComments add: (Array with: start + 1 with: matchEnd).
					optDepths remove: ifDefCount.
					^ super comment ] ].
	ifDefCount > 0
		ifTrue:
			[ ((('{$ELSE*' match: comment) and: [ ifDefCount = 1 ])
				or: [ ('{$ENDIF*' match: comment) or: [ '{$IFEND*' match: comment ] ])
				ifTrue:
					[ ifDefCount := ifDefCount - 1.
					ifDefCount = 0
						ifTrue: [ ifDefs last at: 2 put: start + comment size ] ]
				ifFalse: [ ('{$IF*' match: comment)
						ifTrue: [ ifDefCount := ifDefCount + 1 ] ] ]
		ifFalse:
			[ ('{$IF*' match: comment)
				ifTrue: [ ^ self processIfMacro: comment ].
			('{$ELSE*' match: comment)
				ifTrue: [ ^ self skipUntilEndDef ] ].
	^ super comment
]

{ #category : #generated }
DelphiScanner >> constantIdentifierId [
	^ 136
]

{ #category : #generated }
DelphiScanner >> controlCharacterId [
	^ 367
]

{ #category : #accessing }
DelphiScanner >> definedItems [
	^ definedItems
]

{ #category : #accessing }
DelphiScanner >> definedItems: aCollection [
	definedItems := aCollection
]

{ #category : #generated }
DelphiScanner >> emptySymbolTokenId [
	^ 368
]

{ #category : #generated }
DelphiScanner >> errorTokenId [
	^ 369
]

{ #category : #generated }
DelphiScanner >> identifierId [
	^ 135
]

{ #category : #'initialize-release' }
DelphiScanner >> ifDefs [
	^ ifDefs
]

{ #category : #'initialize-release' }
DelphiScanner >> initialize [
	super initialize.
	ifDefCount := 0.
	definedItems := self class definedItems.
	undefinedItems := self class undefinedItems.
	comments := OrderedCollection new.
	optComments := OrderedCollection new.
	optDepths := OrderedCollection new.
	ifDefs := OrderedCollection new
]

{ #category : #private }
DelphiScanner >> integerWithRange [
	stream skip: -2.
	matchEnd := matchEnd - 2.
	matchActions := Array with: self numberId.
	^ self
		createTokenFor:
			(outputStream
				skip: -2;
				contents)
]

{ #category : #generated }
DelphiScanner >> keywordFor: aString [
	^ aString asUppercase
]

{ #category : #generated }
DelphiScanner >> minusId [
	^ 131
]

{ #category : #generated }
DelphiScanner >> numberId [
	^ 137
]

{ #category : #accessing }
DelphiScanner >> optComments [
	^ optComments
]

{ #category : #accessing }
DelphiScanner >> optComments: anObject [
	optComments := anObject
]

{ #category : #accessing }
DelphiScanner >> parseOpt [
	^ parseOpt ifNil: [ false ]
]

{ #category : #accessing }
DelphiScanner >> parseOpt: aBoolean [
	parseOpt := aBoolean
]

{ #category : #generated }
DelphiScanner >> plusId [
	^ 132
]

{ #category : #private }
DelphiScanner >> processIfMacro: comment [
	| command name index bad |
	index := (1 to: comment size)
		detect: [ :each | (comment at: each) isSeparator ]
		ifNone: [ comment size ].
	command := comment copyFrom: 3 to: index - 1.
	name := index = comment size
		ifTrue: [ '' ]
		ifFalse: [ (comment copyFrom: index + 1 to: comment size - 1) trim ].
	bad := #().
	('DEFINED(*)' match: name)
		ifTrue:
			[ bad := self undefinedItems.
			name := name copyFrom: 9 to: name size - 1 ].
	(command sameAs: 'IFDEF')
		ifTrue: [ bad := self undefinedItems ].
	(command sameAs: 'IFNDEF')
		ifTrue: [ bad := self definedItems ].
	(bad includes: name asUppercase)
		ifTrue: [ ^ self skipUntilEndDef ].
	(self parseOpt
		and: [ (command sameAs: 'IFOPT') and: [ name sameAs: 'C+' ] ])
		ifTrue:
			[ optDepths add: ifDefCount.
			optComments add: (Array with: start + 1 with: matchEnd) ].
	^ super comment
]

{ #category : #private }
DelphiScanner >> processIncludeFile: aString [
	^ self next
]

{ #category : #generated }
DelphiScanner >> scan1 [
	self step.
	currentCharacter == $$
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self recordMatch: #(139).
					self step.
					currentCharacter == $#
						ifTrue: [ ^ self scan1 ].
					currentCharacter == $'
						ifTrue: [ ^ self scan2 ].
					currentCharacter == $^
						ifTrue: [ ^ self scan6 ].
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(139).
			self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan1 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			currentCharacter == $^
				ifTrue: [ ^ self scan6 ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan10 [
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan11 [
	[ self recordMatch: #(137).
	self step.
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan12 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan12 [
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(137).
			self step.
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	('+-' includes: currentCharacter)
		ifTrue: [ self step.
			currentCharacter isDigit
				ifTrue: [ [ self recordMatch: #(137).
					self step.
					currentCharacter isDigit ] whileTrue ] ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan13 [
	[ self recordMatch: #(137).
	self step.
	currentCharacter == $.
		ifTrue: [ self recordMatch: #(137).
			self step.
			currentCharacter == $.
				ifTrue: [ ^ self recordAndReportMatch: #(138) ].
			currentCharacter isDigit
				ifTrue: [ ^ self scan11 ].
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan12 ].
			^ self reportLastMatch ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan12 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan14 [
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue: [ self recordMatch: #(143).
			self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan7 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			currentCharacter == $^
				ifTrue: [ ^ self scan14 ] ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan15 [
	[ self step.
	currentCharacter == $`
		ifTrue: [ self recordMatch: #(142).
			self step.
			currentCharacter == $`
				ifTrue: [ ^ self scan15 ].
			^ self reportLastMatch ].
	true ] whileTrue
]

{ #category : #generated }
DelphiScanner >> scan2 [
	[ self step.
	currentCharacter == $'
		ifTrue: [ ^ self scan3 ].
	true ] whileTrue
]

{ #category : #generated }
DelphiScanner >> scan3 [
	self recordMatch: #(139).
	self step.
	currentCharacter == $#
		ifTrue: [ ^ self scan4 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $^
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan4 [
	self step.
	currentCharacter == $$
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self recordMatch: #(139).
					self step.
					currentCharacter == $#
						ifTrue: [ ^ self scan4 ].
					currentCharacter == $'
						ifTrue: [ ^ self scan2 ].
					currentCharacter == $^
						ifTrue: [ ^ self scan5 ].
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(139).
			self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan4 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			currentCharacter == $^
				ifTrue: [ ^ self scan5 ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan5 [
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan6 [
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue: [ self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan7 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			currentCharacter == $^
				ifTrue: [ ^ self scan6 ] ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan7 [
	self step.
	currentCharacter == $$
		ifTrue: [ self step.
			(currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ])
				ifTrue: [ [ self step.
					currentCharacter == $#
						ifTrue: [ ^ self scan7 ].
					currentCharacter == $'
						ifTrue: [ ^ self scan2 ].
					currentCharacter == $^
						ifTrue: [ ^ self scan6 ].
					currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ [ self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan7 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			currentCharacter == $^
				ifTrue: [ ^ self scan6 ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan8 [
	self step.
	(currentCharacter isDigit
		or: [ (currentCharacter between: $A and: $F)
				or: [ currentCharacter between: $a and: $f ] ])
		ifTrue: [ [ self recordMatch: #(137).
			self step.
			currentCharacter isDigit
				or: [ (currentCharacter between: $A and: $F)
						or: [ currentCharacter between: $a and: $f ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scan9 [
	[ self step.
	currentCharacter == $*
		ifTrue: [ [ self step.
			currentCharacter == $)
				ifTrue: [ ^ self recordAndReportMatch: #(140) ].
			currentCharacter == $* ] whileTrue.
			^ self scan9 ].
	true ] whileTrue
]

{ #category : #private }
DelphiScanner >> scanControlCharacter [
	stream peek isLetter
		ifFalse: [ ^ nil ].
	start := stream position - 1.
	matchActions := Array with: self controlCharacterId.
	^ self createTokenFor: (String with: $^ with: stream next)
]

{ #category : #generated }
DelphiScanner >> scanForToken [
	self step.
	currentCharacter == $#
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $$
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $&
		ifTrue:
			[ ^ self scanForTokenX6 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $(
		ifTrue:
			[ ^ self scanForTokenX11 ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	^ self scanForTokenX14
]

{ #category : #generated }
DelphiScanner >> scanForTokenX1 [
	self recordMatch: #(134).
	self step.
	((currentCharacter between: $A and: $Z)
		or: [ currentCharacter between: $a and: $z ])
		ifTrue: [ self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan7 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			currentCharacter == $^
				ifTrue: [ ^ self scan14 ] ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX10 [
	self recordMatch: #(9).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX11 [
	self recordMatch: #(2).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan9 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX12 [
	[ self recordMatch: #(135 136).
	self step.
	currentCharacter isAlphaNumeric ] whileTrue
]

{ #category : #generated }
DelphiScanner >> scanForTokenX13 [
	currentCharacter == $[
		ifTrue: [ ^ self recordAndReportMatch: #(128) ].
	currentCharacter == $]
		ifTrue: [ ^ self recordAndReportMatch: #(129) ].
	currentCharacter == $^
		ifTrue:
			[ ^ self scanForTokenX1 ].
	currentCharacter == $`
		ifTrue: [ ^ self scan15 ].
	currentCharacter == ${
		ifTrue: [ [ self step.
			currentCharacter == $}
				ifTrue: [ ^ self recordAndReportMatch: #(140) ].
			true ] whileTrue ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan13 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp
				or: [ currentCharacter =
						(Character value: 26) ] ])
		ifTrue:
			[ ^ self scanForTokenX3 ].
	currentCharacter isLetter
		ifTrue:
			[ self scanForTokenX12 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX14 [
	currentCharacter == $*
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $+
		ifTrue:
			[ ^ self scanForTokenX5 ].
	currentCharacter == $,
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $-
		ifTrue:
			[ ^ self scanForTokenX4 ].
	currentCharacter == $.
		ifTrue:
			[ ^ self scanForTokenX8 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX2 ].
	currentCharacter == $:
		ifTrue:
			[ ^ self scanForTokenX10 ].
	currentCharacter == $;
		ifTrue: [ ^ self recordAndReportMatch: #(133) ].
	currentCharacter == $<
		ifTrue:
			[ ^ self scanForTokenX7 ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(14) ].
	currentCharacter == $>
		ifTrue:
			[ ^ self scanForTokenX9 ].
	currentCharacter == $@
		ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	^ self scanForTokenX13
]

{ #category : #generated }
DelphiScanner >> scanForTokenX2 [
	self recordMatch: #(8).
	self step.
	currentCharacter == $/
		ifTrue: [ [ self step.
			(currentCharacter == Character lf
				or: [ currentCharacter == Character cr ])
				ifTrue: [ ^ self recordAndReportMatch: #(140) ].
			true ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX3 [
	[ self recordMatch: #(141).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp
				or: [ currentCharacter =
						(Character value: 26) ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX4 [
	self recordMatch: #(131).
	self step.
	currentCharacter == $$
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $.
		ifTrue: [ ^ self scan10 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan13 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX5 [
	self recordMatch: #(132).
	self step.
	currentCharacter == $$
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $.
		ifTrue: [ ^ self scan10 ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan13 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX6 [
	self step.
	('Oo' includes: currentCharacter)
		ifTrue: [ self step.
			('Pp' includes: currentCharacter)
				ifTrue: [ self step.
					('Ee' includes: currentCharacter)
						ifTrue: [ self step.
							('Rr' includes: currentCharacter)
								ifTrue: [ self step.
									('Aa' includes: currentCharacter)
										ifTrue: [ self step.
											('Tt' includes: currentCharacter)
												ifTrue: [ self step.
													('Oo' includes: currentCharacter)
														ifTrue: [ self step.
															('Rr' includes: currentCharacter)
																ifTrue: [ ^ self recordAndReportMatch: #(1) ] ] ] ] ] ] ] ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX7 [
	self recordMatch: #(11).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX8 [
	self recordMatch: #(6).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> scanForTokenX9 [
	self recordMatch: #(15).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(16) ].
	^ self reportLastMatch
]

{ #category : #generated }
DelphiScanner >> semicolonId [
	^ 133
]

{ #category : #private }
DelphiScanner >> skipToEndToken [
	| token previous |
	previous := SmaCCToken value: ''.
	[ [ stream atEnd
		or: [ (token := self next) value asUppercase ~= 'END' ] ]
		whileTrue: [ previous := token ].
	previous value = '@' ] whileTrue.
	(token value sameAs: 'END')
		ifTrue: [ stream position: token startPosition - 1 ]
]

{ #category : #private }
DelphiScanner >> skipUntilEndDef [
	| value entry |
	entry := Array with: start + 1 with: nil.
	ifDefs add: entry.
	comments add: (Array with: start + 1 with: matchEnd).
	ifDefCount := 1.
	[ value := self next.
	ifDefCount > 0 ] whileTrue.
	^ value
]

{ #category : #generated }
DelphiScanner >> tokenActions [
	^ #(nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #integerWithRange nil #comment #whitespace #patternToken)
]

{ #category : #generated }
DelphiScanner >> tokenClass [
	^SmaCCCaseInsensitiveToken
]

{ #category : #private }
DelphiScanner >> undefinedItems [
	^ undefinedItems
]

{ #category : #accessing }
DelphiScanner >> undefinedItems: aCollection [
	undefinedItems := aCollection
]

{ #category : #generated }
DelphiScanner >> upArrowId [
	^ 134
]
