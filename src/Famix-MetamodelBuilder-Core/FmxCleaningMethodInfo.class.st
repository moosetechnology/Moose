"
Description
--------------------

I am an utility class to keep some info about methods.

I am used by the partial cleaning strategy of the MM generation.
"
Class {
	#name : #FmxCleaningMethodInfo,
	#superclass : #Object,
	#instVars : [
		'sourceCode',
		'protocol',
		'isInstanceSide'
	],
	#category : #'Famix-MetamodelBuilder-Core-Cleaning'
}

{ #category : #'instance creation' }
FmxCleaningMethodInfo class >> source: aString protocol: aSymbol isInstanceSide: aBoolean [
	^ self new
		sourceCode: aString;
		protocol: aSymbol;
		isInstanceSide: aBoolean;
		yourself
]

{ #category : #accessing }
FmxCleaningMethodInfo >> isInstanceSide [
	^ isInstanceSide
]

{ #category : #accessing }
FmxCleaningMethodInfo >> isInstanceSide: anObject [
	isInstanceSide := anObject
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
