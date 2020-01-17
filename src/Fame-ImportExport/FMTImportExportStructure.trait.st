Trait {
	#name : #FMTImportExportStructure,
	#category : #'Fame-ImportExport-Traits'
}

{ #category : #parsing }
FMTImportExportStructure >> beginDocument [
	^ self explicitRequirement
]

{ #category : #parsing }
FMTImportExportStructure >> beginEntity: name [
	^ self explicitRequirement
]

{ #category : #parsing }
FMTImportExportStructure >> beginMultivalue: anEntity [

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
FMTImportExportStructure >> endEntity: name [
	^ self explicitRequirement
]

{ #category : #parsing }
FMTImportExportStructure >> endMultivalue: anEntity [

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
FMTImportExportStructure >> inEntity: aString do: aBlock [
	self beginEntity: aString.
	aBlock value.
	self endEntity: aString
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
FMTImportExportStructure >> printEntitySeparator [
	
]

{ #category : #parsing }
FMTImportExportStructure >> printPropertySeparator [
	
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
