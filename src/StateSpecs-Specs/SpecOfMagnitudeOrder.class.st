"
I am root of hierrarchy of magnitude order specifications.

Variable isStrong specifes strong comparison for order check  

Internal Representation and Key Implementation Points.

    Instance Variables
	isStrong:		<Boolean>
"
Class {
	#name : #SpecOfMagnitudeOrder,
	#superclass : #SpecOfObjectValue,
	#instVars : [
		'isStrong'
	],
	#category : 'StateSpecs-Specs'
}

{ #category : #'instance creation' }
SpecOfMagnitudeOrder class >> than: aMagnidude strong: aBoolean [
	^self new 
		isStrong: aBoolean;
		requiredValue: aMagnidude;
		yourself 
]

{ #category : #'initialize-release' }
SpecOfMagnitudeOrder >> initialize [ 
	super initialize.
	isStrong := false.
]

{ #category : #accessing }
SpecOfMagnitudeOrder >> isStrong [
	^ isStrong
]

{ #category : #accessing }
SpecOfMagnitudeOrder >> isStrong: anObject [
	isStrong := anObject
]
