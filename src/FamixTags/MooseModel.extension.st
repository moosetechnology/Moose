Extension { #name : #MooseModel }

{ #category : #'*FamixTags' }
MooseModel >> allTags [
	^self privateState attributeAt: #allTags  ifAbsentPut: [ OrderedCollection new ]
]

{ #category : #'*FamixTags' }
MooseModel >> resetTags [
	self allTags do: [ :t | t reset ].
	self privateState attributeAt: #allTags put: OrderedCollection new
]

{ #category : #'*FamixTags' }
MooseModel >> tagNamed: aString [
	|tags|
	tags := self allTags.
	^tags detect: [ :o | o name = aString ]
		ifNone: [ |tag|
			tag := FAMIXTag new.
			tag name: aString.
			tags add: tag.
			tag]
		
]
