"
Description
--------------------

I represent a one-to-one relationship object between a tag and an entity on which the tag is placed.

"
Class {
	#name : #FamixTagEntityAssociation,
	#superclass : #FamixTagAssociation,
	#category : #'Famix-Tagging-Model'
}

{ #category : #meta }
FamixTagEntityAssociation class >> annotation [
	<MSEClass: #EntityAssociation super: #FamixTagAssociation>
	<package: #Tagging>
]

{ #category : #testing }
FamixTagEntityAssociation >> isEntityTagAssociation [
	^ true
]
