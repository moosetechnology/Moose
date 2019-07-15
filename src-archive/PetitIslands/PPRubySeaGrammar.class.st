"
I can recognize basic structure block in ruby code (almost precisely).

I use indentation to determine the scope of the block. I use island to skip the rest.

The following structures are recognized:
- modules
- classes
- methods
"
Class {
	#name : #PPRubySeaGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'primary',
		'kClassIS',
		'cpath',
		'superclass',
		'identifier',
		'kSelf',
		'word',
		'fname',
		'classDef',
		'methodDef',
		'primaryElement',
		'water',
		'operator',
		'program',
		'kDefIS',
		'defEndIS',
		'kModuleIS',
		'moduleDef',
		'eigenDef',
		'body',
		'kEndIS',
		'kEnd',
		'comment',
		'string',
		'aligns',
		'nl',
		'setIl',
		'onside',
		'restoreIl',
		'sol',
		'eol',
		'eof',
		'onsideLine'
	],
	#category : #'PetitIslands-Examples'
}

{ #category : #indentation }
PPRubySeaGrammar >> aligns [
	^ [:context |
		(context column == (context indentStack topIfEmpty: -1)) ifTrue: [ 
			#aligns
		] ifFalse: [
			PPFailure message: 'no alignment' at: context position
		]
	] asParser
		"JK: this is a hack, it improves the speed of compiled parser"
		propertyAt: #changesContext put: false;
		yourself
]

{ #category : #grammar }
PPRubySeaGrammar >> body [
	^	((((primaryElement) sea: water) ==> #second) plus) 
			==> [ :args | args select: [ :e | e isEmpty not ]]
	/
		((nil asParser sea: water) ==> [ :args | #() ])
]

{ #category : #'grammar - class' }
PPRubySeaGrammar >> classDef [
	"Indentation Sensitive Class Definition"
	^ kClassIS, 
		cpath trim, 
		superclass optional, 
		body, 
		kEndIS
	
	
	map: [ :cl :cp :sup :content :end | 
		| retval |
		retval := OrderedCollection new.
		content do: [ :m |
			retval addAll: (m collect: [:e | '::', cp, e ]).
		].
		retval.
	]
]

{ #category : #whitespaces }
PPRubySeaGrammar >> comment [
	^ $# asParser trimBlanks, (nl negate star), nl
]

{ #category : #grammar }
PPRubySeaGrammar >> cpath [
	^ ('::' asParser optional , identifier, (('::' asParser , identifier) star)) flatten
]

{ #category : #'grammar - method' }
PPRubySeaGrammar >> defEndIS [
	"End of Indentation Sensitive Feature"
	^ kEnd optional, restoreIl
]

{ #category : #grammar }
PPRubySeaGrammar >> eigenDef [
	^ kClassIS , '<<' asParser trim , (identifier / kSelf) , 
		body, 
		kEndIS 
	
	map: [ :class :tmp :ref :content :end |
		| retval |
		retval := OrderedCollection new.
		content do: [ :m |
			retval addAll: (m collect: [:e | '.', ref, e ]).
		].
		retval.		
	]

]

{ #category : #whitespaces }
PPRubySeaGrammar >> eof [
	^ #eof asParser
]

{ #category : #whitespaces }
PPRubySeaGrammar >> eol [
	^ nl / eof
]

{ #category : #grammar }
PPRubySeaGrammar >> fname [
	^ (operator / 
		'..' asParser / '|' asParser / 'ˆ' asParser / '&' asParser 
		/ '<=>' asParser / '==' asParser / 
		'===' asParser / '=~' asParser / '>'asParser / '>='asParser / '<' asParser / 
		'<=' asParser / '+' asParser / '-' asParser / 
		'*' asParser / '/' asParser /	'%' asParser / '**' asParser / '<<' asParser / 
		'>>' asParser / '~' asParser / '+@' asParser / 
		'-@' asParser / '[]' asParser / '[]=' asParser)

]

{ #category : #grammar }
PPRubySeaGrammar >> identifier [
	^ (#letter asParser / $_ asParser, word star) flatten
]

{ #category : #keywords }
PPRubySeaGrammar >> kClassIS [
	^ (($. asParser / word) previous not, setIl, 'class' asParser , ($. asParser / word) not) ==> #third
]

{ #category : #keywords }
PPRubySeaGrammar >> kDefIS [
	^ (word previous not, setIl, 'def' asParser , word not) ==> #third
]

{ #category : #keywords }
PPRubySeaGrammar >> kEnd [
	^ (word previous not, 'end' asParser , word not) ==> #second
]

{ #category : #keywords }
PPRubySeaGrammar >> kEndIS [
	"End of Indentation Sensitive Feature"
	^ aligns, kEnd, restoreIl
]

{ #category : #keywords }
PPRubySeaGrammar >> kModuleIS [
	^ (word previous not, setIl, 'module' asParser , word not) trim ==> #third
]

{ #category : #keywords }
PPRubySeaGrammar >> kSelf [
	^ (($. asParser / word) previous not, 'self' asParser , ($. asParser / word) not) trim ==> #second
]

{ #category : #whitespaces }
PPRubySeaGrammar >> line [
	^ (sol, nl negate star, eol) nonEmpty
]

{ #category : #'grammar - method' }
PPRubySeaGrammar >> methodDef [
	^ kDefIS, 
		('self.' asParser / (identifier, $. asParser)) flatten trim optional ,
		fname trim, 
		primary,
	  	defEndIS 
	
	map: [ :def :static :name :content :end |
		| mName retval |
		mName := static isNil 	ifTrue: [ '.', name ]
										ifFalse: [ '.', static, name ].

		retval := OrderedCollection new.
		content do: [ :e | retval addAll: (e collect: [ :e2 | mName, e2 ]) ].
		retval add: mName.
		retval										
	]

]

{ #category : #grammar }
PPRubySeaGrammar >> moduleDef [
	"Indentation Sensitive Class Definition"
	^ kModuleIS, 
		cpath trim, 
		body, 
		kEndIS
	
	
	map: [ :module :cp :prim :end | 
		| retval |
		retval := OrderedCollection new.
		prim do: [ :m |
			retval addAll: (m collect: [:e | '::', cp, e ]).
		].
		retval.
	]
]

{ #category : #whitespaces }
PPRubySeaGrammar >> nl [
	^ #newline asParser
]

{ #category : #indentation }
PPRubySeaGrammar >> onside [
	^ [:context |
		(context column >= (context indentStack topIfEmpty: -1)) ifTrue: [ 
			#onside
		] ifFalse: [
			PPFailure message: 'offside position, not onside :(' at: context position
		]
	] asParser
		"JK: this is a hack, it improves the speed of compiled parser"
		propertyAt: #changesContext put: false;
		yourself
]

{ #category : #whitespaces }
PPRubySeaGrammar >> onsideLine [
	^ onside, #letter asParser, nl asParser negate star, eol
]

{ #category : #grammar }
PPRubySeaGrammar >> operator [
	^ (identifier , ($? asParser / $! asParser / $= asParser) optional) flatten

]

{ #category : #grammar }
PPRubySeaGrammar >> primary [
	^	((((primaryElement) sea: water) ==> #second) plus) 
			==> [ :args | args select: [ :e | e isEmpty not ]]
	/
		((nil asParser sea: water) ==> [ :args | #() ])
]

{ #category : #grammar }
PPRubySeaGrammar >> primaryElement [
	^ onside, 
		(classDef /
		moduleDef /
		eigenDef /
		methodDef)
	==> #second
]

{ #category : #grammar }
PPRubySeaGrammar >> program [
	^ primary ==> [ :res | 
		res flatten 
	]
]

{ #category : #indentation }
PPRubySeaGrammar >> restoreIl [
	^ [ :context | context indentStack pop ] asParser
		"JK: this is a hack, it improves the speed of compiled parser"
		propertyAt: #indentPop put: true;
		yourself
]

{ #category : #indentation }
PPRubySeaGrammar >> setIl [
	^ [:context |
		| level |
		level := context column.
		context indentStack push: level.
	] asParser
		"JK: this is a hack, it improves the speed of compiled parser"
		propertyAt: #indentPush put: true;
		yourself
]

{ #category : #whitespaces }
PPRubySeaGrammar >> sol [
	^ #startOfLine asParser
]

{ #category : #accessing }
PPRubySeaGrammar >> start [
	^ program
]

{ #category : #grammar }
PPRubySeaGrammar >> string [
	| doubleQuotes singleQuotes slash doubleString singleString regexp |
	doubleQuotes := $" asParser.
	singleQuotes := $' asParser.
	slash := $/ asParser.
	
	doubleString := (doubleQuotes , 
		(($\ asParser , doubleQuotes) / #any asParser starLazy: doubleQuotes) , 
		doubleQuotes) flatten.
		
	singleString := (singleQuotes , 
		(($\ asParser , singleQuotes) / #any asParser starLazy: singleQuotes) , 
		singleQuotes) flatten.
		
	regexp := (slash ,
	  (('\\' asParser) / ($\ asParser , slash) / #any asParser starLazy: slash) ,
	  slash) flatten.
		
	^ (doubleString / singleString / regexp) ==> [ :nodes | #() ]
]

{ #category : #grammar }
PPRubySeaGrammar >> superclass [
	^ (($< asParser trim , cpath) ==> #second)

]

{ #category : #whitespaces }
PPRubySeaGrammar >> water [
	^ (#space asParser plus) /  onsideLine  / comment "/ string / line" /  identifier / #any asParser
]

{ #category : #grammar }
PPRubySeaGrammar >> word [
	^ #word asParser / $_ asParser
]
