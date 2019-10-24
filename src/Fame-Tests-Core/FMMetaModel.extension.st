Extension { #name : #FMMetaModel }

{ #category : #'*Fame-Tests-Core' }
FMMetaModel >> builderClass [
	^ FMMetamodelBuilder
]

{ #category : #'*Fame-Tests-Core' }
FMMetaModel >> document: scriptBlock [
	(self builderClass client: (FMImporter model: self)) document: scriptBlock
]
