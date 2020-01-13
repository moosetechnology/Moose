Extension { #name : #FMMetamodelFactory }

{ #category : #'*Moose-Core' }
FMMetamodelFactory class >> allFactories [
	^ self allSubclasses reject: #isAbstract
]

{ #category : #'*Moose-Core' }
FMMetamodelFactory class >> defaultModel [
	"If one of my subclass is linked to a specific model, I should return this model.
	This is used to select the right factory for a model."

	^ nil
]

{ #category : #'*Moose-Core' }
FMMetamodelFactory class >> forModel: aModel [
	^ self allFactories
		detect: [ :factory | factory isDefaultFor: aModel ]
		ifFound: [ :factory | factory new ]
		ifNone: [ self new
				forModel: aModel;
				yourself ]
]

{ #category : #'*Moose-Core' }
FMMetamodelFactory >> forModel: aModel [
	fm3Package := aModel mooseDescription package
]

{ #category : #'*Moose-Core' }
FMMetamodelFactory class >> isDefaultFor: aModel [
	^ self defaultModel = aModel
]

{ #category : #'*Moose-Core' }
FMMetamodelFactory >> modelClass [
	fm3Package ifNil: [ self error: 'The factory is not initialized.' ].

	^ fm3Package classes
		detect: [ :class | class superclass name = #Model ]
		ifFound: #implementingClass
		ifNone: [ self error: 'No subclass of MooseModel present in this FM3 package' ]
]
