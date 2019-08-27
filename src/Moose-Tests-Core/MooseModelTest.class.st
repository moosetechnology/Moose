"
Just a test about mooseModel root and so on.
"
Class {
	#name : #MooseModelTest,
	#superclass : #MooseAbstractGroupTest,
	#category : #'Moose-Tests-Core'
}

{ #category : #helpers }
MooseModelTest >> actualClass [
	^ MooseModel
]

{ #category : #tests }
MooseModelTest >> testAdd [
	super testAdd.
	self assert: group first mooseModel identicalTo: group
]

{ #category : #tests }
MooseModelTest >> testAddAnnouncement [
	| entity announcedEntity |
	entity := MooseEntity new.
	group announcer when: MooseEntityAdded do: [ :a | announcedEntity := a entity ].

	group add: entity.
	self assert: announcedEntity identicalTo: entity
]

{ #category : #tests }
MooseModelTest >> testAllBookmarks [
	| entity1 entity2 entity3 |
	entity1 := MooseEntity new.
	entity2 := MooseEntity new.
	entity3 := MooseEntity new.
	group add: entity1.
	group add: entity2.
	group add: entity3.
	entity1 bookmarkAs: 'one'.
	entity2 bookmarkAs: 'two'.
	self assert: group allBookmarks size equals: 2
]

{ #category : #tests }
MooseModelTest >> testAsMSEString [
	self assert: MooseModel new asMSEString equals: '()'.
	self
		assert:
			(MooseModel new
				add: MooseEntity new;
				asMSEString)
		equals:
			'(
	(Moose.Entity (id: 1)))'
]

{ #category : #tests }
MooseModelTest >> testBookmarkAsRaisesAnnouncement [
	| entity1 announcedEntity |
	entity1 := MooseEntity new.
	group add: entity1.
	group announcer when: MooseEntityAdded do: [ :a | announcedEntity := a entity ].

	entity1 bookmarkAs: 'one'.
	self assert: announcedEntity isNotNil
]

{ #category : #tests }
MooseModelTest >> testCacheInvalidationAfterAdd [
	self assertEmpty: group allClasses.
	group add: FamixTest3Class new.
	self assert: group allClasses size equals: 1
]

{ #category : #tests }
MooseModelTest >> testCacheInvalidationAfterMultipleAddRemove [
	| classA classB |
	classA := FamixTest3Class named: 'ClassA'.
	classB := FamixTest3Class named: 'ClassB'.
	group add: classA.
	self assert: group allClasses size equals: 1.
	group add: classB.
	self assert: group allClasses size equals: 2.
	group remove: classA.
	self assert: group allClasses size equals: 1.
	group add: classA.
	self assert: group allClasses size equals: 2.
	group remove: classA.
	self assert: group allClasses size equals: 1.
	group remove: classB.
	self assertEmpty: group allClasses
]

{ #category : #tests }
MooseModelTest >> testCacheInvalidationAfterRemove [
	| class |
	class := FamixTest3Class named: 'AClass'.
	group add: class.
	self assert: group allClasses size equals: 1.
	group remove: class.
	self assertEmpty: group allClasses
]

{ #category : #tests }
MooseModelTest >> testDifferenceWithRealCollection [
	"A MooseModel should only contains Moose entities."

	self
		should: [ group addAll: #(1 2 3).
			self assertCollection: (group difference: #(2)) hasSameElements: #(1 3) ]
		raise: Error
]

{ #category : #tests }
MooseModelTest >> testExportMetamodelTo [
	self denyEmpty: (String streamContents: [ :s | group exportMetamodelTo: s ])
]

{ #category : #tests }
MooseModelTest >> testIntersectionWithRealCollection [
	"A MooseModel should only contains Moose entities."

	self
		should: [ group addAll: #(1 2 3).
			group intersection: #(2 3 4) ]
		raise: Error
]

{ #category : #tests }
MooseModelTest >> testPrintOn [
	self assert: group printString equals: 'a MooseModel #noname(0)'.
	group name: 'hello'.
	self assert: group printString equals: 'a MooseModel #hello(0)'.
	group name: 'hello2'.
	group add: MooseEntity new.
	self assert: group printString equals: 'a MooseModel #hello2(1)'.
	self assert: self actualClass meta printString equals: 'a FMMetaRepository'
]

{ #category : #tests }
MooseModelTest >> testReferenceModel [
	| parentModel |
	parentModel := self actualClass with: group.
	self assert: group localMooseModel identicalTo: group.
	self assert: group mooseModel identicalTo: parentModel
]

{ #category : #tests }
MooseModelTest >> testRemoveAnnouncement [
	| entity announcedEntity |
	entity := MooseEntity new.
	group announcer when: MooseEntityRemoved do: [ :a | announcedEntity := a entity ].
	group add: entity.
	self assert: announcedEntity isNil.
	group remove: entity.
	self assert: announcedEntity identicalTo: entity
]

{ #category : #tests }
MooseModelTest >> testRemoveFromModel [
	| parentModel |
	parentModel := self actualClass with: group.
	self assert: group mooseModel identicalTo: parentModel.
	self assert: group removeFromModel identicalTo: group.
	self assertEmpty: parentModel
]

{ #category : #tests }
MooseModelTest >> testRemoveModelNamedFromRoot [
	"self debug: #testRemoveModelNamedFromRoot"

	| group2 parentModel res |
	group name: 'zork'.
	group2 := self actualClass new.
	group2 name: 'baz'.
	parentModel := self actualClass withAll: {group . group2}.
	self assert: group mooseModel identicalTo: parentModel.
	self assert: group2 mooseModel identicalTo: parentModel.
	self assert: parentModel size equals: 2.
	res := parentModel removeModelNamed: 'zork'.
	self assert: res name equals: #zork.
	self assert: res mooseModel isNil.
	self deny: (parentModel includes: res).
	self assert: parentModel size equals: 1
]

{ #category : #tests }
MooseModelTest >> testRenamedAnnouncement [
	| oldName |
	group announcer when: MooseEntityRenamed do: [ :a | oldName := a oldName ].
	group name: #somename.
	self assert: oldName equals: #noname.
	group name: #anothername.
	self assert: oldName equals: #somename
]

{ #category : #tests }
MooseModelTest >> testRootFolder [
	self assert: group rootFolder equals: Smalltalk imageDirectory asFileReference / 'src' / group name
]

{ #category : #tests }
MooseModelTest >> testRootModel [
	self assert: self actualClass new mooseID > 0
]

{ #category : #tests }
MooseModelTest >> testRootUniqueness [
	self assert: self actualClass root identicalTo: MooseModel root
]

{ #category : #tests }
MooseModelTest >> testUnionWithRealCollection [
	self
		should: [ group addAll: #(1 2 3).
			group union: #(2 3 4) ]
		raise: Error
]
