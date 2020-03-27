Class {
	#name : #TestTag,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'testTag1',
		'testTag2'
	],
	#category : #'Famix-TestTags'
}

{ #category : #running }
TestTag >> setUp [
	model := FamixTestTagsModel new.
	1 to: 5 do: [ :i | FamixTestTagsEntity new mooseModel: model ].
	testTag1 := FamixTag new
		mooseModel: model;
		name: 'TestTag1';
		color: Color red.
	testTag2 := FamixTag new
		mooseModel: model;
		name: 'TestTag2';
		color: Color green
]

{ #category : #tests }
TestTag >> testEntitiesTagged [
	| entity1 entity2 |
	entity1 := (model allWithType: FamixTestTagsEntity) first.
	entity2 := (model allWithType: FamixTestTagsEntity) second.
	self assert: entity1 tags isEmpty .
	self assert: entity2 tags isEmpty .
	entity1 addTag: testTag1.	self assertCollection: entity1 tags hasSameElements: {testTag1}.
	self assert: entity2 tags isEmpty .
	entity2 addTag: testTag1.
	self assertCollection: entity2 tags hasSameElements: {testTag1}.
	entity2 addTag: testTag2.
	self assertCollection: entity1 tags hasSameElements: {testTag1}.
	self
		assertCollection: entity2 tags
		hasSameElements:
			{testTag1.
			testTag2}.
			
]

{ #category : #tests }
TestTag >> testRemoveATagFromAnEntity [
	| entity1 |
	entity1 := (model allWithType: FamixTestTagsEntity) first.
	entity1 addTag: testTag1.
	entity1 addTag: testTag2.
	entity1 removeTag: testTag1.
	self assertCollection: entity1 tags hasSameElements: {testTag2}.
	self assert: testTag1 entities isEmpty
]

{ #category : #tests }
TestTag >> testTagEntities [
	| entity1 entity2 |
	entity1 := (model allWithType: FamixTestTagsEntity) first.
	entity2 := (model allWithType: FamixTestTagsEntity) second.
	self assert: testTag1 entities isEmpty.
	self assert: testTag2 entities isEmpty.
	
	entity1 addTag: testTag1.
	self assertCollection: testTag1 entities hasSameElements: {entity1}.
	self assert: testTag2 entities isEmpty.
	
	entity2 addTag: testTag1.
	self
		assertCollection: testTag1 entities
		hasSameElements:
			{entity1.
			entity2}.
			
	entity2 addTag: testTag2.
	self
		assertCollection: testTag1 entities
		hasSameElements:
			{entity1.
			entity2}.
	self assertCollection: testTag2 entities hasSameElements: {entity2}
]

{ #category : #tests }
TestTag >> testTagsColorAreRedAndGreen [
	self assert: testTag1 color equals: Color red.
	self assert: testTag2 color equals: Color green
]

{ #category : #tests }
TestTag >> testTagsInTheModel [
	self assert: (model allWithType: FamixTag) size equals: 2.
	self
		assertCollection: (model allWithType: FamixTag)
		hasSameElements:
			{testTag1.
			testTag2}
]

{ #category : #tests }
TestTag >> testTagsName [
	self assert: testTag1 name equals: 'TestTag1'.
	self assert: testTag2 name equals: 'TestTag2'.

]
