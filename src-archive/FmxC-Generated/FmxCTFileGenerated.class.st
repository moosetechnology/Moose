Class {
	#name : #FmxCTFileGenerated,
	#superclass : #FmxTraitEntity,
	#instVars : [
		'#definedEntities => FMMany type: #FmxCTEntity opposite: #definedIn'
	],
	#category : #'FmxC-Generated-Traits'
}

{ #category : #meta }
FmxCTFileGenerated class >> annotation [

	<ignoreInTraitUsers>
	<MSEClass: #TFileGenerated super: #FmxTraitEntity>
	<package: #'FmxC-Generated'>
	^self
]

{ #category : #accessing }
FmxCTFileGenerated >> definedEntities [

	^ definedEntities
]

{ #category : #accessing }
FmxCTFileGenerated >> definedEntities: anObject [

	definedEntities value: anObject

]
