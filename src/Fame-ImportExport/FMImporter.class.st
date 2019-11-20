Class {
	#name : #FMImporter,
	#superclass : #Object,
	#traits : 'FMTImportExportStructure',
	#classTraits : 'FMTImportExportStructure classTrait',
	#instVars : [
		'stack',
		'elements',
		'model',
		'stream',
		'tally',
		'reminderDict',
		'serialDict',
		'translationUnit',
		'ensureNoDandlingReferences'
	],
	#category : #'Fame-ImportExport-Importers'
}

{ #category : #'instance creation' }
FMImporter class >> model: aRepository [
	^ self new
		model: aRepository;
		yourself
]

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

{ #category : #accessing }
FMImporter >> autorizeDandlingReferencesAtEnd [
	"I am using DandlingReferences to manage references during the import. At the end I can check that all dandling references are resolved. Calling this method, I'll not do the check and allow partial loading of models."

	ensureNoDandlingReferences := false
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

{ #category : #parsing }
FMImporter >> beginProperty: name [ 
	
	stack top beginProperty: name
]

{ #category : #private }
FMImporter >> dangling: reference to: serial [
	(reminderDict at: serial ifAbsentPut: [ OrderedCollection new ]) add: reference.
	tally := tally + 1.
	^ reference
]

{ #category : #accessing }
FMImporter >> elements [
	^ elements
]

{ #category : #parsing }
FMImporter >> endDocument [
	self assert: stack isEmpty.
	stack := nil.
	ensureNoDandlingReferences ifTrue: [ tally = 0 ifFalse: [ FMUnresolvedDanglingReferences signal ] ].
	model addAll: elements
]

{ #category : #parsing }
FMImporter >> endElement: name [
	| future element |
	future := stack pop.
	element := future instance.
	elements add: element.
	stack ifNotEmpty: [ stack top currentAttribute values add: element ]
]

{ #category : #parsing }
FMImporter >> endProperty: name [ 
	
	stack top endProperty: name
]

{ #category : #accessing }
FMImporter >> fromString: aString [

	self stream: aString readStream
]

{ #category : #parsing }
FMImporter >> inProperty: aString do: aBlock [
	self beginProperty: aString.
	aBlock value.
	self endProperty: aString
]

{ #category : #accessing }
FMImporter >> index [
	^serialDict
]

{ #category : #initialization }
FMImporter >> initialize [
	super initialize.
	translationUnit := FMNullTranslationUnit new.
	ensureNoDandlingReferences := true
]

{ #category : #accessing }
FMImporter >> metamodel [
	^ model metamodel
]

{ #category : #accessing }
FMImporter >> model [
	^ model
]

{ #category : #accessing }
FMImporter >> model: aModel [
	model := aModel
]

{ #category : #parsing }
FMImporter >> primitive: value [
	stack top currentAttribute values add: value
]

{ #category : #parsing }
FMImporter >> referenceName: name [
	stack top currentAttribute values add: (model elementNamed: name)
]

{ #category : #parsing }
FMImporter >> referenceNumber: serial [
	stack top currentAttribute referenceNumber: serial
]

{ #category : #running }
FMImporter >> run [
	FMMSEParser new
		stream: stream;
		importer: self;
		run
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
