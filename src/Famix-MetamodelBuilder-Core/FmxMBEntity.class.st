Class {
	#name : #FmxMBEntity,
	#superclass : #Object,
	#instVars : [
		'name',
		'comment',
		'builder',
		'willGenerate',
		'navigationGroups',
		'additionalProperties',
		'hasNavigation',
		'isRemote'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #accessing }
FmxMBEntity >> additionalProperties [

	^ additionalProperties 
]

{ #category : #accessing }
FmxMBEntity >> allNnavigationGroups [

	<ignoreForCoverage>
	^ self navigationGroups
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
	hasNavigation := true.
	isRemote := false.
]

{ #category : #accessing }
FmxMBEntity >> isRemote [ 

	^ isRemote
]

{ #category : #accessing }
FmxMBEntity >> isRemote: anObject [
	isRemote := anObject
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
	<ignoreForCoverage>
	navigationGroups := anObject
]

{ #category : #accessing }
FmxMBEntity >> remoteBuilder [

	^ self additionalProperties at: #remoteBuilder ifAbsent: [ nil ]
]

{ #category : #accessing }
FmxMBEntity >> remoteBuilder: aRemoteBuilder [

	self additionalProperties at: #remoteBuilder put: aRemoteBuilder
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
FmxMBEntity >> withNavigationOf: aRelation [

	self navigationGroups add: (FmxMBNavigationGroup new 
		name: self name;
		entity: self;
		relation: aRelation;
		yourself).
]

{ #category : #navigation }
FmxMBEntity >> withoutNavigation [

	hasNavigation := false.
	navigationGroups := Set new.
]
