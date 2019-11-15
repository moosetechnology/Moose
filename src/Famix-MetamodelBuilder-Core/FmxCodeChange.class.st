"
Description
--------------------

I am an abstract class representing a code changes.

I am used by the Famix Generator to represent a change the generator need to apply during a generation and I can be applied.

I am useful because the generator will be able to create the list of changes to apply and apply them. Doing the separation allows us to implement new features such as a method to know if a generator would have impact if we need to regenerate. 

Public API and Key Messages
--------------------

- #apply 		Will apply the change to the current system
"
Class {
	#name : #FmxCodeChange,
	#superclass : #Object,
	#category : #'Famix-MetamodelBuilder-Core-Changes'
}

{ #category : #testing }
FmxCodeChange class >> isAbstract [
	^ self = FmxCodeChange
]

{ #category : #accessing }
FmxCodeChange >> apply [
	self subclassResponsibility
]
