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
	| meta |
	meta := repository metaDescriptionOf: each.

	printer
		inElement: meta fullName
		do: [ printer serial: (self indexOf: each).
			(self sortedPropertiesOf: meta) do: [ :property | self exportProperty: property for: each ] ].

	self increment	"UI stuff"
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
	printer
		inAttribute: property name
		do: [ property name.
			property type isPrimitive
				ifTrue: [ values do: [ :each | printer primitive: each ] ]
				ifFalse: [ property isComposite
						ifTrue:
							[ values do: [ :each | ((self isPrimitiveTypeOrObject: each) and: [ self shouldIgnoreProperty: each ]) ifFalse: [ self exportElement: each ] ] ]
						ifFalse: [ values
								do:
									[ :each | (self isPrimitiveTypeOrObject: each) ifTrue: [ printer referenceName: each name ] ifFalse: [ printer referenceNumber: (self indexOf: each) ] ] ] ] ]
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
	^ roots
		ifNil: [
			roots := repository elements iterator
							| [ :each | self isPrimitiveTypeOrObject: each ] rejectIt
							| [ :each | repository elementIsRoot: each ] selectIt
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

{ #category : #exporting }
FMModelExporter >> sortedPropertiesOf: meta [
	"We want to sort the properties into three categories:
		- The one defining the name
		- The simple properties
		- The complexe properties
		
		And inside each category we want to sort the properties by name."

	^ meta allProperties
		sorted:
			[ :property | property name = #name ] descending,
			#isComposite ascending,
			#name ascending
]
