Class {
	#name : #UtilitiesTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #tests }
UtilitiesTest >> testFamixFullClassNameForSmalltalkClass [
	"self run: #testFamixFullClassNameForSmalltalkClass"

	"self debug: #testFamixFullClassNameForSmalltalkClass"

	self assert: self class name equals: (FAMIXNameResolver moosify: self class name) asSymbol.
	self
		assert: self class class mooseName
		equals: ('Smalltalk::' , (FAMIXNameResolver moosify: self class name) , MooseUtilities metaclassTag) asSymbol
]

{ #category : #tests }
UtilitiesTest >> testFindClassNamedOrNil [
	"(self selector: #testFindClassNamedOrNil) run"

	self assert: (FAMIXNameResolver findClassNamedOrNilFromFullName: Model name) equals: Model.	"self
		assert:
			(MSEUtilities
				findClassNamedOrNilFromFullName: Model fullName asSymbol) =
					Model."
	self
		assert:
			(FAMIXNameResolver findClassNamedOrNilFromFullName: (FAMIXNameResolver name , FAMIXNameResolver metaclassTag) asSymbol)
				isNil
]

{ #category : #tests }
UtilitiesTest >> testGroupedBy [
	| res |
	res := #(1 2 3 4 5) groupedBy: [ :each | each odd ].
	self assert: (res at: true) equals: #(1 3 5).
	self assert: (res at: false) equals: #(2 4)
]

{ #category : #tests }
UtilitiesTest >> testMooseName [
	"self debug: #testMooseName"

	self assert: LANNode mooseName equals: #Smalltalk::LANNode.
	self assert: Smalltalk mooseName equals: #Smalltalk.
	self assert: 'Smalltalk::LANNode' mooseName equals: #Smalltalk::LANNode.
	self assert: LANNode class mooseName equals: #Smalltalk::LANNode_class	"we could also  test here that all the famix entities  understand mooseName but for that we should create model so
	this is done in LANTest "
]
