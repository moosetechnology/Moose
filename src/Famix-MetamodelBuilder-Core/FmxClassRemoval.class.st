"
Description
--------------------

I represent a change that would remove a class during a Famix generation.

Examples
--------------------

	FmxClassRemoval class: FmxClassRemoval
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	class:		<aClass>		The instance of the class to remove from the system.

"
Class {
	#name : #FmxClassRemoval,
	#superclass : #FmxCodeChange,
	#instVars : [
		'class'
	],
	#category : #'Famix-MetamodelBuilder-Core-Changes'
}

{ #category : #'instance creation' }
FmxClassRemoval class >> class: aClass [
	^ self new
		class: aClass;
		yourself
]

{ #category : #accessing }
FmxClassRemoval >> apply [
	self class removeFromSystem
]

{ #category : #accessing }
FmxClassRemoval >> class [
	^ class
]

{ #category : #accessing }
FmxClassRemoval >> class: anObject [
	class := anObject
]
