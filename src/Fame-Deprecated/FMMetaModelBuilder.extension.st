Extension { #name : #FMMetaModelBuilder }

{ #category : #'*Fame-Deprecated' }
FMMetaModelBuilder class >> shouldValidateMetaModel: anObject [
	self deprecated: 'Use #withoutValidation on your instance of meta model buider.'
]
