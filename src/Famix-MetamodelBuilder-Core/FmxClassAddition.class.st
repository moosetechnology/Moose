Class {
	#name : #FmxClassAddition,
	#superclass : #FmxCodeChange,
	#instVars : [
		'definition'
	],
	#category : #'Famix-MetamodelBuilder-Core-Changes'
}

{ #category : #'instance creation' }
FmxClassAddition class >> definition: aString [
	^ self new
		definition: aString;
		yourself
]

{ #category : #accessing }
FmxClassAddition >> apply [
	self class compiler evaluate: self definition
]

{ #category : #accessing }
FmxClassAddition >> definition [
	^ definition
]

{ #category : #accessing }
FmxClassAddition >> definition: anObject [
	definition := anObject
]
