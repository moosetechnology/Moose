Class {
	#name : #FmxCleaningMethodInfo,
	#superclass : #Object,
	#instVars : [
		'sourceCode',
		'protocol'
	],
	#category : #'Famix-MetamodelBuilder-Core-Basic'
}

{ #category : #'instance creation' }
FmxCleaningMethodInfo class >> source: aString protocol: aSymbol [
	^ self new
		sourceCode: aString;
		protocol: aSymbol;
		yourself
]

{ #category : #accessing }
FmxCleaningMethodInfo >> protocol [
	^ protocol
]

{ #category : #accessing }
FmxCleaningMethodInfo >> protocol: anObject [
	protocol := anObject
]

{ #category : #accessing }
FmxCleaningMethodInfo >> sourceCode [
	^ sourceCode
]

{ #category : #accessing }
FmxCleaningMethodInfo >> sourceCode: anObject [
	sourceCode := anObject
]
