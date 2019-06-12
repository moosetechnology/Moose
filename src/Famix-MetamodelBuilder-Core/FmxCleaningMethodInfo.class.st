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
		'isInstanceSide',
		'methodClass'
	],
	#category : #'Famix-MetamodelBuilder-Core-Cleaning'
}

{ #category : #'instance creation' }
FmxCleaningMethodInfo class >> source: aString protocol: aSymbol isInstanceSide: aBoolean methodClass: aClass [
	^ self new
		sourceCode: aString;
		protocol: aSymbol;
		isInstanceSide: aBoolean;
		methodClass: aClass;
		yourself
]

{ #category : #actions }
FmxCleaningMethodInfo >> install [
	"Reinstall the method if possible."

	self class environment at: self methodClass ifPresent: [ :class | (self isInstanceSide ifTrue: [ class ] ifFalse: [ class class ]) compile: self sourceCode classified: self protocol ]
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
FmxCleaningMethodInfo >> methodClass [
	^ methodClass
]

{ #category : #accessing }
FmxCleaningMethodInfo >> methodClass: anObject [
	methodClass := anObject
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
