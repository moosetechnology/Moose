Class {
	#name : #FamixTagBasicModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Famix-Tagging-Tests'
}

{ #category : #running }
FamixTagBasicModelTest >> setUp [
	super setUp.
	model := FamixTagTestModel new.
	FamixTagTestClass named: 'aClass1' model: model.
	FamixTagTestClass named: 'aClass2' model: model
]

{ #category : #tests }
FamixTagBasicModelTest >> testAddCompositeTag [
	| compositeTag simpleTag |
	simpleTag := model createTagNamed: 'student'.
	compositeTag := (model createTagNamed: 'database') addSubTag: simpleTag.
	self assert: compositeTag subTags size equals: 1.
	self assert: compositeTag subTags anyOne name equals: 'student'
]

{ #category : #tests }
FamixTagBasicModelTest >> testAllCategories [
	self assertEmpty: model allTagCategories.
	model createTagCategoryNamed: 'First'.
	self assert: model allTagCategories size equals: 1
]

{ #category : #tests }
FamixTagBasicModelTest >> testCategoryCreation [
	"only one category created"

	| category1 category2 |
	category1 := model tagCategoryNamed: 'default'.
	category2 := model tagCategoryNamed: 'default'.
	self assert: category1 identicalTo: category2.
	self assert: category1 name equals: 'default'
]

{ #category : #tests }
FamixTagBasicModelTest >> testMultiCategoryCreation [
	model tagCategoryNamed: 'feature'.
	model tagCategoryNamed: 'default'.
	self assert: model allTagCategories size equals: 2
]

{ #category : #tests }
FamixTagBasicModelTest >> testNoTagWithSameName [
	| class |
	class := model entityNamed: 'aClass1'.
	class tagWithName: 'myTag'.
	self assert: (model entitiesTaggedWith: (model tagNamed: 'myTag')) size equals: 1.
	class := model entityNamed: 'aClass2'.
	class tagWithName: 'myTag'.
	self assert: model tags size equals: 1
]

{ #category : #tests }
FamixTagBasicModelTest >> testRemoveTag [
	| class tag |
	class := model entityNamed: 'aClass1'.
	tag := class tagWithName: 'myTag'.
	self assert: class isTagged.
	class removeTag: tag.
	self deny: class isTagged.
	self assertEmpty: model allTagAssociations.
	self assertCollection: model tags hasSameElements: {tag}
]

{ #category : #tests }
FamixTagBasicModelTest >> testRemoveTagAssociations [
	| class tagAssociation |
	class := model entityNamed: 'aClass1'.
	class tagWithName: 'myTag'.
	self assert: model allTagAssociations size equals: 1.
	tagAssociation := model allTagAssociations first.
	class removeTags.
	self assertEmpty: model allTagAssociations.
	self assert: tagAssociation mooseModel isNil.
	self should: [ tagAssociation tag ] raise: Error.
	self assert: tagAssociation entity isNil.
	self assertEmpty: class tagAssociations
]

{ #category : #tests }
FamixTagBasicModelTest >> testRemoveTagFromComposite [
	| compositeTag simpleTag |
	simpleTag := model createTagNamed: 'student'.
	compositeTag := (model createTagNamed: 'database') addSubTag: simpleTag.
	simpleTag remove.
	self assertEmpty: compositeTag children.
	self assertCollection: model tags hasSameElements: {compositeTag}
]

{ #category : #tests }
FamixTagBasicModelTest >> testSelfTaggingException [
	| class |
	class := model entityNamed: 'aClass1'.
	class tagWithName: 'myTag'.
	self assert: class isTagged.
	self should: [ model tags first tagWithName: 'myTag' ] raise: FamixTagOnTagFailure
]

{ #category : #tests }
FamixTagBasicModelTest >> testSimpleTag [
	| class |
	class := model entityNamed: 'aClass1'.
	class tagWithName: 'myTag'.
	self assert: class isTagged
]

{ #category : #tests }
FamixTagBasicModelTest >> testTagCategory [
	| class |
	class := model entityNamed: 'aClass1'.
	(class tagWithName: 'myTag') addCategoryNamed: 'system'.
	self assert: (class tags anyOne hasCategory: (model findTagCategoryNamed: 'system'))
]

{ #category : #tests }
FamixTagBasicModelTest >> testTagColor [
	self
		assert:
			(FamixTag new
				color: Color red;
				color)
		equals: Color red
]

{ #category : #tests }
FamixTagBasicModelTest >> testTagInterval [
	| class |
	class := model entityNamed: 'aClass1'.
	class tagWith: (model tagNamed: 'myTag') interval: (5 to: 15) sourceAnchor: Mock new.
	self assert: class isTagged
]

{ #category : #tests }
FamixTagBasicModelTest >> testTagMultiCategories [
	| class |
	class := model entityNamed: 'aClass1'.
	(class tagWithName: 'myTag')
		addCategoryNamed: 'system';
		addCategoryNamed: 'hdd'.
	self assert: (class tags anyOne hasCategory: (model findTagCategoryNamed: 'system')).
	self assert: (class tags anyOne hasCategory: (model findTagCategoryNamed: 'hdd'))
]

{ #category : #tests }
FamixTagBasicModelTest >> testTagOnTag [
	| class |
	class := model entityNamed: 'aClass1'.
	class tagWithName: 'myTag'.
	self assert: class isTagged.
	self should: [ model tags anyOne tagWithName: 'anotherTag' ] raise: FamixTagOnTagFailure
]
