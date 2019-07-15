Class {
	#name : #FmxCTEntityGenerated,
	#superclass : #FmxTraitEntity,
	#instVars : [
		'#definedIn => FMOne type: #FmxCTFile opposite: #definedEntities'
	],
	#category : #'FmxC-Generated-Traits'
}

{ #category : #meta }
FmxCTEntityGenerated class >> annotation [

	<ignoreInTraitUsers>
	<MSEClass: #TEntityGenerated super: #FmxTraitEntity>
	<package: #'FmxC-Generated'>
	^self
]

{ #category : #accessing }
FmxCTEntityGenerated >> definedIn [

	^ definedIn
]

{ #category : #accessing }
FmxCTEntityGenerated >> definedIn: anObject [

	definedIn := anObject

]
