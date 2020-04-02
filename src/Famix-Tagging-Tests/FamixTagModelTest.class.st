Class {
	#name : #FamixTagModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Famix-Tagging-Tests'
}

{ #category : #running }
FamixTagModelTest >> setUp [
	super setUp.
	model := FamixTagModel new
]

{ #category : #tests }
FamixTagModelTest >> testAddACategory [
	| tag |
	tag := model createTagNamed: 'MyTag'.
	tag addCategoryNamed: 'C1'.
	self assert: tag categories size equals: 1.
	self assert: tag categories anyOne name equals: 'C1'.
	self assert: model allTagCategories size equals: 1
]

{ #category : #tests }
FamixTagModelTest >> testAddACategoryToATagWithoutModel [
	self should: [ FamixTag new addCategoryNamed: 'A' ] raise: FamixTagRequireModelFailure
]

{ #category : #tests }
FamixTagModelTest >> testAddATagWithNoNameToParent [
	| tag |
	tag := FamixTag new
		name: 'Parent';
		mooseModel: model;
		yourself.
	self should: [ tag addSubTag: FamixTag new ] raise: FamixTagUnamedFailure
]

{ #category : #tests }
FamixTagModelTest >> testAddATagWithSameNameInModel [
	(FamixTag named: 'Existing') mooseModel: model.
	self should: [ (FamixTag named: 'Existing') mooseModel: model ] raise: FamixAlreadyExistTagFailure
]

{ #category : #tests }
FamixTagModelTest >> testAddATagWithSameNamedBrotherInModel [
	| tag |
	tag := (FamixTag named: 'Parent')
		mooseModel: model;
		createSubTagNamed: 'Son';
		yourself.
	self should: [ tag createSubTagNamed: 'Son' ] raise: FamixAlreadyExistTagFailure.
	self assert: tag children size equals: 1
]

{ #category : #tests }
FamixTagModelTest >> testAddNonTagInModel [
	self should: [ MooseEntity new mooseModel: model ] raise: AssertionFailure
]

{ #category : #tests }
FamixTagModelTest >> testAddNotNamedTagInModel [
	self should: [ FamixTag new mooseModel: model ] raise: FamixTagUnamedFailure
]

{ #category : #tests }
FamixTagModelTest >> testAddTagInModel [
	(FamixTag named: 'Foo') mooseModel: model.
	self assert: model size equals: 1
]

{ #category : #tests }
FamixTagModelTest >> testCreateTag [
	| tag |
	tag := model createTagNamed: 'MyTag'.
	self assert: tag mooseModel equals: model.
	self assert: (model includes: tag)
]

{ #category : #tests }
FamixTagModelTest >> testDeleteTagAndRemoveAssociationsInAnotherModel [
	| mooseModel tag entity |
	mooseModel := FamixTagTestModel new.
	tag := model tagNamed: 'Example'.
	entity := MooseEntity new
		mooseModel: mooseModel;
		yourself.
	tag tagEntity: entity.

	self assert: entity tags equals: {tag}.

	tag removeAndDeleteAssociationsInModel: mooseModel.

	self assertEmpty: entity tags.
	self assertEmpty: mooseModel allTagAssociations
]

{ #category : #tests }
FamixTagModelTest >> testRemoveACategory [
	| tag |
	tag := model createTagNamed: 'MyTag'.
	tag addCategoryNamed: 'C1'.

	self assert: tag categories size equals: 1.
	self assert: tag categories anyOne name equals: 'C1'.

	tag removeCategory: (model findTagCategoryNamed: 'C1').

	self assertEmpty: tag categories
]

{ #category : #tests }
FamixTagModelTest >> testRemoveTagThenRecreateIt [
	| tag |
	tag := model tagNamed: 'Toto'.
	tag remove.

	self assertEmpty: model tags.
	self deny: (model tagNamed: 'Toto') identicalTo: tag.
	self denyEmpty: model tags
]

{ #category : #tests }
FamixTagModelTest >> testTagEntityFromAnotherModel [
	| mooseModel entity tag |
	mooseModel := FamixTagTestModel new.
	entity := FamixTagTestEntity new mooseModel: mooseModel.
	tag := model createTagNamed: 'MyTag'.
	tag tagEntity: entity.

	self assert: model tags size equals: 1.
	self assert: model tags anyOne equals: tag.
	self assert: entity tagAssociations size equals: 1.
	self assert: entity tagAssociations anyOne tag equals: tag
]

{ #category : #tests }
FamixTagModelTest >> testTagNamed [
	| tag |
	tag := (FamixTag named: 'TestTag')
		mooseModel: model;
		yourself.

	self assert: (model findTagNamed: 'TestTag') equals: tag
]
