Extension { #name : #FamixMetamodelBuilder }

{ #category : #'*Famix-MetamodelBuilder-Tests' }
FamixMetamodelBuilder class >> forTesting [

	| aBuilder |
	aBuilder := self new.
	aBuilder 	environment: (FmxMBRingEnvironment for: aBuilder).
	aBuilder configuration	
		prefix: 'Tst';
		packageName: 'Tst'.
	^ aBuilder.
]
