Extension { #name : #MooseMemoryEfficientState }

{ #category : #'*Famix-Tagging' }
MooseMemoryEfficientState >> removeTagProperties [
	"I am used when we remove tags to update the caches"

	propertyCache keysAndValuesRemove: [ :key :value | key asString includesSubstring: 'FamixTag' ]
]
