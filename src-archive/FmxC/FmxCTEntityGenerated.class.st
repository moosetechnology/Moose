Class {
	#name : #FmxCTEntityGenerated,
	#superclass : #FmxTraitEntity,
	#instVars : [
		'#definedIn => FMOne type: #FmxCTFile opposite: #definedEntities'
	],
	#category : #'FmxC-Traits'
}

{ #category : #meta }
FmxCTEntityGenerated class >> annotation [

	<ignoreInTraitUsers>
	<MSEClass: #TEntity super: #FmxTraitEntity>
	<package: #FmxC>
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
