Class {
	#name : #FamixTagAndCategoriesTest,
	#superclass : #TestCase,
	#category : #'Famix-Tagging-Tests'
}

{ #category : #tests }
FamixTagAndCategoriesTest >> testAddingCategoryToATag [
	| category tag |
	category := FamixTagCategory new.
	tag := FamixTag new.
	tag addCategory: category.
	self assert: tag categories anyOne equals: category.
	self assert: category markedTags anyOne equals: tag
]

{ #category : #tests }
FamixTagAndCategoriesTest >> testAddingTagToCategory [
	| category tag |
	category := FamixTagCategory new.
	tag := FamixTag new.
	category addTag: tag.
	self assert: tag categories anyOne equals: category.
	self assert: category markedTags anyOne equals: tag
]
