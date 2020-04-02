Extension { #name : #MooseEntity }

{ #category : #'*Famix-Tagging' }
MooseEntity >> entityTagAssociations [
	"All entity tag associations placed on this entity"

	^ self tagAssociations select: #isEntityTagAssociation
]

{ #category : #'*Famix-Tagging' }
MooseEntity >> isTagged [
	^ self tagAssociations isNotEmpty
]

{ #category : #'*Famix-Tagging' }
MooseEntity >> isTaggedWith: aTag [
	^ self tags includes: aTag
]

{ #category : #'*Famix-Tagging' }
MooseEntity >> numberOfTags [
	"for queries, some times we want to search all entities that do not have any tags"

	^ self tags size
]

{ #category : #'*Famix-Tagging' }
MooseEntity >> removeTag: aTag [
	"remove a tag from this moose entity"

	self tagAssociations detect: [ :assoc | assoc tag = aTag ] ifFound: #remove
]

{ #category : #'*Famix-Tagging' }
MooseEntity >> removeTags [
	self tagAssociations asOrderedCollection do: #remove
]

{ #category : #'*Famix-Tagging' }
MooseEntity >> tagAssociations [
	<MSEProperty: #tagAssociations type: #FamixTagAssociation opposite: #entity>
	<multivalued>
	<MSEComment: 'All the tag associations linking this entity to a Tag'>
	^ self propertyNamed: #tagAssociations ifAbsentPut: [ FMMultivalueLink on: self opposite: #entity: ]
]

{ #category : #'*Famix-Tagging' }
MooseEntity >> tagAssociations: aCollection [
	self tagAssociations value: aCollection
]

{ #category : #'*Famix-Tagging' }
MooseEntity >> tagWith: aTag [
	^ aTag tagEntity: self
]

{ #category : #'*Famix-Tagging' }
MooseEntity >> tagWithName: aTagName [
	"Use this method if you store your tags in your model"

	^ self tagWithName: aTagName tagModel: self mooseModel
]

{ #category : #'*Famix-Tagging' }
MooseEntity >> tagWithName: aTagName tagModel: aTagModel [
	^ self tagWith: (aTagModel tagNamed: aTagName)
]

{ #category : #'*Famix-Tagging' }
MooseEntity >> tags [
	"all tags on me"
	"
	
	self removeTags
	
	"
	^ (self tagAssociations collectAsSet: #tag) asArray
]

{ #category : #'*Famix-Tagging' }
MooseEntity >> tagsInModel: aTagModel [
	^ self tagAssociations collectAsSet: [ :assoc | assoc tagInTagModel: aTagModel ]
]

{ #category : #'*Famix-Tagging' }
MooseEntity >> toggleTag: aTag [
	"If the entity as already tagged with this tag, remove it. Else, tag the entity."

	self tags
		detect: [ :tag | tag = aTag ]
		ifFound: [ :tag | self removeTag: tag ]
		ifNone: [ aTag tagEntity: self ]
]
