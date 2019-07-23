"
Description
--------------------

I am an abstract class representing changes that will need to impact a class during the generation.
	
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	className:		<aSymbol>		Name of the class to impact.
	isClassSide:		<aBoolean>	A boolean to determine if the impact will be on the instance or the class side of the class to update.

"
Class {
	#name : #FmxLazyClassChange,
	#superclass : #FmxCodeChange,
	#instVars : [
		'className',
		'isClassSide'
	],
	#category : #'Famix-MetamodelBuilder-Core-Changes'
}

{ #category : #accessing }
FmxLazyClassChange >> className [
	^ className
]

{ #category : #accessing }
FmxLazyClassChange >> className: anObject [
	className := anObject
]

{ #category : #initialization }
FmxLazyClassChange >> initialize [
	super initialize.
	isClassSide := false
]

{ #category : #accessing }
FmxLazyClassChange >> isClassSide [
	^ isClassSide
]

{ #category : #accessing }
FmxLazyClassChange >> isClassSide: anObject [
	isClassSide := anObject
]

{ #category : #accessing }
FmxLazyClassChange >> realClass [
	| class |
	class := self class environment at: self className.
	^ self isClassSide ifTrue: [ class class ] ifFalse: [ class ]
]
