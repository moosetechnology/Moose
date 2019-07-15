"
Just a test about mooseModel root and so on.
"
Class {
	#name : #MooseModelTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Moose-Tests-Core'
}

{ #category : #running }
MooseModelTest >> setUp [
	super setUp.
	model := MooseModel new.
]

{ #category : #tests }
MooseModelTest >> testAdd [
	| entity |
	entity := MooseEntity new.
	model add: entity.
	self assert: model entities size equals: 1.
	self assert: entity mooseModel == model
]

{ #category : #tests }
MooseModelTest >> testAddAnnouncement [
	| entity announcedEntity |
	entity := MooseEntity new.
	announcedEntity := nil.
	model announcer 
		when: MooseEntityAdded do: [:a | announcedEntity := a entity ].

	model add: entity.
	self assert: announcedEntity == entity.
]

{ #category : #tests }
MooseModelTest >> testAllBookmarks [
	| entity1 entity2 entity3 |
	entity1 := MooseEntity new.
	entity2 := MooseEntity new.
	entity3 := MooseEntity new.
	model add: entity1.
	model add: entity2.
	model add: entity3.
	entity1 bookmarkAs: 'one'.
	entity2 bookmarkAs: 'two'.
	self assert: model allBookmarks size equals: 2
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
	model add: entity1.
	announcedEntity := nil.
	model announcer 
		when: MooseEntityAdded do: [:a | announcedEntity := a entity ].
	
	entity1 bookmarkAs: 'one'.
	self assert: announcedEntity notNil.
]

{ #category : #tests }
MooseModelTest >> testCacheInvalidationAfterAdd [

	self assert: model allClasses isEmpty.
	model add: FAMIXClass new.
	self assert: model allClasses size equals: 1
]

{ #category : #tests }
MooseModelTest >> testCacheInvalidationAfterMultipleAddRemove [
	| classA classB |
	classA := FAMIXClass new name: 'ClassA'.
	classB := FAMIXClass new name: 'ClassB'.
	model add: classA.
	self assert: model allClasses size equals: 1.
	model add: classB.
	self assert: model allClasses size equals: 2.
	model remove: classA.
	self assert: model allClasses size equals: 1.
	model add: classA.
	self assert: model allClasses size equals: 2.
	model remove: classA.
	self assert: model allClasses size equals: 1.
	model remove: classB.
	self assert: model allClasses isEmpty
]

{ #category : #tests }
MooseModelTest >> testCacheInvalidationAfterRemove [
	| class |
	class := FAMIXClass new name: 'AClass'.
	model add: class.
	self assert: model allClasses size equals: 1.
	model remove: class.
	self assert: model allClasses isEmpty
]

{ #category : #tests }
MooseModelTest >> testCollect [
	| t group el1 el2 el3 |
	t := OrderedCollection new.
	group := MooseModel new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	self assert: (group collect: #name) asArray equals: #(#noname #noname #noname)
]

{ #category : #tests }
MooseModelTest >> testDifference [
	| t model1 model2 el1 el2 el3 el4 |
	t := OrderedCollection new.
	model1 := MooseModel new.
	model1 add: (el1 := MooseEntity new).
	model1 add: (el2 := MooseEntity new).
	model1 add: (el3 := MooseEntity new).
	model2 := MooseModel new.
	model2 add: (el4 := MooseEntity new).
	self assert: (model1 difference: model2) entities asSet equals: model1 entities asSet.
	self assert: (model1 difference: MooseModel new) entities asSet equals: model1 entities asSet.
	self assert: (model1 difference: model1) entities isEmpty.
	model2 add: el1.
	self assert: (model1 difference: model2) entities size equals: 2.
	self
		assert:
			((model1 difference: model2) entities
				includesAll:
					{el2.
					el3}).
	model1 add: el1.
	self assert: (model1 difference: model2) entities size equals: 2.
	self
		assert:
			((model1 difference: model2) entities
				includesAll:
					{el2.
					el3})
]

{ #category : #tests }
MooseModelTest >> testDoSeparatedBy [
	| t group el1 el2 el3 |
	t := OrderedCollection new.
	group := MooseModel new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	group do: [ :x | t add: x ] separatedBy: [ t add: 10 ].
	self
		assert: t asArray
		equals:
			{el1.
			10.
			el2.
			10.
			el3}
]

{ #category : #tests }
MooseModelTest >> testEnsureClassesAndNamespaces [
	| aMethod |

	model add: (aMethod := FAMIXMethod new).
	self assert: (aMethod parentType isNil).
	self should: [(aMethod parentScope isNil)] raise: Error.


	model ensureClassesAndNamespaces.
	self deny: (aMethod parentType isNil).
	self deny: (aMethod parentScope isNil).

	self assert: (aMethod parentType == model unknownFAMIXClass).
	self assert: (aMethod parentScope == model unknownFAMIXNamespace).

]

{ #category : #tests }
MooseModelTest >> testExport [
	| stream |
	stream := WriteStream on: String new.
	MooseModel export: model to: stream.
	self assert: stream contents equals: '()'.
	model add: (FAMIXClass new name: 'Foo').
	stream := WriteStream on: String new.
	MooseModel export: model to: stream.
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
	self shouldnt: [MooseModel exportMetamodelTo: stream]  raise: Error.
	self deny: stream isEmpty
]

{ #category : #tests }
MooseModelTest >> testIntersect [
	| model1 model2 el1 el2 el3 el4 |
	model1 := MooseModel new.
	model1 add: (el1 := MooseEntity new).
	model1 add: (el2 := MooseEntity new).
	model1 add: (el3 := MooseEntity new).
	model2 := MooseModel new.
	model2 add: (el4 := MooseEntity new).
	model2 add: el1.
	self assert: (model1 intersection: MooseModel new) entities isEmpty.
	self assert: (model1 intersection: model2) entities asArray equals: {el1}.
	self assert: (MooseModel new intersection: MooseModel new) entities isEmpty
]

{ #category : #tests }
MooseModelTest >> testPrintOn [
	| model |
	model := MooseModel new.
	self assert: model printString equals: 'a MooseModel #noname(0)'.
	model := MooseModel new.
	model name: 'hello'.
	self assert: model printString equals: 'a MooseModel #hello(0)'.
	model := MooseModel new.
	model name: 'hello2'.
	model add: MooseEntity new.
	self assert: model printString equals: 'a MooseModel #hello2(1)'.
	self assert: MooseModel meta printString equals: 'a FMMetaRepository'
]

{ #category : #tests }
MooseModelTest >> testReferenceModel [
	
	| model parentModel |
"	self assert: MooseModel root mooseModel isNil."
	model := MooseModel new.
	parentModel := MooseModel new.
	parentModel add: model.
	self assert: model localMooseModel == model.
	self assert: model mooseModel == parentModel
]

{ #category : #tests }
MooseModelTest >> testReject [
	| t group el1 el2 el3 v |
	t := OrderedCollection new.
	group := MooseModel new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	v := group reject: [ :el | el == el1 ].
	self assert: v size equals: 2.
	self
		assert:
			(v
				includesAll:
					{el2.
					el3})
]

{ #category : #tests }
MooseModelTest >> testRemoveAll [

	| group el1 el2 el3 |
	group := MooseModel new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).

	group removeAll: {el1 . el2 . el3}.
	self assert: group isEmpty
]

{ #category : #tests }
MooseModelTest >> testRemoveAll2 [
	| group el1 el2 el3 |
	group := MooseModel new.
	group add: (el1 := MooseEntity new).
	group add: el1.
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	group
		removeAll:
			{el1.
			el2.
			el3}.
	self deny: group isEmpty.
	self assert: group entities asArray equals: {el1}
]

{ #category : #tests }
MooseModelTest >> testRemoveAnnouncement [
	| entity announcedEntity |
	entity := MooseEntity new.
	announcedEntity := nil.
	model announcer when: MooseEntityRemoved do: [:a | 
		announcedEntity := a entity ].
	model add: entity.
	self assert: announcedEntity isNil.
	model remove: entity.
	self assert: announcedEntity == entity.
]

{ #category : #tests }
MooseModelTest >> testRemoveFromModel [
	
	| model parentModel |
	model := MooseModel new.
	parentModel := MooseModel new.
	parentModel add: model.
	self assert: model mooseModel == parentModel.
	self assert: model removeFromModel == model.
	self assert: parentModel entities isEmpty.

]

{ #category : #tests }
MooseModelTest >> testRemoveModelNamedFromRoot [
	"self debug: #testRemoveModelNamedFromRoot"

	| model1 model2 parentModel res |
	model1 := MooseModel new.
	model1 name: 'zork'.
	model2 := MooseModel new.
	model2 name: 'baz'.
	parentModel := MooseModel new.
	parentModel add: model1.
	parentModel add: model2.
	self assert: model1 mooseModel == parentModel.
	self assert: model2 mooseModel == parentModel.
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
	model announcer when: MooseEntityRenamed do: [ :a | oldName := a oldName ].
	model name: #somename.
	self assert: oldName equals: #noname.
	model name: #anothername.
	self assert: oldName equals: #somename
]

{ #category : #tests }
MooseModelTest >> testRootFolder [

	model := MooseModel new.
	self assert: model rootFolder equals: (Smalltalk imageDirectory asFileReference / 'src' / (model name) ).
	
]

{ #category : #tests }
MooseModelTest >> testRootModel [
	
	self assert: MooseModel new mooseID  > 0
]

{ #category : #tests }
MooseModelTest >> testRootUniqueness [
	self assert: MooseModel root == MooseModel root
]

{ #category : #tests }
MooseModelTest >> testSelect [
	| t group el1 el2 el3 v |
	t := OrderedCollection new.
	group := MooseModel new.
	group add: (el1 := MooseEntity new).
	group add: (el2 := MooseEntity new).
	group add: (el3 := MooseEntity new).
	v := group select: [ :el | el == el1 ].
	self assert: v size equals: 1.
	self assert: v first == el1
]

{ #category : #tests }
MooseModelTest >> testUnion [
	| model1 model2 model3 el1 el2 el3 el4 |
	model1 := MooseModel new.
	model1 add: (el1 := MooseEntity new).
	model1 add: (el2 := MooseEntity new).
	model1 add: (el3 := MooseEntity new).
	model2 := MooseModel new.
	model2 add: (el4 := MooseEntity new).
	model3 := model1 union: model2.
	self
		assert:
			(model3 entities
				includesAll:
					{el1.
					el2.
					el3.
					el4}).
	self assert: model3 entities size equals: 4.
	self
		assert:
			((model2 union: model1) entities
				includesAll:
					{el1.
					el2.
					el3.
					el4}).
	self assert: (model2 union: model1) ~= (model1 union: model2)
]

{ #category : #tests }
MooseModelTest >> testUnion2 [
	| model1 group2 group3 el1 el2 el3 el4 |
	model1 := MooseModel new.
	model1 add: (el1 := MooseEntity new).
	model1 add: (el2 := MooseEntity new).
	model1 add: (el3 := MooseEntity new).
	group2 := MooseGroup new.
	group2 add: (el4 := MooseEntity new).
	group3 := model1 union: group2.
	self
		assert:
			(group3 entities
				includesAll:
					{el1.
					el2.
					el3.
					el4}).
	self assert: group3 entities size equals: 4.
	self
		assert:
			((group2 union: model1) entities
				includesAll:
					{el1.
					el2.
					el3.
					el4}).
	self assert: (group2 union: model1) ~= (model1 union: group2)
]

{ #category : #tests }
MooseModelTest >> testUnknownFAMIXClass [
	self assert: (model unknownFAMIXClass isKindOf: FAMIXClass).
	self assert: (model unknownFAMIXClass == model unknownFAMIXClass).
	self assert: (model unknownFAMIXClass isStub)
]

{ #category : #tests }
MooseModelTest >> testUnknownFAMIXNamespace [
	self assert: (model unknownFAMIXNamespace isKindOf: FAMIXNamespace).
	self assert: (model unknownFAMIXNamespace == model unknownFAMIXNamespace).
	self assert: (model unknownFAMIXNamespace isStub)
]

{ #category : #tests }
MooseModelTest >> testUnknownProperty [
	| model |
	model := MooseModel new.
	self assert: (model propertyNamed: #UNKNOWN) isNil.
	model propertyNamed: 'UNKNOWN' put: 10.
	self assert: (model propertyNamed: #UNKNOWN) equals: 10
]
