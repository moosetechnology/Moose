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
	| entity |
	entity := MooseEntity new.
	group add: entity.
	self assert: group entities size equals: 1.
	self assert: entity mooseModel identicalTo: group
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
	group add: FAMIXClass new.
	self assert: group allClasses size equals: 1
]

{ #category : #tests }
MooseModelTest >> testCacheInvalidationAfterMultipleAddRemove [
	| classA classB |
	classA := FAMIXClass new name: 'ClassA'.
	classB := FAMIXClass new name: 'ClassB'.
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
	class := FAMIXClass new name: 'AClass'.
	group add: class.
	self assert: group allClasses size equals: 1.
	group remove: class.
	self assertEmpty: group allClasses
]

{ #category : #tests }
MooseModelTest >> testCollect [
	group add: MooseEntity new.
	group add: MooseEntity new.
	group add: MooseEntity new.
	self assert: (group collect: #name) asArray equals: #(#noname #noname #noname)
]

{ #category : #tests }
MooseModelTest >> testDifference [
	| group2 el1 el2 el3 |
	group := MooseModel new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	group2 := MooseModel new.
	group2 add: MooseEntity new.
	self assert: (group difference: group2) entities asSet equals: group entities asSet.
	self assert: (group difference: MooseModel new) entities asSet equals: group entities asSet.
	self assert: (group difference: group) entities isEmpty.
	group2 add: el1.
	self assert: (group difference: group2) entities size equals: 2.
	self assert: ((group difference: group2) entities includesAll: {el2 . el3}).
	group add: el1.
	self assert: (group difference: group2) entities size equals: 2.
	self assert: ((group difference: group2) entities includesAll: {el2 . el3})
]

{ #category : #tests }
MooseModelTest >> testDoSeparatedBy [
	| t el1 el2 el3 |
	t := OrderedCollection new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	group do: [ :x | t add: x ] separatedBy: [ t add: 10 ].
	self assert: t asArray equals: {el1 . 10 . el2 . 10 . el3}
]

{ #category : #tests }
MooseModelTest >> testEnsureClassesAndNamespaces [
	| aMethod |
	group add: (aMethod := FAMIXMethod new).
	self assert: aMethod parentType isNil.
	self should: [ aMethod parentScope isNil ] raise: Error.


	group ensureClassesAndNamespaces.
	self deny: aMethod parentType isNil.
	self deny: aMethod parentScope isNil.

	self assert: aMethod parentType == group unknownFAMIXClass.
	self assert: aMethod parentScope == group unknownFAMIXNamespace
]

{ #category : #tests }
MooseModelTest >> testExport [
	| stream |
	stream := WriteStream on: String new.
	group exportTo: stream.
	self assert: stream contents equals: '()'.
	group add: (FAMIXClass new name: 'Foo').
	stream := WriteStream on: String new.
	group exportTo: stream.
	self
		assert: stream contents
		equals:
			'(
	(FAMIX.Class (id: 1)
		(name ''Foo'')))'
]

{ #category : #tests }
MooseModelTest >> testExportMetamodelTo [

	| stream |
	stream := WriteStream on: String new.
	self shouldnt: [group exportMetamodelTo: stream]  raise: Error.
	self deny: stream isEmpty
]

{ #category : #tests }
MooseModelTest >> testIntersect [
	| group2 el1 |
	group add: (el1 := MooseEntity new).
	group add: MooseEntity new.
	group add: MooseEntity new.
	group2 := MooseModel new.
	group2 add: MooseEntity new.
	group2 add: el1.
	self assert: (group intersection: MooseModel new) entities isEmpty.
	self assert: (group intersection: group2) entities asArray equals: {el1}.
	self assertEmpty: (MooseModel new intersection: MooseModel new) entities
]

{ #category : #tests }
MooseModelTest >> testPrintOn [
	self assert: group printString equals: 'a MooseModel #noname(0)'.
	group name: 'hello'.
	self assert: group printString equals: 'a MooseModel #hello(0)'.
	group name: 'hello2'.
	group add: MooseEntity new.
	self assert: group printString equals: 'a MooseModel #hello2(1)'.
	self assert: MooseModel meta printString equals: 'a FMMetaRepository'
]

{ #category : #tests }
MooseModelTest >> testReferenceModel [
	| parentModel |
	parentModel := MooseModel new.
	parentModel add: group.
	self assert: group localMooseModel identicalTo: group.
	self assert: group mooseModel identicalTo: parentModel
]

{ #category : #tests }
MooseModelTest >> testReject [
	| el1 el2 el3 v |
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	v := group reject: [ :el | el == el1 ].
	self assert: v size equals: 2.
	self assert: (v includesAll: {el2 . el3})
]

{ #category : #tests }
MooseModelTest >> testRemoveAll [
	| el1 el2 el3 |
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).

	group removeAll: {el1 . el2 . el3}.
	self assertEmpty: group
]

{ #category : #tests }
MooseModelTest >> testRemoveAll2 [
	| el1 el2 el3 |
	group add: (el1 := MooseEntity new).
	group add: el1.
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	group removeAll: {el1 . el2 . el3}.
	self denyEmpty: group.
	self assert: group entities asArray equals: {el1}
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
	parentModel := MooseModel new.
	parentModel add: group.
	self assert: group mooseModel identicalTo: parentModel.
	self assert: group removeFromModel identicalTo: group.
	self assertEmpty: parentModel entities
]

{ #category : #tests }
MooseModelTest >> testRemoveModelNamedFromRoot [
	"self debug: #testRemoveModelNamedFromRoot"

	| group2 parentModel res |
	group name: 'zork'.
	group2 := MooseModel new.
	group2 name: 'baz'.
	parentModel := MooseModel new.
	parentModel add: group.
	parentModel add: group2.
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
	self assert: MooseModel new mooseID > 0
]

{ #category : #tests }
MooseModelTest >> testRootUniqueness [
	self assert: MooseModel root identicalTo: MooseModel root
]

{ #category : #tests }
MooseModelTest >> testSelect [
	| el1 v |
	group add: (el1 := MooseEntity new).
	group add: MooseEntity new.
	group add: MooseEntity new.
	v := group select: [ :el | el == el1 ].
	self assert: v size equals: 1.
	self assert: v first identicalTo: el1
]

{ #category : #tests }
MooseModelTest >> testUnion [
	| group2 model3 el1 el2 el3 el4 |
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	group2 := MooseModel new.
	group2 add: (el4 := MooseEntity new).
	model3 := group union: group2.
	self assert: (model3 entities includesAll: {el1 . el2 . el3 . el4}).
	self assert: model3 entities size equals: 4.
	self assert: ((group2 union: group) entities includesAll: {el1 . el2 . el3 . el4}).
	self assert: (group2 union: group) ~= (group union: group2)
]

{ #category : #tests }
MooseModelTest >> testUnion2 [
	| group2 group3 el1 el2 el3 el4 |
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	group2 := MooseGroup new.
	group2 add: (el4 := MooseEntity new).
	group3 := group union: group2.
	self assert: (group3 entities includesAll: {el1 . el2 . el3 . el4}).
	self assert: group3 entities size equals: 4.
	self assert: ((group2 union: group) entities includesAll: {el1 . el2 . el3 . el4}).
	self assert: (group2 union: group) ~= (group union: group2)
]

{ #category : #tests }
MooseModelTest >> testUnknownFAMIXClass [
	self assert: (group unknownFAMIXClass isKindOf: FAMIXClass).
	self assert: group unknownFAMIXClass identicalTo: group unknownFAMIXClass.
	self assert: group unknownFAMIXClass isStub
]

{ #category : #tests }
MooseModelTest >> testUnknownFAMIXNamespace [
	self assert: (group unknownFAMIXNamespace isKindOf: FAMIXNamespace).
	self assert: group unknownFAMIXNamespace identicalTo: group unknownFAMIXNamespace.
	self assert: group unknownFAMIXNamespace isStub
]

{ #category : #tests }
MooseModelTest >> testUnknownProperty [
	self assert: (group propertyNamed: #UNKNOWN) isNil.
	group propertyNamed: 'UNKNOWN' put: 10.
	self assert: (group propertyNamed: #UNKNOWN) equals: 10
]
