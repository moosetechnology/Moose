Class {
	#name : #FMImporterFilter,
	#superclass : #FMParseClientFilter,
	#category : #'Fame-ImportExport'
}

{ #category : #accessing }
FMImporterFilter >> fromString: aString [
	^ self parserClient fromString: aString
]

{ #category : #accessing }
FMImporterFilter >> index [
	^ self parserClient index
]

{ #category : #accessing }
FMImporterFilter >> metamodel [
	^ self parserClient metamodel
]

{ #category : #accessing }
FMImporterFilter >> model [
	^ self parserClient model
]

{ #category : #accessing }
FMImporterFilter >> model: aModel [
	^ self parserClient model: aModel
]

{ #category : #running }
FMImporterFilter >> run [
	FMMSEParser new
		stream: parserClient stream;
		client: self;
		run
]

{ #category : #accessing }
FMImporterFilter >> stream [
	^ self parserClient stream
]

{ #category : #accessing }
FMImporterFilter >> stream: aReadStream [
	^ self parserClient stream: aReadStream
]
