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
	printer inDocumentDo: [ aCollectionOfElements do: [ :each | self exportElement: each ] ]
]

{ #category : #exporting }
FMModelExporter >> exportElement: anObject [
	| metaDescription |
	metaDescription := model metaDescriptionOf: anObject.

	printer
		inClass: metaDescription fullName
		do: [ printer serial: (self indexOf: anObject).
			(self sortedPropertiesOf: metaDescription) do: [ :property | self exportProperty: property for: anObject ] ].

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
