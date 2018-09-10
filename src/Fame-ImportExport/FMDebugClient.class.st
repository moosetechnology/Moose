Class {
	#name : #FMDebugClient,
	#superclass : #FMParserClient,
	#instVars : [
		'a'
	],
	#category : #'Fame-ImportExport'
}

{ #category : #parsing }
FMDebugClient >> beginAttribute: name [ 
	a := a copyWith: (Array with: #beginAttribute: with:  name )
]

{ #category : #parsing }
FMDebugClient >> beginDocument [
	a := a copyWith: (Array with: #beginDocument)
]

{ #category : #parsing }
FMDebugClient >> beginElement: name [ 
	a := a copyWith: (Array with:   #beginElement: with: name)
]

{ #category : #accessing }
FMDebugClient >> contents [
	^ a
]

{ #category : #parsing }
FMDebugClient >> endAttribute: name [ 
	a := a copyWith: (Array with: #endAttribute: with: name)
]

{ #category : #parsing }
FMDebugClient >> endDocument [
	a := a copyWith: (Array with: #endDocument)
]

{ #category : #parsing }
FMDebugClient >> endElement: name [ 
	a := a copyWith: (Array with: #endElement: with: name)
]

{ #category : #accessing }
FMDebugClient >> exportString [
	
	| printer |
	printer := FMMSEPrinter new.
	printer onString: String new.
	self replayOn: printer.
	^printer stream contents.
]

{ #category : #'initialize-release' }
FMDebugClient >> initialize [
	self reset
]

{ #category : #parsing }
FMDebugClient >> primitive: value [ 
	a := a copyWith: (Array with:  #primitive: with: value )
]

{ #category : #parsing }
FMDebugClient >> referenceName: name [ 
	a := a copyWith: (Array with: #referenceName: with: name)
]

{ #category : #parsing }
FMDebugClient >> referenceNumber: index [ 
	a := a copyWith: (Array with: #referenceNumber: with: index  )
]

{ #category : #accessing }
FMDebugClient >> replayOn: aParseClient [ 
	
	a do: [ :each |
		aParseClient 
			perform: each first
			withArguments: each allButFirst ].
]

{ #category : #'initialize-release' }
FMDebugClient >> reset [
	a := #()
]

{ #category : #parsing }
FMDebugClient >> serial: index [ 
	a := a copyWith: (Array with: #serial: with: index )
]
