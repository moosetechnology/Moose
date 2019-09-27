Class {
	#name : #FMImporter,
	#superclass : #FMParserClient,
	#instVars : [
		'stack',
		'elements',
		'model',
		'metamodel',
		'stream',
		'tally',
		'reminderDict',
		'serialDict',
		'translationUnit'
	],
	#category : #'Fame-ImportExport'
}

{ #category : #private }
FMImporter >> assign: element to: serial [
	| todo |
	serialDict at: serial put: element.
	todo := reminderDict removeKey: serial ifAbsent: [ ^ self ].
	todo
		do: [ :each | 
			each resolve: element.
			tally := tally - 1.
			self assert: tally >= 0 ]
]

{ #category : #parsing }
FMImporter >> beginAttribute: name [ 
	
	stack top beginAttribute: name
]

{ #category : #parsing }
FMImporter >> beginDocument [
	
	stack := Stack new.
	elements := OrderedCollection new.
	serialDict := IdentityDictionary new.
	reminderDict := IdentityDictionary new.
	tally := 0.
	
]

{ #category : #parsing }
FMImporter >> beginElement: name [
	| translatedName |
	translatedName := self translationUnit translate: name.
	stack push: (FMFutureElement with: self name: translatedName)
]

{ #category : #private }
FMImporter >> dangling: reference to: serial [
	(reminderDict at: serial ifAbsentPut: [ OrderedCollection new ]) add: reference.
	tally := tally + 1.
	^ reference
]

{ #category : #parsing }
FMImporter >> endAttribute: name [ 
	
	stack top endAttribute: name
]

{ #category : #parsing }
FMImporter >> endDocument [
	self assert: stack isEmpty.
	stack := nil.
	self assert: tally = 0.
	model addAll: elements
]

{ #category : #parsing }
FMImporter >> endElement: name [ 
	
	| future element |
	future := stack pop.
	element := future instance.
	elements add: element.
	stack isEmpty not ifTrue: [
		stack top current values add: element ]
]

{ #category : #accessing }
FMImporter >> fromString: aString [

	self stream: aString readStream
]

{ #category : #accessing }
FMImporter >> index [
	^serialDict
]

{ #category : #accessing }
FMImporter >> initialize [
	super initialize.
	translationUnit := FMNullTranslationUnit new
]

{ #category : #accessing }
FMImporter >> metamodel [
	^metamodel
]

{ #category : #accessing }
FMImporter >> model [
	^model
]

{ #category : #deprecated }
FMImporter >> nameTranslator [
	self deprecated: 'Use #translationUnit instead'.
	^ translationUnit dictionary
]

{ #category : #deprecated }
FMImporter >> nameTranslator: anObject [
	self
		deprecated: 'Use FMDictionaryTranslationUnit instead'
		transformWith:
			'`@receiver nameTranslator: `@arg'
				->
			'`@receiver translationUnit: (FMDictionaryTranslationUnit new
													dictionary:  `@arg;
													yourself)'.
	translationUnit := FMDictionaryTranslationUnit new
		dictionary: anObject;
		yourself
]

{ #category : #parsing }
FMImporter >> primitive: value [ 
	
	stack top current values add: value
]

{ #category : #parsing }
FMImporter >> referenceName: name [ 
	
	stack top current values add: (model elementNamed: name)
]

{ #category : #parsing }
FMImporter >> referenceNumber: serial [ 
	
	stack top current referenceNumber: serial
]

{ #category : #accessing }
FMImporter >> repository [

	^model
]

{ #category : #accessing }
FMImporter >> repository: aRepository [

	model := aRepository.
	metamodel := aRepository metamodel.
]

{ #category : #running }
FMImporter >> run [

	| parser |
	parser := FMMSEParser new.
	parser stream: stream.
	parser client: self.
	parser run.

]

{ #category : #parsing }
FMImporter >> serial: serial [ 
	
	stack top serial: serial
]

{ #category : #accessing }
FMImporter >> stream [

	^stream
]

{ #category : #accessing }
FMImporter >> stream: aReadStream [

	stream := aReadStream 
	
]

{ #category : #accessing }
FMImporter >> translationUnit [
	^ translationUnit
]

{ #category : #accessing }
FMImporter >> translationUnit: aTranslationUnit [
	translationUnit := aTranslationUnit
]
