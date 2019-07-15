Class {
	#name : #FmxCFileGenerated,
	#superclass : #MooseEntity,
	#instVars : [
		'#definedEntities => FMMany type: #FmxCTEntity opposite: #definedIn',
		'#isStub',
		'#name'
	],
	#category : #'FmxC-Entities'
}

{ #category : #meta }
FmxCFileGenerated class >> annotation [

	<MSEClass: #File super: #MooseEntity>
	<package: #FmxC>
	^self
]

{ #category : #meta }
FmxCFileGenerated class >> metamodel [

	^ CMetamodelGenerator metamodel
]

{ #category : #meta }
FmxCFileGenerated class >> requirements [

	^ {  }
]

{ #category : #meta }
FmxCFileGenerated class >> statefulTraits [

	<statefulTraits>
	^ {FmxCTFile. FamixTNamed}
]

{ #category : #'_fromTrait_FmxCTFileGenerated' }
FmxCFileGenerated >> definedEntities [

	^ definedEntities
]

{ #category : #'_fromTrait_FmxCTFileGenerated' }
FmxCFileGenerated >> definedEntities: anObject [

	definedEntities value: anObject

]

{ #category : #'_fromTrait_FamixTNamedGenerated' }
FmxCFileGenerated >> isStub [

	<MSEProperty: #isStub type: #Boolean>
	<MSEComment: 'Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.'>
	^ isStub
]

{ #category : #'_fromTrait_FamixTNamedGenerated' }
FmxCFileGenerated >> isStub: anObject [

	isStub := anObject

]

{ #category : #'_fromTrait_FamixTNamedGenerated' }
FmxCFileGenerated >> name [

	<MSEProperty: #name type: #String>
	<MSEComment: 'Basic name of the entity, not full reference.'>
	^ name
]

{ #category : #'_fromTrait_FamixTNamedGenerated' }
FmxCFileGenerated >> name: anObject [

	name := anObject

]
