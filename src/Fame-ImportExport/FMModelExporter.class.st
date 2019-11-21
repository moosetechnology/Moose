"
Description
--------------------

I am an exporter of fame model.

I can be used to export a model or a metamodel in different formats. 

The format will be delegated to a FMDataStructurePrinter via a strategy design pattern.

For performance reasons we use a hash table instead of a dictionary to keep the indexes.

Examples
--------------------

	| metamodel printer |
	printer := FMMSEPrinter onString.
	metamodel := FMMetaModelBuilder metamodelFrom: {LIBLibrary . LIBBook . LIBPerson}.

	FMModelExporter new
		model: metamodel;
		printer: printer;
		run.
		
	printer stream contents
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	indexMap:							<aDictionary>						Dictionary mapping elements to export with their index.
	lastUpdate:						<anInteger>							Number a millisecords since we last updated the progress bar. This is used to not update the progress bar too much.
	numberOfExportedElements:	<anInteger>							Number of elements exported. This is used by the progress bar.
	printer:							<aFMDataStructurePrinter>		Printer used to print the data structure of the export.
	progressBar:						<aProgressBar>						Progress bar to update during the export.
	model:								<aFMModel>							Model to export.


"
Class {
	#name : #FMModelExporter,
	#superclass : #Object,
	#instVars : [
		'printer',
		'lastUpdate',
		'model',
		'numberOfExportedElements',
		'progressBar',
		'indexMap'
	],
	#category : #'Fame-ImportExport-Exporters'
}

{ #category : #'instance creation' }
FMModelExporter class >> new [
	^self basicNew initialize
]

{ #category : #exporting }
FMModelExporter >> export: aCollectionOfElements [
	printer inDocumentDo: [ aCollectionOfElements do: [ :each | self exportEntity: each ] ]
]

{ #category : #exporting }
FMModelExporter >> exportEntity: each [
	| meta |
	meta := model metaDescriptionOf: each.

	printer
		inEntity: meta fullName
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
								ifTrue: [ self exportEntity: each ]
								ifFalse: [
									(FM3Constant constants includes: each)
										ifTrue: [ printer referenceName: each name ]
										ifFalse: [ printer referenceNumber: (self indexOf: each) ] ] ] ] ]
]

{ #category : #exporting }
FMModelExporter >> incrementProgressBar [
	numberOfExportedElements := numberOfExportedElements + 1.
	(progressBar isNotNil and: [ (Time millisecondsSince: lastUpdate) >= 500 ]) ifFalse: [ ^ self ].

	progressBar value: numberOfExportedElements.
	lastUpdate := Time millisecondClockValue
]

{ #category : #private }
FMModelExporter >> indexOf: each [
	^ indexMap at: each ifAbsentPut: [ indexMap size + 1 ]
]

{ #category : #initialization }
FMModelExporter >> initialize [
	super initialize.
	indexMap := IdentityHashTable new "We use IdentityHashTable because it is more performant than IdentityDictionary for big collections."
]

{ #category : #accessing }
FMModelExporter >> model: aFMModel [
	model := aFMModel
]

{ #category : #accessing }
FMModelExporter >> printer: aPrinter [
	printer := aPrinter
]

{ #category : #private }
FMModelExporter >> roots [
	^ model elements iterator
		| [ :each | FM3Constant constants includes: each ] rejectIt
		| [ :each | model isMetamodel not or: [ model classIsRoot: each ] ] selectIt
		> Array 
]

{ #category : #exporting }
FMModelExporter >> run [
	| roots |
	roots := self roots.
	numberOfExportedElements := 0.
	UIManager default
		displayProgress: 'Writing ' , printer stream localName
		from: 0
		to: roots size
		during: [ :bar | 
			progressBar := bar.
			lastUpdate := 0.
			self export: roots ]
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
