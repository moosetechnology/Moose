Class {
	#name : #FmxMBEntity,
	#superclass : #Object,
	#instVars : [
		'name',
		'comment',
		'builder',
		'willGenerate',
		'navigationGroups',
		'additionalProperties'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #accessing }
FmxMBEntity >> additionalProperties [

	^ additionalProperties 
]

{ #category : #accessing }
FmxMBEntity >> builder [
	^ builder
]

{ #category : #accessing }
FmxMBEntity >> builder: anObject [
	builder := anObject
]

{ #category : #accessing }
FmxMBEntity >> comment [
	^ comment
]

{ #category : #accessing }
FmxMBEntity >> comment: anObject [
	comment := anObject
]

{ #category : #initialization }
FmxMBEntity >> initialize [

	super initialize.	

	comment := String new.
	willGenerate := true.
	navigationGroups := Set new.
	additionalProperties := Dictionary new.

]

{ #category : #accessing }
FmxMBEntity >> name [
	^ name
]

{ #category : #accessing }
FmxMBEntity >> name: anObject [
	name := anObject
]

{ #category : #accessing }
FmxMBEntity >> navigationGroups [
	^ navigationGroups
]

{ #category : #accessing }
FmxMBEntity >> navigationGroups: anObject [
	navigationGroups := anObject
]

{ #category : #accessing }
FmxMBEntity >> willGenerate [
	^ willGenerate
]

{ #category : #accessing }
FmxMBEntity >> willGenerate: anObject [
	willGenerate := anObject
]

{ #category : #navigation }
FmxMBEntity >> withNavigation [

	self navigationGroups add: (FmxMBNavigationGroup new 
		name: self name;
		entity: self;
		yourself).
]
