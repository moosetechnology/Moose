Class {
	#name : #FamixBasicInfrastructureMetamodelFactory,
	#superclass : #FMMetamodelFactory,
	#category : #'Moose-GenericImporter-Factories'
}

{ #category : #testing }
FamixBasicInfrastructureMetamodelFactory class >> isAbstract [
	^ self = FamixBasicInfrastructureMetamodelFactory
]

{ #category : #accessing }
FamixBasicInfrastructureMetamodelFactory >> association [

	^ self entityNamed: #Association
]

{ #category : #accessing }
FamixBasicInfrastructureMetamodelFactory >> comment [

	^ self entityNamed: #Comment
]

{ #category : #accessing }
FamixBasicInfrastructureMetamodelFactory >> entity [

	^ self entityNamed: #Entity
]

{ #category : #initialization }
FamixBasicInfrastructureMetamodelFactory >> initialize [
	super initialize.
	self class defaultModel ifNotNil: [ :m | self forModel: m ]
]

{ #category : #accessing }
FamixBasicInfrastructureMetamodelFactory >> namedEntity [

	^ self entityNamed: #NamedEntity
]

{ #category : #accessing }
FamixBasicInfrastructureMetamodelFactory >> sourceAnchor [

	^ self entityNamed: #SourceAnchor
]

{ #category : #accessing }
FamixBasicInfrastructureMetamodelFactory >> sourceLanguage [

	^ self entityNamed: #SourceLanguage
]

{ #category : #accessing }
FamixBasicInfrastructureMetamodelFactory >> sourceTextAnchor [

	^ self entityNamed: #SourceTextAnchor
]

{ #category : #accessing }
FamixBasicInfrastructureMetamodelFactory >> sourcedEntity [

	^ self entityNamed: #SourcedEntity
]
