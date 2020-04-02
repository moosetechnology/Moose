"
Description
--------------------

I am an object to define an exporting format for tags. I will be used by STON to follow my instance variables pattern.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	tags:						<aCollection>	A list of tags to export.
	tagsAssociations:		<aCollection>	A list of associations to export.
	tagsCategories:			<aCollection>	A list of categories to export.

"
Class {
	#name : #FamixTagSTONExport,
	#superclass : #Object,
	#instVars : [
		'tags',
		'tagsCategories',
		'tagsAssociations'
	],
	#category : #'Famix-Tagging-ImportExport'
}

{ #category : #'instance creation' }
FamixTagSTONExport class >> tags: aCollection categories: anotherCollection associations: yetAnotherCollection [
	^ self new
		tags: aCollection;
		tagsCategories: anotherCollection;
		tagsAssociations: yetAnotherCollection;
		yourself
]

{ #category : #accessing }
FamixTagSTONExport >> tags [
	^ tags
]

{ #category : #accessing }
FamixTagSTONExport >> tags: anObject [
	tags := anObject asOrderedCollection 
]

{ #category : #accessing }
FamixTagSTONExport >> tagsAssociations: anObject [
	tagsAssociations := anObject asOrderedCollection
]

{ #category : #accessing }
FamixTagSTONExport >> tagsCategories: anObject [
	tagsCategories := anObject asOrderedCollection
]
