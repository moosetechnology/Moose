"
Description
--------------------

I am a report that store everything occuring during the import.
At this time, it is entities not found in the target moose group.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	createdTags:				<aCollection>	List of tags created by the import.
	missingEntities:		<aCollection>	List of tagged entities that are missing in the current model.

"
Class {
	#name : #FamixTagImportReport,
	#superclass : #Object,
	#instVars : [
		'missingEntities',
		'createdTags'
	],
	#category : #'Famix-Tagging-ImportExport'
}

{ #category : #report }
FamixTagImportReport >> createdTag: aFamixTag [
	self createdTags add: aFamixTag
]

{ #category : #accessing }
FamixTagImportReport >> createdTags [
	^ createdTags
]

{ #category : #initialization }
FamixTagImportReport >> initialize [
	super initialize.
	missingEntities := OrderedCollection new.
	createdTags := OrderedCollection new
]

{ #category : #report }
FamixTagImportReport >> missedEntity: anEntityId [
	self missingEntities add: anEntityId
]

{ #category : #accessing }
FamixTagImportReport >> missingEntities [
	^ missingEntities
]
