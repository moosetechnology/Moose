Class {
	#name : #FmxCModuleGenerated,
	#superclass : #MooseEntity,
	#instVars : [
		'#cFile => FMOne type: #FmxCCFile opposite: #module',
		'#hFile => FMOne type: #FmxCHFile opposite: #module',
		'#isStub',
		'#name'
	],
	#category : #'FmxC-Entities'
}

{ #category : #meta }
FmxCModuleGenerated class >> annotation [

	<MSEClass: #Module super: #MooseEntity>
	<package: #FmxC>
	^self
]

{ #category : #meta }
FmxCModuleGenerated class >> metamodel [

	^ CMetamodelGenerator metamodel
]

{ #category : #meta }
FmxCModuleGenerated class >> requirements [

	^ {  }
]

{ #category : #meta }
FmxCModuleGenerated class >> statefulTraits [

	<statefulTraits>
	^ {FamixTNamed}
]

{ #category : #accessing }
FmxCModuleGenerated >> cFile [

	^ cFile
]

{ #category : #accessing }
FmxCModuleGenerated >> cFile: anObject [

	cFile := anObject

]

{ #category : #accessing }
FmxCModuleGenerated >> hFile [

	^ hFile
]

{ #category : #accessing }
FmxCModuleGenerated >> hFile: anObject [

	hFile := anObject

]

{ #category : #'_fromTrait_FamixTNamedGenerated' }
FmxCModuleGenerated >> isStub [

	<MSEProperty: #isStub type: #Boolean>
	<MSEComment: 'Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.'>
	^ isStub
]

{ #category : #'_fromTrait_FamixTNamedGenerated' }
FmxCModuleGenerated >> isStub: anObject [

	isStub := anObject

]

{ #category : #'_fromTrait_FamixTNamedGenerated' }
FmxCModuleGenerated >> name [

	<MSEProperty: #name type: #String>
	<MSEComment: 'Basic name of the entity, not full reference.'>
	^ name
]

{ #category : #'_fromTrait_FamixTNamedGenerated' }
FmxCModuleGenerated >> name: anObject [

	name := anObject

]
