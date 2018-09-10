Class {
	#name : #FmxCTFileGenerated,
	#superclass : #FmxTraitEntity,
	#instVars : [
		'#definedEntities => FMMany type: #FmxCTEntity opposite: #definedIn'
	],
	#category : #'FmxC-Traits'
}

{ #category : #meta }
FmxCTFileGenerated class >> annotation [

	<ignoreInTraitUsers>
	<MSEClass: #TFile super: #FmxTraitEntity>
	<package: #FmxC>
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
