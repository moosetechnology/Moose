Class {
	#name : #FMModelExporter,
	#superclass : #Object,
	#instVars : [
		'repository',
		'printer',
		'index',
		'nb',
		'progBar',
		'roots',
		'lastUpdate'
	],
	#category : #'Fame-ImportExport'
}

{ #category : #'instance creation' }
FMModelExporter class >> new [
	^self basicNew initialize
]

{ #category : #exporting }
FMModelExporter >> basicRun [

	self exportHeader.
	self roots do: [ :each |
		self exportElement: each ].
	self exportFooter.
]

{ #category : #exporting }
FMModelExporter >> exportElement: each [ 
	
	| meta serial properties |

	meta := repository metaDescriptionOf: each.
	self flag: 'ideally, there should be no nil check here. Currently, we need it to accommodate the case in which we export a model based on a partial meta-model'. 
	meta ifNotNil: [
		serial := self indexOf: each.
		printer beginElement: meta fullName.
		printer serial: serial.
		properties := self sortAttributes: meta allProperties.
		properties do: [ :property | 
			self 
				exportProperty: property
				for: each ].
		printer endElement: meta fullName
		].
	self increment. "UI stuff"
]

{ #category : #exporting }
FMModelExporter >> exportFooter [
	printer endDocument
]

{ #category : #exporting }
FMModelExporter >> exportHeader [
	printer beginDocument
]

{ #category : #exporting }
FMModelExporter >> exportProperty: property for: each [
	| values |
	(self shouldIgnoreProperty: property) ifTrue: [ ^ self ].
	values := repository get: property element: each.
	(self shouldIgnoreProperty: property withAll: values) ifTrue: [ ^ self ].
	self exportProperty: property withAll: values
]

{ #category : #exporting }
FMModelExporter >> exportProperty: property withAll: values [
	printer beginAttribute: property name.
	property type isPrimitive
		ifTrue: [ values do: [ :each | printer primitive: each ] ]
		ifFalse: [ property isComposite
				ifTrue: [ values
						do: [ :each | 
							((self isPrimitiveTypeOrObject: each) and: [ self shouldIgnoreProperty: each ])
								ifFalse: [ self exportElement: each ] ] ]
				ifFalse: [ values
						do: [ :each | 
							(self isPrimitiveTypeOrObject: each)
								ifTrue: [ printer referenceName: each name ]
								ifFalse: [ printer referenceNumber: (self indexOf: each) ] ] ] ].
	printer endAttribute: property name
]

{ #category : #exporting }
FMModelExporter >> increment [
	nb := nb + 1.
	(progBar isNotNil and: [ (Time millisecondsSince: lastUpdate) >= 500 ]) ifFalse: [ ^ self ].

	progBar value: nb.
	lastUpdate := Time millisecondClockValue
]

{ #category : #private }
FMModelExporter >> indexOf: each [
	each ifNil: [ self error ].
	^ index at: each ifAbsentPut: [ index size + 1 ]
]

{ #category : #initialization }
FMModelExporter >> initialize [
	super initialize.
	index := IdentityHashTable new "We use IdentityHashTable because it is more performant than IdentityDictionary for big collections."
]

{ #category : #private }
FMModelExporter >> isPrimitiveTypeOrObject: each [
	^ FM3Constant constants includes: each
]

{ #category : #accessing }
FMModelExporter >> model: aRepository [
	repository := aRepository.
	roots := nil. "reset cache for roots"
]

{ #category : #accessing }
FMModelExporter >> printer: aPrinter [
	printer := aPrinter
]

{ #category : #private }
FMModelExporter >> roots [
	self
		flag:
			'VBL - Add a test to detect that the repository is a meta model or not. If  it is, the exporter works normally else, only the roots are exported (issue was detected when adding the container pragmas). I don''t know if it is the better fix to do.'.
	^ roots
		ifNil: [
			roots := repository elements iterator
							| [ :each | self isPrimitiveTypeOrObject: each ] rejectIt
							| [ :each | repository isMetamodel not or: [ (repository containersOf: each) isEmpty ] ] selectIt
							> Array ]
]

{ #category : #exporting }
FMModelExporter >> run [
	nb := 0.
	UIManager default
		displayProgress: 'Writing ' , printer stream localName
		from: 0
		to: self roots size
		during: [ :bar | 
			progBar := bar.
			lastUpdate := 0.
			self basicRun ]
]

{ #category : #exporting }
FMModelExporter >> shouldIgnoreProperty: property [
	(repository metamodel includes: property) ifFalse: [ ^ true ].

	^ property isDerived
]

{ #category : #exporting }
FMModelExporter >> shouldIgnoreProperty: property withAll: values [
	values ifNil: [ ^ true ].

	^ values isEmpty or: [ property type = FM3Boolean instance and: [ values size = 1 and: [ values first = false ] ] ]
]

{ #category : #private }
FMModelExporter >> sortAttributes: properties [

	| names composites sorted |
	sorted := properties asArray sorted: [:n1 :n2 | n1 name < n2 name ].
	names := sorted select: [ :each | each name == #name ].
	composites := sorted select: [ :each | each isComposite ].
	^names, (sorted copyWithoutAll: (names union: composites)), composites
]
