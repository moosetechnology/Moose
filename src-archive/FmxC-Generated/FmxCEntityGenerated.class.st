Class {
	#name : #FmxCEntityGenerated,
	#superclass : #MooseEntity,
	#instVars : [
		'#isStub',
		'#name',
		'#definedIn => FMOne type: #FmxCTFile opposite: #definedEntities'
	],
	#category : #'FmxC-Generated-Entities'
}

{ #category : #meta }
FmxCEntityGenerated class >> annotation [

	<MSEClass: #EntityGenerated super: #MooseEntity>
	<package: #'FmxC-Generated'>
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
