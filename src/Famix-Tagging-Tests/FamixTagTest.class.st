"
A FamixTagTest is a test class for testing the behavior of FamixTag
"
Class {
	#name : #FamixTagTest,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'simpleTag',
		'compositeTag',
		'newTag'
	],
	#category : #'Famix-Tagging-Tests'
}

{ #category : #running }
FamixTagTest >> setUp [
	super setUp.
	model := FamixTagTestModel new.
	FamixTagTestClass named: 'aClass1' model: model.
	FamixTagTestClass named: 'aClass2' model: model.
	simpleTag := model createTagNamed: 'leaf'.
	compositeTag := (model createTagNamed: 'parent')
		addSubTag: simpleTag;
		yourself.
	newTag := model createTagNamed: 'newTag'
]

{ #category : #tests }
FamixTagTest >> testATagCannotBeItsOwnAncestor [
	| tag |
	tag := model tagNamed: 'Tag'.
	self should: [ tag parentTag: (tag createSubTagNamed: 'Son') ] raise: FamixTagRecursiveFailure
]

{ #category : #tests }
FamixTagTest >> testATagCannotBeItsOwnParent [
	| tag |
	tag := model tagNamed: 'Tag'.
	self should: [ tag parentTag: tag ] raise: FamixTagRecursiveFailure
]

{ #category : #tests }
FamixTagTest >> testAddParentTagWhenThereIsAlreadyAParentTag [
	self assert: compositeTag isRoot description: 'At the beginning of the test the composite tag should not have any parent.'.
	newTag addSubTag: simpleTag.
	self assert: simpleTag parentTag = newTag description: 'The parent should be newParent.'.
	self deny: (compositeTag subTags includes: simpleTag) description: 'Theold parent should not have the tag anymore.'
]

{ #category : #tests }
FamixTagTest >> testAddSubTag [
	self assert: compositeTag isRoot description: 'At the beginning of the test the composite tag should not have any parent.'.
	newTag addSubTag: compositeTag.
	self assert: compositeTag parentTag = newTag description: 'The parent should have been added.'
]

{ #category : #tests }
FamixTagTest >> testAllParentTags [
	newTag addSubTag: compositeTag.
	self assert: simpleTag allParentTags size = 2 description: 'The simple tag should have two parents: composite and newParent.'.
	self assert: compositeTag allParentTags size = 1 description: 'The composite tag should have one parent: newParent.'
]

{ #category : #tests }
FamixTagTest >> testAllSubTags [
	newTag addSubTag: compositeTag.
	self assert: newTag allSubTags size = 2 description: 'The newParent tag should have two children: composite and simple.'.
	self assert: compositeTag allSubTags size = 1 description: 'The composite tag should have one child: simple.'
]

{ #category : #tests }
FamixTagTest >> testChangeParentTagTo [
	self assert: simpleTag parentTag = compositeTag description: 'At the beginning of the test the parent of the simple tag should be the composite tag.'.
	simpleTag changeParentTagTo: newTag.
	self assert: simpleTag parentTag = newTag description: 'The parent should have change and be the new parent.'
]

{ #category : #tests }
FamixTagTest >> testFindSubTagNamed [
	self assert: (compositeTag findSubTagNamed: 'leaf') equals: simpleTag
]

{ #category : #tests }
FamixTagTest >> testFindSubTagNamedNonExisting [
	self should: [ compositeTag findSubTagNamed: 'absent' ] raise: NotFound
]

{ #category : #tests }
FamixTagTest >> testIsAncestorGrandParent [
	| parent subTag grandChild |
	parent := model tagNamed: 'Parent'.
	subTag := parent createSubTagNamed: 'Child'.
	grandChild := subTag createSubTagNamed: 'GrandChild'.
	self assert: (parent isAncestorOf: grandChild)
]

{ #category : #tests }
FamixTagTest >> testIsAncestorParent [
	| parent subTag |
	parent := model tagNamed: 'Parent'.
	subTag := parent createSubTagNamed: 'Child'.
	self assert: (parent isAncestorOf: subTag)
]

{ #category : #tests }
FamixTagTest >> testIsComposite [
	self assert: compositeTag isComposite description: 'The composite tag have a simple tag inside him so it should be a composite'.
	self deny: simpleTag isComposite description: 'The simple tag have no tag inside him so it should not be a composite.'.
	simpleTag addSubTag: newTag.
	self assert: simpleTag isComposite description: 'We added a tag inside the simple tag, so it should now be a composite.'
]

{ #category : #tests }
FamixTagTest >> testIsRoot [
	simpleTag promoteAsRoot.
	self assert: simpleTag isRoot.
	compositeTag := (model createTagNamed: 'database')
		addSubTag: simpleTag;
		yourself.
	self deny: simpleTag isRoot.
	self assert: compositeTag isRoot.
	newTag addSubTag: compositeTag.
	self deny: compositeTag isRoot
]

{ #category : #tests }
FamixTagTest >> testMooseName [
	self assert: compositeTag mooseName equals: #parent.
	self assert: simpleTag mooseName equals: 'parent>leaf'
]

{ #category : #tests }
FamixTagTest >> testParentTag [
	self assert: simpleTag parentTag = compositeTag description: 'At the beginning of the test the parent tag should be composite tag.'.
	newTag addSubTag: simpleTag.
	self assert: simpleTag parentTag = newTag description: 'The parent should now be newParent.'
]

{ #category : #tests }
FamixTagTest >> testRemoveAndPromoteSubTags [
	newTag addSubTag: compositeTag.
	self assert: newTag allSubTags size = 2 description: 'At the beginning the newParent tag have two children: simple and composite.'.
	compositeTag removeAndPromoteChildren.
	self assertEmpty: compositeTag children.
	self assert: newTag allSubTags size = 1 description: 'The child of my old child should now be my child'.
	self assert: newTag allSubTags anyOne = simpleTag description: 'The child of my old child should now be my child'
]

{ #category : #tests }
FamixTagTest >> testRemoveFromParent [
	compositeTag addSubTag: newTag.
	self assert: compositeTag allSubTags size = 2 description: 'At the beginning the composite tag have two children.'.
	simpleTag remove.
	self assert: compositeTag allSubTags size = 1 description: 'With the simple tag removed the composite tag should have one child.'
]

{ #category : #tests }
FamixTagTest >> testRemoveSelfAndSubTags [
	newTag addSubTag: compositeTag.
	self assert: newTag allSubTags size = 2 description: 'At the beginning the newParent tag have two children: simple and composite.'.
	compositeTag remove.
	self assert: newTag allSubTags isEmpty description: 'All the tags were removed so I should not have any child.'
]

{ #category : #tests }
FamixTagTest >> testRemoveSubTagThenRecreateIt [
	| parent son |
	parent := model createTagNamed: 'Parent'.
	son := parent createSubTagNamed: 'Son'.
	son remove.
	self deny: (parent createSubTagNamed: 'Son') identicalTo: son
]

{ #category : #tests }
FamixTagTest >> testSubTagNamedExisting [
	self assert: (compositeTag subTagNamed: 'leaf') equals: simpleTag
]

{ #category : #tests }
FamixTagTest >> testSubTagNamedNonExisting [
	| subTag |
	self assert: model tags size equals: 3.
	subTag := newTag subTagNamed: 'absent'.
	self assert: newTag isComposite.
	self assert: model tags size equals: 4.
	self assert: newTag subTags anyOne equals: subTag
]
