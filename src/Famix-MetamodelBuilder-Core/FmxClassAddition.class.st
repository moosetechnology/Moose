"
Description
--------------------

I represent a change that would create a class during a Famix generation.

Examples
--------------------

	FmxClassAddition definition: 'MooseModel subclass: #FmxStMooseModel
	instanceVariableNames: ''''
	classVariableNames: ''''
	package: ''Famix-Smalltalk-Entities'''
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	definition:		<aString>		The definition of the class to create.

"
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
