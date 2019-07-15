Class {
	#name : #FmxCTEntity,
	#superclass : #FmxTraitEntity,
	#instVars : [
		'#definedIn => FMOne type: #FmxCTFile opposite: #definedEntities'
	],
	#category : #'FmxC-Entities'
}

{ #category : #meta }
FmxCTEntity class >> annotation [

	<ignoreInTraitUsers>
	<MSEClass: #TEntity super: #FmxCTEntityGenerated>
	<package: #'FmxC-Generated'>
	^self
]
