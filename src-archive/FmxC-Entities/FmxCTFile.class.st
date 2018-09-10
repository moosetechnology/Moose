Class {
	#name : #FmxCTFile,
	#superclass : #FmxTraitEntity,
	#instVars : [
		'#definedEntities => FMMany type: #FmxCTEntity opposite: #definedIn'
	],
	#category : #'FmxC-Entities'
}

{ #category : #meta }
FmxCTFile class >> annotation [

	<ignoreInTraitUsers>
	<MSEClass: #TFile super: #FmxCTFileGenerated>
	<package: #'FmxC-Generated'>
	^self
]
