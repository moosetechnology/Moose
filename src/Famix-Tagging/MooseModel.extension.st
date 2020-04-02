Extension { #name : #MooseModel }

{ #category : #'*Famix-Tagging' }
MooseModel >> addTaggingEntityFirst: anElement [
	"Since we can add and remove tags a lot, we prefer to have it at the start of the entity storage. Also, we do not want to flush all caches but only the ones related to tags."

	self entityStorage addTaggingEntityFirst: anElement.
	self privateState removeTagProperties.
	anElement privateSetMooseModel: self.
	self announcer announce: (MooseEntityAdded new entity: anElement).
	^ anElement
]

{ #category : #'*Famix-Tagging' }
MooseModel >> removeTaggingEntity: anElement [
	"Do not flush all caches because we detag something."

	self entityStorage remove: anElement.
	anElement privateSetMooseModel: nil.
	self privateState removeTagProperties.
	self announcer announce: (MooseEntityRemoved new entity: anElement).
	^ anElement
]
