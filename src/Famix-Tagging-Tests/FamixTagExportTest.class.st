Class {
	#name : #FamixTagExportTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'tag',
		'tagModel',
		'export'
	],
	#category : #'Famix-Tagging-Tests'
}

{ #category : #running }
FamixTagExportTest >> setUp [
	super setUp.
	model := FamixTagTestModel new.
	tagModel := FamixTagModel new.
	tag := (FamixTag named: 'Tag')
		mooseModel: tagModel;
		yourself
]

{ #category : #tests }
FamixTagExportTest >> testExportThenImportInAnotherModel [
	| newModel class newClass |
	newModel := FamixTagTestModel new.

	class := FamixTagTestClass named: 'Class1' model: model.
	class tagWith: tag.
	newClass := FamixTagTestClass named: 'Class1' model: newModel.

	self assert: class mooseName equals: newClass mooseName.	"This is the condition to match the class"

	export := String streamContents: [ :s | model exportTagsOn: s tagModel: tagModel ].
	newModel importTagsFrom: export readStream tagModel: tagModel.

	self assertCollection: newClass tags hasSameElements: {tag}.
	self assert: newModel size equals: 2	"Class + tagAssociation"
]

{ #category : #tests }
FamixTagExportTest >> testExportThenImportInAnotherModelAndInNewTagModel [
	| newModel class newClass newTagModel report |
	newModel := FamixTagTestModel new.
	newTagModel := FamixTagModel new.

	class := FamixTagTestClass named: 'Class1' model: model.
	class tagWith: tag.
	newClass := FamixTagTestClass named: 'Class1' model: newModel.

	self assert: class mooseName equals: newClass mooseName.	"This is the condition to match the class"

	export := String streamContents: [ :s | model exportTagsOn: s tagModel: tagModel ].
	report := newModel importTagsFrom: export readStream tagModel: newTagModel.

	self assert: newClass tags size equals: 1.
	self assert: newClass tags first name equals: tag name.
	self deny: newClass tags first identicalTo: tag.
	self assert: newModel size equals: 2.	"Class + tagAssociation"
	self assert: report createdTags size equals: 1
]

{ #category : #tests }
FamixTagExportTest >> testExportThenImportInAnotherModelAndInNewTagModelWithCategory [
	| newModel newTagModel category |
	newModel := FamixTagTestModel new.
	newTagModel := FamixTagModel new.
	category := tag addCategoryNamed: 'system'.

	(FamixTagTestClass named: 'Class1' model: model) tagWith: tag.
	FamixTagTestClass named: 'Class1' model: newModel.

	export := String streamContents: [ :s | model exportTagsOn: s tagModel: tagModel ].
	newModel importTagsFrom: export readStream tagModel: newTagModel.

	self assert: newModel size equals: 2.	"Class + tagAssociation"
	self assert: newTagModel allTagCategories size equals: 1.
	self assert: newTagModel allTagCategories first name equals: 'system'.
	self deny: newTagModel allTagCategories first equals: category.
	self assertCollection: newTagModel tags first categories hasSameElements: newTagModel allTagCategories.
	self assertCollection: newTagModel allTagCategories first markedTags hasSameElements: newTagModel tags
]

{ #category : #tests }
FamixTagExportTest >> testExportThenImportInAnotherModelCompositeTag [
	| newModel childTag newTagModel newTag newChildTag |
	newModel := FamixTagTestModel new.
	childTag := (FamixTag named: 'Child')
		mooseModel: tagModel;
		parentTag: tag;
		yourself.
	newTagModel := FamixTagModel new.
	export := String streamContents: [ :s | model exportTagsOn: s tagModel: tagModel ].
	newModel importTagsFrom: export readStream tagModel: newTagModel.

	self assert: newTagModel tags size equals: 2.

	newTag := newTagModel tags first.

	self deny: newTag identicalTo: tag.
	self assert: newTag subTags size equals: 1.

	newChildTag := newTag subTags first.

	self deny: newChildTag identicalTo: childTag.
	self assertEmpty: newChildTag subTags.
	self assert: newChildTag parentTag equals: newTag
]

{ #category : #tests }
FamixTagExportTest >> testExportThenImportInAnotherModelWithoutEntity [
	| newModel class report |
	newModel := FamixTagTestModel new.
	class := FamixTagTestClass named: 'Class1' model: model.
	class tagWith: tag.

	export := String streamContents: [ :s | model exportTagsOn: s tagModel: tagModel ].
	report := newModel importTagsFrom: export readStream tagModel: tagModel.

	self assertEmpty: newModel.
	self assertCollection: report missingEntities hasSameElements: {class mooseName}
]

{ #category : #tests }
FamixTagExportTest >> testExportThenImportInTheSameModelDoesNotCreateDuplication [
	| class |
	class := FamixTagTestClass named: 'Class1' model: model.
	class tagWith: tag.

	export := String streamContents: [ :s | model exportTagsOn: s tagModel: tagModel ].
	model importTagsFrom: export readStream tagModel: tagModel.

	self assert: class tags equals: {tag}.
	self assert: model size equals: 2	"Class + tagAssociation"
]
