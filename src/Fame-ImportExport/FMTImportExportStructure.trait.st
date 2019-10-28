Trait {
	#name : #FMTImportExportStructure,
	#category : #'Fame-ImportExport-Traits'
}

{ #category : #parsing }
FMTImportExportStructure >> beginAttribute: name [
	^ self explicitRequirement
]

{ #category : #parsing }
FMTImportExportStructure >> beginDocument [
	^ self explicitRequirement
]

{ #category : #parsing }
FMTImportExportStructure >> beginElement: name [
	^ self explicitRequirement
]

{ #category : #parsing }
FMTImportExportStructure >> endAttribute: name [
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
FMTImportExportStructure >> inAttribute: aString do: aBlock [
	self beginAttribute: aString.
	aBlock value.
	self endAttribute: aString
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
