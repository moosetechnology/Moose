Extension { #name : #FMMetaRepository }

{ #category : #'*Fame-ImportExport' }
FMMetaRepository >> builderClass [
	^ FMMetamodelBuilder
]

{ #category : #'*Fame-ImportExport' }
FMMetaRepository >> document: scriptBlock [
	self builderClass new
		client: (FMImporter repository: self);
		document: scriptBlock
]
