Class {
	#name : #FmxCModuleGenerated,
	#superclass : #MooseEntity,
	#instVars : [
		'#cFile => FMOne type: #FmxCCFile opposite: #module',
		'#hFile => FMOne type: #FmxCHFile opposite: #module',
		'#isStub',
		'#name'
	],
	#category : #'FmxC-Generated-Entities'
}

{ #category : #meta }
FmxCModuleGenerated class >> annotation [

	<MSEClass: #ModuleGenerated super: #MooseEntity>
	<package: #'FmxC-Generated'>
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
