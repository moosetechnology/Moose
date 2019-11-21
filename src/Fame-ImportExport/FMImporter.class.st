"
Description
--------------------

I am responsible for the creation and resolutions of entities during the import of a model.

I'll be used by a parser such as a FMMSEParser.

While everything is not resolved, I'll create ""Future"" elements to replace them.

Examples
--------------------

	(FMImporter model: (FMMetaModel fromString: '((FM3.Package (id: 1) (name ''Office'')))'))
		fromString: '((FM3.Class (name ''Employee'') (package (ref: Office))))';
		run;
		model
		
	""Or via a model:""
	(FMMetaModel fromString: '((FM3.Package (id: 1) (name ''Office'')))')
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	entities:								<aCollection>				The collection of all created entities.
	ensureNoDandlingReferences:		<aBoolean>					If true, at the end of the import we ensure that every entity was resolved and that we have no dangling reference left.
	model:									<aModel>						The model to which we should add all the entities.
	numberOfDanglingReferences:		<anInteger>					The number of dangling references created and unresolved yet. Used to validate that everything is resolved at the end.
	reminderDict:						<aDictionary>				A dictionary mapping a serial to the dangling references pointing to it.
	serialDict:							<aDictionary>				A dictionary mapping serials to the real entity they represent.
	stack:									<aStack>						A stack of the entities been resolved.
	stream:								<aStream>						The stream to parse in order to import the model.
	translationUnit:					<aFMTranslationUnit>		A translation unit used to map the names from the MSE to different entities during the import, in case of renaming for example.

"
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
		'reminderDict',
		'serialDict',
		'translationUnit',
		'ensureNoDandlingReferences',
		'numberOfDanglingReferences'
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
			numberOfDanglingReferences := numberOfDanglingReferences - 1.
			self assert: numberOfDanglingReferences >= 0 ]
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
	numberOfDanglingReferences := 0
]

{ #category : #parsing }
FMImporter >> beginElement: name [
	| translatedName |
	translatedName := self translationUnit translate: name.
	stack push: (FMFutureElement in: self named: translatedName)
]

{ #category : #parsing }
FMImporter >> beginProperty: name [
	self currentElement beginProperty: name
]

{ #category : #accessing }
FMImporter >> currentElement [
	^ stack top
]

{ #category : #private }
FMImporter >> dangling: reference to: serial [
	(reminderDict at: serial ifAbsentPut: [ OrderedCollection new ]) add: reference.
	numberOfDanglingReferences := numberOfDanglingReferences + 1.
	^ reference
]

{ #category : #accessing }
FMImporter >> elementAt: aSerial ifAbsent: aBlock [
	^ serialDict at: aSerial ifAbsent: aBlock
]

{ #category : #accessing }
FMImporter >> elements [
	^ elements
]

{ #category : #parsing }
FMImporter >> endDocument [
	self assert: stack isEmpty.
	stack := nil.
	ensureNoDandlingReferences ifTrue: [ numberOfDanglingReferences isZero ifFalse: [ FMUnresolvedDanglingReferences signal ] ].
	model addAll: elements
]

{ #category : #parsing }
FMImporter >> endElement: name [
	| future element |
	future := stack pop.
	element := future instance.
	elements add: element.
	stack ifNotEmpty: [ self currentElement addToPropertyValues: element ]
]

{ #category : #parsing }
FMImporter >> endProperty: name [
	self currentElement endProperty
]

{ #category : #accessing }
FMImporter >> fromString: aString [
	self stream: aString readStream
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
	self currentElement addToPropertyValues: value
]

{ #category : #parsing }
FMImporter >> referenceName: name [
	self currentElement addToPropertyValues: (model elementNamed: name)
]

{ #category : #parsing }
FMImporter >> referenceNumber: serial [
	self currentElement currentProperty referenceNumber: serial
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
	self assign: self currentElement instance to: serial
]

{ #category : #accessing }
FMImporter >> stream [
	^ stream
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
