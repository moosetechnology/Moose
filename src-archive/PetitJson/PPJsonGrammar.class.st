Class {
	#name : #PPJsonGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'members',
		'pair',
		'string',
		'value',
		'elements',
		'number',
		'object',
		'array',
		'trueToken',
		'falseToken',
		'nullToken',
		'char',
		'stringToken',
		'numberToken',
		'charEscape',
		'charNormal',
		'charOctal'
	],
	#classVars : [
		'CharacterTable'
	],
	#category : #'PetitJson-Core'
}

{ #category : #initialization }
PPJsonGrammar class >> initialize [
	CharacterTable := Dictionary new.
	CharacterTable
		at: $\ put: $\;
		at: $/ put: $/;
		at: $" put: $";
		at: $b put: Character backspace;
		at: $f put: Character newPage;
		at: $n put: Character lf;
		at: $r put: Character cr;
		at: $t put: Character tab
]

{ #category : #grammar }
PPJsonGrammar >> array [
	^ $[ asParser token trim , elements optional , $] asParser token trim
]

{ #category : #primitives }
PPJsonGrammar >> char [
	^ charEscape / charOctal / charNormal
]

{ #category : #primitives }
PPJsonGrammar >> charEscape [
	^ $\ asParser , (PPPredicateObjectParser anyOf: (String withAll: CharacterTable keys))
]

{ #category : #primitives }
PPJsonGrammar >> charNormal [
	^ PPPredicateObjectParser anyExceptAnyOf: '\"'
]

{ #category : #primitives }
PPJsonGrammar >> charOctal [
	^ '\u' asParser , (#hex asParser min: 4 max: 4)
]

{ #category : #grammar }
PPJsonGrammar >> elements [
	^ value separatedBy: $, asParser token trim
]

{ #category : #tokens }
PPJsonGrammar >> falseToken [
	^ 'false' asParser token trim
]

{ #category : #grammar }
PPJsonGrammar >> members [
	^ pair separatedBy: $, asParser token trim
]

{ #category : #tokens }
PPJsonGrammar >> nullToken [
	^ 'null' asParser token trim
]

{ #category : #primitives }
PPJsonGrammar >> number [
	^ $- asParser optional ,
		($0 asParser / #digit asParser plus) ,
		($. asParser , #digit asParser plus) optional , 
		(($e asParser / $E asParser) , ($- asParser / $+ asParser) optional , #digit asParser plus) optional
]

{ #category : #tokens }
PPJsonGrammar >> numberToken [
	^ number token trim
]

{ #category : #grammar }
PPJsonGrammar >> object [
	^ ${ asParser token trim , members optional , $} asParser token trim
]

{ #category : #grammar }
PPJsonGrammar >> pair [
	^ stringToken , $: asParser token trim , value
]

{ #category : #accessing }
PPJsonGrammar >> start [
	^ value end
]

{ #category : #primitives }
PPJsonGrammar >> string [
	^ $" asParser , char star , $" asParser
]

{ #category : #tokens }
PPJsonGrammar >> stringToken [
	^ string token trim
]

{ #category : #tokens }
PPJsonGrammar >> trueToken [
	^ 'true' asParser token trim
]

{ #category : #grammar }
PPJsonGrammar >> value [
	^ stringToken / numberToken / object / array / trueToken / falseToken / nullToken
]
