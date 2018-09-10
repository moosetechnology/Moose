Extension { #name : #MooseAbstractImportingContext }

{ #category : #'*moose-wizard' }
MooseAbstractImportingContext class >> contextFromIndex: anIndex [

	anIndex = 2 ifTrue: [^FAMIXStandardImportingContext].
	anIndex = 3 ifTrue: [^AllMooseMetamodelImportingContext].
	^ nil
]
