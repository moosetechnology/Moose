Class {
	#name : #FMDebugImporter,
	#superclass : #Object,
	#traits : 'FMTImportExportStructure',
	#classTraits : 'FMTImportExportStructure classTrait',
	#instVars : [
		'a'
	],
	#category : #'Fame-Tests'
}

{ #category : #parsing }
FMDebugImporter >> beginDocument [
	a := a copyWith: (Array with: #beginDocument)
]

{ #category : #parsing }
FMDebugImporter >> beginEntity: name [ 
	a := a copyWith: (Array with:   #beginEntity: with: name)
]

{ #category : #parsing }
FMDebugImporter >> beginProperty: name [ 
	a := a copyWith: (Array with: #beginProperty: with:  name )
]

{ #category : #accessing }
FMDebugImporter >> contents [
	^ a
]

{ #category : #parsing }
FMDebugImporter >> endDocument [
	a := a copyWith: (Array with: #endDocument)
]

{ #category : #parsing }
FMDebugImporter >> endEntity: name [ 
	a := a copyWith: (Array with: #endEntity: with: name)
]

{ #category : #parsing }
FMDebugImporter >> endProperty: name [ 
	a := a copyWith: (Array with: #endProperty: with: name)
]

{ #category : #accessing }
FMDebugImporter >> exportString [
	| printer |
	printer := FMMSEPrinter onString.
	self replayOn: printer.
	^ printer stream contents
]

{ #category : #initialization }
FMDebugImporter >> initialize [
	self reset
]

{ #category : #parsing }
FMDebugImporter >> primitive: value [ 
	a := a copyWith: (Array with:  #primitive: with: value )
]

{ #category : #parsing }
FMDebugImporter >> referenceName: name [ 
	a := a copyWith: (Array with: #referenceName: with: name)
]

{ #category : #parsing }
FMDebugImporter >> referenceNumber: index [ 
	a := a copyWith: (Array with: #referenceNumber: with: index  )
]

{ #category : #accessing }
FMDebugImporter >> replayOn: aParseClient [ 
	
	a do: [ :each |
		aParseClient 
			perform: each first
			withArguments: each allButFirst ].
]

{ #category : #'initialize-release' }
FMDebugImporter >> reset [
	a := #()
]

{ #category : #parsing }
FMDebugImporter >> serial: index [ 
	a := a copyWith: (Array with: #serial: with: index )
]
