Extension { #name : #FamixMetamodelBuilder }

{ #category : #'*Famix-MetamodelBuilder-Tests' }
FamixMetamodelBuilder >> beForTesting [

	<ignoreForCoverage>
	self environment: (FmxMBRingEnvironment for: self).
	self configuration	
		prefix: 'Tst';
		packageName: 'Tst'.
	^ self.
]

{ #category : #'*Famix-MetamodelBuilder-Tests' }
FamixMetamodelBuilder class >> forTesting [

	| aBuilder |
	aBuilder := self new beForTesting.
	^ aBuilder.
]
