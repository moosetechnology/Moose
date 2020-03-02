Extension { #name : #MooseEntity }

{ #category : #'*FamixTags' }
MooseEntity >> addTag: aTag [
	(self allTags includes: aTag)
		ifTrue: [ ^ self ].
	self allTags add: aTag.
	aTag unsafeAddEntity: self
]

{ #category : #'*FamixTags' }
MooseEntity >> allTags [
	^self privateState propertyAt: #allTags ifAbsentPut: [ OrderedCollection new: 2 ]
]

{ #category : #'*FamixTags' }
MooseEntity >> allTags: aCollection [
	self allTags do: [ :t | t unsafeRemoveEntity: self ].
	self privateState propertyAt: #allTags put: [ OrderedCollection new: aCollection size ].
	aCollection do: [ :t | self addTag: t ]
]

{ #category : #'*FamixTags' }
MooseEntity >> removeTag: aTag [
	(self allTags includes: aTag)
		ifFalse: [ ^ self ].
	self allTags remove: aTag.
	aTag unsafeRemoveEntity: self
]
