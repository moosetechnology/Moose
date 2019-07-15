Class {
	#name : #FMImporterFilter,
	#superclass : #FMParseClientFilter,
	#category : #'Fame-ImportExport'
}

{ #category : #accessing }
FMImporterFilter >> fromString: aString [

	^ self parserClient fromString: aString.
]

{ #category : #accessing }
FMImporterFilter >> index [
	^self parserClient  index
]

{ #category : #accessing }
FMImporterFilter >> metamodel [
	^ self parserClient  metamodel
]

{ #category : #accessing }
FMImporterFilter >> model [
	^self parserClient  model
]

{ #category : #accessing }
FMImporterFilter >> repository [

	^ self parserClient repository
]

{ #category : #accessing }
FMImporterFilter >> repository: aRepository [

	^ self parserClient repository: aRepository .
]

{ #category : #running }
FMImporterFilter >> run [


	| parser |
	parser := FMMSEParser new.
	parser stream: parserClient stream.
	parser client: self.
	parser run.
]

{ #category : #accessing }
FMImporterFilter >> stream [

	^self parserClient stream
]

{ #category : #accessing }
FMImporterFilter >> stream: aReadStream [

	^ self parserClient stream: aReadStream 
	
]
