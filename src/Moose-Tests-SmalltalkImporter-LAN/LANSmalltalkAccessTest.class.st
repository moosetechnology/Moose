Class {
	#name : #LANSmalltalkAccessTest,
	#superclass : #MooseTestWithSmalltalkDependency,
	#category : #'Moose-Tests-SmalltalkImporter-LAN'
}

{ #category : #tests }
LANSmalltalkAccessTest >> testWhenDistinguishingClassAndMetaclassAccessWorks [
	"self debug: #testWhenDistinguishingClassAndMetaclassAccessWorks"

	"this test tests that we can access smalltalk class and compiledMethod from famix when the class and metaclasses are not merged"

	| model |
	model := MooseModel new.
	self newPharoImporterTask
		importerClass: SmalltalkImporter;
		model: model;
		addFromPackageNamed: #'Moose-TestResources-LAN';
		run;
		yourself.
	self assert: (model entityNamed: LANNode mooseName) smalltalkClass equals: LANNode.
	self assert: (model entityNamed: LANNode class mooseName) smalltalkClass equals: LANNode class.
	self assert: (model entityNamed: LANNode mooseName) isInstanceSide.
	self deny: (model entityNamed: LANNode class mooseName) isInstanceSide.
	self assert: (model entityNamed: (LANNode >> #accept:) mooseName) compiledMethod equals: LANNode >> #accept:.
	self assert: (model entityNamed: (LANNode class >> #new) mooseName) compiledMethod equals: LANNode class >> #new.
	self deny: (model entityNamed: (LANNode >> #accept:) mooseName) isClassSide.
	self assert: (model entityNamed: (LANNode class >> #new) mooseName) isClassSide.
	self assert: (model entityNamed: (LANNode >> #accept:) mooseName) smalltalkClass equals: LANNode.
	self assert: (model entityNamed: (LANNode class >> #new) mooseName) smalltalkClass equals: LANNode class
]

{ #category : #tests }
LANSmalltalkAccessTest >> testWhenMergingClassAndMetaclassAccessWorks [
	"self debug: #testWhenMergingClassAndMetaclassAccessWorks"

	"this test tests that we can access smalltalk class and compiledMethod from famix when the class and metaclasses are  merged"

	| model importer |
	model := MooseModel new.
	importer := self newPharoImporterTask.
	importer importerClass: SmalltalkImporter.
	importer importingContext mergeClassAndMetaclass.
	importer model: model.
	importer addFromPackageNamed: #'Moose-TestResources-LAN'.
	importer run.
	self assert: (model entityNamed: LANNode mooseName) smalltalkClass equals: LANNode.
	self assert: (model entityNamed: (LANNode >> #accept:) mooseName) compiledMethod equals: LANNode >> #accept:.
	self assert: (model entityNamed: LANNode mooseName) isInstanceSide.
	self deny: (model entityNamed: (LANNode >> #accept:) mooseName) isClassSide.
	self assert: (model entityNamed: #'Smalltalk::LANNode.new()') isClassSide.
	self assert: (model entityNamed: (LANNode >> #accept:) mooseName) smalltalkClass equals: LANNode.
	self assert: (model entityNamed: #'Smalltalk::LANNode.new()') smalltalkClass equals: LANNode class.
	self assert: (model entityNamed: #'Smalltalk::LANNode.new()') compiledMethod equals: LANNode class >> #new
]
