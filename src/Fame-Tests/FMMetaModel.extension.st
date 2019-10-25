Extension { #name : #FMMetaModel }

{ #category : #'*Fame-Tests' }
FMMetaModel >> builderClass [
	^ FMMetamodelBuilder
]

{ #category : #'*Fame-Tests' }
FMMetaModel >> document: scriptBlock [
	(self builderClass client: (FMImporter model: self)) document: scriptBlock
]
