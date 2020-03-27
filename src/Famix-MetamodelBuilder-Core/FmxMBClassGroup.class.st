Class {
	#name : #FmxMBClassGroup,
	#superclass : #FmxMBClass,
	#category : #'Famix-MetamodelBuilder-Core-Implementation'
}

{ #category : #'settings - default' }
FmxMBClassGroup >> defaultSuperclass [
	^ self builder environment basicGroupSuperclass
]
