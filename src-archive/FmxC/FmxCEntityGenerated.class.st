Class {
	#name : #FmxCEntityGenerated,
	#superclass : #MooseEntity,
	#instVars : [
		'#definedIn => FMOne type: #FmxCTFile opposite: #definedEntities',
		'#isStub',
		'#name'
	],
	#category : #'FmxC-Entities'
}

{ #category : #meta }
FmxCEntityGenerated class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #FmxC>
	^self
]

{ #category : #meta }
FmxCEntityGenerated class >> metamodel [

	^ CMetamodelGenerator metamodel
]

{ #category : #meta }
FmxCEntityGenerated class >> requirements [

	^ {  }
]

{ #category : #meta }
FmxCEntityGenerated class >> statefulTraits [

	<statefulTraits>
	^ {FmxCTEntity. FamixTNamed}
]

{ #category : #'_fromTrait_FmxCTEntityGenerated' }
FmxCEntityGenerated >> definedIn [

	^ definedIn
]

{ #category : #'_fromTrait_FmxCTEntityGenerated' }
FmxCEntityGenerated >> definedIn: anObject [

	definedIn := anObject

]

{ #category : #'_fromTrait_FamixTNamedGenerated' }
FmxCEntityGenerated >> isStub [

	<MSEProperty: #isStub type: #Boolean>
	<MSEComment: 'Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.'>
	^ isStub
]

{ #category : #'_fromTrait_FamixTNamedGenerated' }
FmxCEntityGenerated >> isStub: anObject [

	isStub := anObject

]

{ #category : #'_fromTrait_FamixTNamedGenerated' }
FmxCEntityGenerated >> name [

	<MSEProperty: #name type: #String>
	<MSEComment: 'Basic name of the entity, not full reference.'>
	^ name
]

{ #category : #'_fromTrait_FamixTNamedGenerated' }
FmxCEntityGenerated >> name: anObject [

	name := anObject

]
