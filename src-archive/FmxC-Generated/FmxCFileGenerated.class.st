Class {
	#name : #FmxCFileGenerated,
	#superclass : #MooseEntity,
	#instVars : [
		'#isStub',
		'#name',
		'#definedEntities => FMMany type: #FmxCTEntity opposite: #definedIn'
	],
	#category : #'FmxC-Generated-Entities'
}

{ #category : #meta }
FmxCFileGenerated class >> annotation [

	<MSEClass: #FileGenerated super: #MooseEntity>
	<package: #'FmxC-Generated'>
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
