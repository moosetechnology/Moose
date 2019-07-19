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
