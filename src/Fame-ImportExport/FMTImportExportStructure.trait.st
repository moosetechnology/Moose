Trait {
	#name : #FMTImportExportStructure,
	#category : #'Fame-ImportExport-Traits'
}

{ #category : #parsing }
FMTImportExportStructure >> beginDocument [
	^ self explicitRequirement
]

{ #category : #parsing }
FMTImportExportStructure >> beginElement: name [
	^ self explicitRequirement
]

{ #category : #parsing }
FMTImportExportStructure >> beginProperty: name [
	^ self explicitRequirement
]

{ #category : #parsing }
FMTImportExportStructure >> endDocument [
	^ self explicitRequirement
]

{ #category : #parsing }
FMTImportExportStructure >> endElement: name [
	^ self explicitRequirement
]

{ #category : #parsing }
FMTImportExportStructure >> endProperty: name [
	^ self explicitRequirement
]

{ #category : #parsing }
FMTImportExportStructure >> inDocumentDo: aBlock [
	self beginDocument.
	aBlock value.
	self endDocument
]

{ #category : #parsing }
FMTImportExportStructure >> inElement: aString do: aBlock [
	self beginElement: aString.
	aBlock value.
	self endElement: aString
]

{ #category : #parsing }
FMTImportExportStructure >> inProperty: aString do: aBlock [
	self beginProperty: aString.
	aBlock value.
	self endProperty: aString
]

{ #category : #parsing }
FMTImportExportStructure >> primitive: value [
	^ self explicitRequirement
]

{ #category : #parsing }
FMTImportExportStructure >> referenceName: name [
	^ self explicitRequirement
]

{ #category : #parsing }
FMTImportExportStructure >> referenceNumber: index [
	^ self explicitRequirement
]

{ #category : #parsing }
FMTImportExportStructure >> serial: index [
	^ self explicitRequirement
]
