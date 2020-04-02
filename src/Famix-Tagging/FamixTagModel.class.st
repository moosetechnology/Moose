"
Description
--------------------

I am a model for Tags. I am separated from the classical MooseModel because I can concern many mooseModel (for project versions, mutations...).

Consequently there is no strong link between the entities and the FamixTagModel because this one must remain independant and cross version.
"
Class {
	#name : #FamixTagModel,
	#superclass : #MooseAbstractGroup,
	#category : #'Famix-Tagging-Model'
}

{ #category : #meta }
FamixTagModel class >> annotation [
	<MSEClass: #TagModel super: #MooseAbstractGroup>
	<package: #Tagging>
]

{ #category : #'adding/removing' }
FamixTagModel >> add: anEntity [
	self
		assert: (anEntity class = FamixTag or: anEntity class = FamixTagCategory)
		description: 'Only FamixTag and FamixTagCategory can be added to a FamixTagModel'.
	super add: anEntity
]

{ #category : #'adding/removing' }
FamixTagModel >> addTaggingEntityFirst: anEntity [
	self add: anEntity
]

{ #category : #removing }
FamixTagModel >> removeTaggingEntity: aFamixTag [
	self removeEntity: aFamixTag
]
