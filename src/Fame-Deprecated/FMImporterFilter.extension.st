Extension { #name : #FMImporterFilter }

{ #category : #'*Fame-Deprecated' }
FMImporterFilter class >> onClient: aFMParserClient withFilter: aCollectionOfElementNames [
	self deprecated: 'Use #on:filtering: instead.' transformWith: '`@receiver onClient: `@arg1 withFilter: `@arg2' -> '`@receiver on: `@arg1 filtering: `@arg2'.
	^ self on: aFMParserClient filtering: aCollectionOfElementNames
]
