Extension { #name : #FMMetaRepository }

{ #category : #'*Fame-Tests-Core' }
FMMetaRepository >> builderClass [
	^ FMMetamodelBuilder
]

{ #category : #'*Fame-Tests-Core' }
FMMetaRepository >> document: scriptBlock [
	self builderClass new
		client: (FMImporter repository: self);
		document: scriptBlock
]
