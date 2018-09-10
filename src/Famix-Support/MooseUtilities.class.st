Class {
	#name : #MooseUtilities,
	#superclass : #Object,
	#category : #'Famix-Support'
}

{ #category : #private }
MooseUtilities class >> browserCategoryTag [
	^'browsercategory '
]

{ #category : #naming }
MooseUtilities class >> browserCategoryToSourceAnchor: aCategory [
	"returns a string representing the source anchor for smalltalk method entities"

	^self browserCategoryTag , aCategory asString
]

{ #category : #private }
MooseUtilities class >> classNamed: aClassNameSymbol orNilInNamespace: aNamespace [
	"return the class defined in the namespace or its contained namespace or nil"

	| res |
	res := aNamespace allClasses
		detect:
			[:each | 
			each name asSymbol == aClassNameSymbol
				or: [each fullName asSymbol == aClassNameSymbol]]
		ifNone: [nil].
	^res
]

{ #category : #'naming conventions' }
MooseUtilities class >> demoosify: aString [

	^aString
		copyReplaceAll: self famixNamespaceSeparator
		with: self smalltalkNamespaceSeparator
]

{ #category : #'encoding extraction' }
MooseUtilities class >> extractCategoryNameFromMoose: aString [
	"returns the first part of a compound string. In Moose the variable name are composed this way"

	"(self extractCategoryNameFromMoose: (self browserCategoryToSourceAnchor: 'accessing')) = 'accessing'"

	| tag |
	tag := self browserCategoryTag.
	aString
		findString: tag
		startingAt: 1.
	^aString
		copyFrom: tag size + 1
		to: aString size
]

{ #category : #'encoding extraction' }
MooseUtilities class >> extractMethodSelectorFromMoose: aString [
	"returns the first part of a compound string. In Moose the variable name are composed this way"

	"self extractMethodSelectorFromMoose: #'accept:node:()' 'accept:node:'"

	"self extractMethodSelectorFromMoose: #'accept()' 'accept'"

	^aString copyUpTo: $(
]

{ #category : #'encoding extraction' }
MooseUtilities class >> extractMooseClassSymbolFrom: aString [
	"returns the class name of a Moose  variable name"

	"self extractMooseClassSymbolFrom: #'LanInterface.super'"

	"self extractMooseClassSymbolFrom: #'LanInterface.self'"

	"self extractMooseClassSymbolFrom: #'LanInterface.self.dddd'"

	^aString classPart
]

{ #category : #'encoding extraction' }
MooseUtilities class >> extractPathFromAnchor: anchor [
	| start end path |
	start := anchor indexOf: $".
	end := anchor lastIndexOf: $".
	path := anchor
		copyFrom: start + 1
		to: end - 1.
	^path
]

{ #category : #'encoding extraction' }
MooseUtilities class >> extractStartFromAnchor: anchor [
	| begin end start |
	begin := (anchor
		indexOfSubCollection: 'start'
		startingAt: 1) + 6.
	end := (anchor
		indexOfSubCollection: 'end'
		startingAt: 1) - 2.
	start := anchor
		copyFrom: begin
		to: end.
	^start asNumber
]

{ #category : #'naming conventions' }
MooseUtilities class >> famixFullClassNameForSmalltalkFullName: aBinding [
	"only sent by UnitTests, not by domain"

	^(self findClassNamedOrNilFromFullName: aBinding) mooseName
]

{ #category : #'naming conventions' }
MooseUtilities class >> famixFullMetaclassNameForSmalltalkFullName: aBinding [
	^(self findClassNamedOrNilFromFullName: aBinding) class mooseName
]

{ #category : #'naming conventions' }
MooseUtilities class >> famixFullNamespaceNameForSmalltalkNamespace: aNamespace [
	"self FAMIX2FullNamespaceNameForSmalltalkNamespace:#{SCG.Moose} value"

	"self halt: 'Soops: inlined all senders for speed'"

	^aNamespace mooseName
]

{ #category : #'naming conventions' }
MooseUtilities class >> famixNameFromFamixFullName: aFullName [
	" (aFullName copyFrom: 1 to: (aFullName lastIndexOf: $:) - 2) asSymbol"

	^(aFullName
		copyFrom:
			aFullName size
				-
					(aFullName reverse
						indexOfSubCollection: self famixNamespaceSeparator
						startingAt: 1) + 2
		to: aFullName size) asSymbol
]

{ #category : #'naming conventions' }
MooseUtilities class >> famixNamespaceNameFromFamixFullName: aFullName [
	" (aFullName copyFrom: 1 to: (aFullName lastIndexOf: $:) - 2) asSymbol"

	^(aFullName
		copyFrom: 1
		to:
			aFullName size
				-
					(aFullName reverse
						indexOfSubCollection: self famixNamespaceSeparator
						startingAt: 1) - 1) asSymbol
]

{ #category : #'naming conventions' }
MooseUtilities class >> famixNamespaceSeparator [
	^'::'
]

{ #category : #'getting classes' }
MooseUtilities class >> findClassNamedOrNilFromFullName: stClassFullNameSymbol [
	"returns the class whose name is aClassFullNameSymbol. 
	aClassFullNameSymbol should smalltalk and not moose related.and should not represent a metaclass"
	
	^ self class environment at: stClassFullNameSymbol asSymbol ifAbsent: [nil]

	"Alternative could be 
						cls := Compiler evaluate: 'SomeClassName'.
						cls isBehavior
						ifTrue: [^cls]"

	"Or older alternative dealing with namespaces:
		| aClassNameSymbol |	
		aClassNameSymbol := aClassFullNameSymbol asSymbol.
		^Root allClasses detect: [:each | each fullName asSymbol == aClassNameSymbol]
			ifNone: [nil]	"

"	^(stClassFullNameSymbol includes: $.)
		ifTrue:
			[(LiteralBindingReference pathString: stClassFullNameSymbol asString)
				ifDefinedDo: [:cl | cl]
				elseDo: [nil]]
		ifFalse:
			[self
				findClassNamedOrNilFromFullName:
					('Smalltalk.' , stClassFullNameSymbol) asSymbol]"
]

{ #category : #testing }
MooseUtilities class >> isStoreLoaded [
	^false
]

{ #category : #'getting classes' }
MooseUtilities class >> isVariableAClass: aSymbol [
	"self isVariableAClass: self name"

	"returns true if aSymbol represents a Class"
	aSymbol size = 0 ifTrue: [^false].
	aSymbol first isLowercase ifTrue: [^false].
	^ (Smalltalk at: aSymbol) isBehavior
	
	"aString asQualifiedReference bindingOrNil
		ifNil:
			[Root allClasses anySatisfy: [:each | each name asString = aString]]
		ifNotNil: [aString asQualifiedReference bindingOrNil isForClass]"
]

{ #category : #'getting classes' }
MooseUtilities class >> isVariableAGlobal: aString [
	"returns true if aString represents a GlobalVariable"

	| globalObject |
	globalObject := Smalltalk at: aString printString withoutQuoting asSymbol ifAbsent: [^false].
	^ globalObject isBehavior not and: [globalObject isTrait not].

	"qualified := aString asQualifiedReference.
	qualified isDefined ifFalse: [^false].
	bin := qualified bindingOrNil.
	^bin isNil
		ifTrue: [false]
		ifFalse: [bin isForGeneral]"
]

{ #category : #private }
MooseUtilities class >> metaclassTag [
	"The meta class tag used in FAMIX2."

	^'_class'
]

{ #category : #'naming conventions' }
MooseUtilities class >> moosify: aString [

	^aString
		copyReplaceAll: self smalltalkNamespaceSeparator
		with: self famixNamespaceSeparator
]

{ #category : #naming }
MooseUtilities class >> signatureFromSmalltalkSelectorOn: aName [
	"self signatureFromSmalltalkSelector: #new"

	"self signatureFromSmalltalkSelector: #new:"

	"self signatureFromSmalltalkSelector: #with:with:"

	"self signatureFromSmalltalkSelector: #with:with:with:"

	"self signatureFromSmalltalkSelector: #'+'"

	| sym ws numArgs |
	sym := aName asSymbol.
	numArgs := sym numArgs.
	ws := WriteStream on: (String new: sym size + (numArgs * 7) + 3).
	ws
		nextPutAll: sym;
		nextPut: $(.
	1
		to: numArgs
		do: [:inx | ws nextPutAll: 'Object,'].
	numArgs > 0 ifTrue: [ws skip: -1	"remove last space"].
	ws nextPut: $).
	^ws contents asSymbol
]

{ #category : #'naming conventions' }
MooseUtilities class >> smalltalkClassFromFamixClassName: aFAMIXName [
	^ self smalltalkClassFromFamixClassName: aFAMIXName ifAbsent: [
		self error: 'No Smalltalk class corresponds to the, ', aFAMIXName, ' FAMIX name']
]

{ #category : #'naming conventions' }
MooseUtilities class >> smalltalkClassFromFamixClassName: aFAMIXName ifAbsent: aBlock [
	"Given the FAMIX2 name for a class (for a meta class or not): return 
	that Smalltalk class."

	| stName isMeta newName res |
	stName := self smalltalkClassNameFromFamixClassName: aFAMIXName.
	isMeta := '*' , self stMetaclassTag match: stName.
	newName := isMeta 
		ifTrue: [stName copyFrom: 1 to: stName size - self stMetaclassTag size]
		ifFalse: [stName].
	res := self findClassNamedOrNilFromFullName: newName.
	^res isNil
		ifTrue: [aBlock value]
		ifFalse: [isMeta ifTrue: [res class] ifFalse: [res]]
]

{ #category : #'naming conventions' }
MooseUtilities class >> smalltalkClassNameFromFamixClassName: aFAMIXName [
	"Given the FAMIX2 name for a class (for a meta class or not): return the Smalltalk name."

	| isMetaclass index |
	isMetaclass := '*' , self metaclassTag match: aFAMIXName.
	
	"we check whether there is a reference to a namespace in the famix name"
	index := aFAMIXName findString: self famixNamespaceSeparator.
	index := index isZero 
				ifTrue: [1]
				ifFalse: [(aFAMIXName findString: self famixNamespaceSeparator) + self famixNamespaceSeparator size].
	^ isMetaclass
		ifTrue: [ ((aFAMIXName copyFrom: index to: ((aFAMIXName findString: self metaclassTag) -1) ), ' class') asSymbol]
		ifFalse: [ (aFAMIXName copyFrom: index to: aFAMIXName size) asSymbol ]

]

{ #category : #'naming conventions' }
MooseUtilities class >> smalltalkNamespaceSeparator [
	^'.'
]

{ #category : #'naming conventions' }
MooseUtilities class >> soleClassNameFromFamixName: aFAMIX2Name [
	"return the class (sole instance) of the FAMIX2 name"

	| FAMIX2Name isMetaclass |
	FAMIX2Name := self smalltalkClassNameFromFamixClassName: aFAMIX2Name.
	isMetaclass := '*' , self stMetaclassTag match: FAMIX2Name.
	^isMetaclass
		ifTrue:
			[(FAMIX2Name
				copyFrom: 1
				to: FAMIX2Name size - self metaclassTag size) asSymbol]
		ifFalse: [FAMIX2Name]
]

{ #category : #private }
MooseUtilities class >> stMetaclassTag [
	"The meta class tag used in SmalltLK."

	^' class'
]

{ #category : #naming }
MooseUtilities class >> stopWordList [
	"Answer a list of english stop words, a defind by SMART.  See ftp://ftp.cs.cornell.edu/pub/smart/"

	^'a a''s able about above according accordingly across actually after afterwards again against ain''t all allow allows almost alone along already also although always am among amongst an and another any anybody anyhow anyone anything anyway anyways anywhere apart appear appreciate appropriate are aren''t around as aside ask asking associated at available away awfully b be became because become becomes becoming been before beforehand behind being believe below beside besides best better between beyond both brief but by c c''mon c''s came can can''t cannot cant cause causes certain certainly changes clearly co com come comes concerning consequently consider considering contain containing contains corresponding could couldn''t course currently d definitely described despite did didn''t different do does doesn''t doing don''t done down downwards during e each edu eg eight either else elsewhere enough entirely especially et etc even ever every everybody everyone everything everywhere ex exactly example except f far few fifth first five followed following follows for former formerly forth four from further furthermore g get gets getting given gives go goes going gone got gotten greetings h had hadn''t happens hardly has hasn''t have haven''t having he he''s hello help hence her here here''s hereafter hereby herein hereupon hers herself hi him himself his hither hopefully how howbeit however i i''d i''ll i''m i''ve ie if ignored immediate in inasmuch inc indeed indicate indicated indicates inner insofar instead into inward is isn''t it it''d it''ll it''s its itself j just k keep keeps kept know knows known l last lately later latter latterly least less lest let let''s like liked likely little look looking looks ltd m mainly many may maybe me mean meanwhile merely might more moreover most mostly much must my myself n name namely nd near nearly necessary need needs neither never nevertheless new next nine no nobody non none noone nor normally not nothing novel now nowhere o obviously of off often oh ok okay old on once one ones only onto or other others otherwise ought our ours ourselves out outside over overall own p particular particularly per perhaps placed please plus possible presumably probably provides q que quite qv r rather rd re really reasonably regarding regardless regards relatively respectively right s said same saw say saying says second secondly see seeing seem seemed seeming seems seen self selves sensible sent serious seriously seven several shall she should shouldn''t since six so some somebody somehow someone something sometime sometimes somewhat somewhere soon sorry specified specify specifying still sub such sup sure t t''s take taken tell tends th than thank thanks thanx that that''s thats the their theirs them themselves then thence there there''s thereafter thereby therefore therein theres thereupon these they they''d they''ll they''re they''ve think third this thorough thoroughly those though three through throughout thru thus to together too took toward towards tried tries truly try trying twice two u un under unfortunately unless unlikely until unto up upon us use used useful uses using usually uucp v value various very via viz vs w want wants was wasn''t way we we''d we''ll we''re we''ve welcome well went were weren''t what what''s whatever when whence whenever where where''s whereafter whereas whereby wherein whereupon wherever whether which while whither who who''s whoever whole whom whose why will willing wish with within without won''t wonder would would wouldn''t x y yes yet you you''d you''ll you''re you''ve your yours yourself yourselves z zero'
		runsFailing: #isSeparator
]
