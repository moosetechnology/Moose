"
FamixMetamodelBuilderEnvironment
"
Class {
	#name : #FmxMBEnvironment,
	#superclass : #Object,
	#instVars : [
		'builder'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #'instance creation' }
FmxMBEnvironment class >> for: aBuilder [

	^ self new 
		builder: aBuilder;
		yourself.
]

{ #category : #accessing }
FmxMBEnvironment >> apply [

	<ignoreForCoverage>

]

{ #category : #accessing }
FmxMBEnvironment >> builder [
	^ builder
]

{ #category : #accessing }
FmxMBEnvironment >> builder: anObject [
	builder := anObject
]
