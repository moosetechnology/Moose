"
Description
--------------------

I am a specific ston writer to export a tag model.

I take a moose model contaning tagged entities and a tag model and I export them.

Examples
--------------------

	FamixTagSTONWriter export: aMooseModel with: aTagModel on: aStream
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	tagModel:		<aTagModel>		The tag model to export.

"
Class {
	#name : #FamixTagSTONWriter,
	#superclass : #STONWriter,
	#instVars : [
		'tagModel'
	],
	#category : #'Famix-Tagging-ImportExport'
}

{ #category : #'instance creation' }
FamixTagSTONWriter class >> export: aMooseModel with: aTagModel on: aStream [
	(self on: aStream)
		tagModel: aTagModel;
		writeObject: (FamixTagSTONExport tags: aTagModel tags categories: aTagModel allTagCategories associations: aMooseModel allTagAssociations)
]

{ #category : #accessing }
FamixTagSTONWriter >> tagModel [
	^ tagModel
]

{ #category : #accessing }
FamixTagSTONWriter >> tagModel: anObject [
	tagModel := anObject
]
