Class {
	#name : #FmxMBNavigationGroup,
	#superclass : #Object,
	#instVars : [
		'name',
		'entity',
		'relation'
	],
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #accessing }
FmxMBNavigationGroup >> entity [
	^ entity
]

{ #category : #accessing }
FmxMBNavigationGroup >> entity: anObject [
	entity := anObject
]

{ #category : #accessing }
FmxMBNavigationGroup >> name [
	^ name
]

{ #category : #accessing }
FmxMBNavigationGroup >> name: anObject [
	name := anObject
]

{ #category : #accessing }
FmxMBNavigationGroup >> relation [
	^ relation
]

{ #category : #accessing }
FmxMBNavigationGroup >> relation: anObject [
	relation := anObject
]
