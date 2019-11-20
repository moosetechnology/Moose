Class {
	#name : #FMModelExporter,
	#superclass : #Object,
	#instVars : [
		'printer',
		'index',
		'nb',
		'progBar',
		'roots',
		'lastUpdate',
		'model'
	],
	#category : #'Fame-ImportExport-Exporters'
}

{ #category : #'instance creation' }
FMModelExporter class >> new [
	^self basicNew initialize
]

{ #category : #exporting }
FMModelExporter >> basicRun [
	printer inDocumentDo: [ self roots do: [ :each | self exportElement: each ] ]
]

{ #category : #exporting }
FMModelExporter >> exportElement: each [
	| meta |
	meta := model metaDescriptionOf: each.

	printer
		inElement: meta fullName
		do: [ printer serial: (self indexOf: each).
			(self sortedPropertiesOf: meta) do: [ :property | self exportProperty: property for: each ] ].

	self incrementProgressBar
]

{ #category : #exporting }
FMModelExporter >> exportProperty: property for: each [
	| values |
	(self shouldIgnoreProperty: property) ifTrue: [ ^ self ].

	values := model get: property element: each.

	"Do not export empty properties."
	values isEmptyOrNil ifTrue: [ ^ self ].

	self exportProperty: property withAll: values
]

{ #category : #exporting }
FMModelExporter >> exportProperty: property withAll: values [
	printer
		inProperty: property name
		do: [ values
				do: [ :each | 
					property type isPrimitive
						ifTrue: [ printer primitive: each ]
						ifFalse: [
							property isChildrenProperty
								ifTrue: [ self exportElement: each ]
								ifFalse: [
									(FM3Constant constants includes: each)
										ifTrue: [ printer referenceName: each name ]
										ifFalse: [ printer referenceNumber: (self indexOf: each) ] ] ] ] ]
]

{ #category : #exporting }
FMModelExporter >> incrementProgressBar [
	nb := nb + 1.
	(progBar isNotNil and: [ (Time millisecondsSince: lastUpdate) >= 500 ]) ifFalse: [ ^ self ].

	progBar value: nb.
	lastUpdate := Time millisecondClockValue
]

{ #category : #private }
FMModelExporter >> indexOf: each [
	^ index at: each ifAbsentPut: [ index size + 1 ]
]

{ #category : #initialization }
FMModelExporter >> initialize [
	super initialize.
	index := IdentityHashTable new "We use IdentityHashTable because it is more performant than IdentityDictionary for big collections."
]

{ #category : #accessing }
FMModelExporter >> model: aFMModel [
	model := aFMModel.
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
			roots := model elements iterator
							| [ :each | FM3Constant constants includes: each ] rejectIt
							| [ :each | model isMetamodel not or: [ model classIsRoot: each ] ] selectIt
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
	(model metamodel includes: property) ifFalse: [ ^ true ].

	^ property isDerived
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
			#isChildrenProperty ascending,
			#name ascending
]
