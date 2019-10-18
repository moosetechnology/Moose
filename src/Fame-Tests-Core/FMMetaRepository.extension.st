Extension { #name : #FMMetaRepository }

{ #category : #'*Fame-Tests-Core' }
FMMetaRepository >> addSmalltalkClasses: classes [ 
	| builder |
	builder := FMPragmaProcessor new.
	builder queue: classes.
	builder run.
	self addAll: builder elements
]

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
