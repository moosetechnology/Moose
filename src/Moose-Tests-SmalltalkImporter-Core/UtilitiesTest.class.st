Class {
	#name : #UtilitiesTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-SmalltalkImporter-Core'
}

{ #category : #tests }
UtilitiesTest >> testDemoosifyGlobal [
	| myGlobal |
	myGlobal := 'XXX'.
	self assert: (FAMIXNameResolver demoosifyGlobal: (FAMIXNameResolver moosifyGlobal: myGlobal)) equals: myGlobal
]

{ #category : #tests }
UtilitiesTest >> testExtractCategoryNameFromMoose [
	"(self selector: #testExtractCategoryNameFromMoose) debug"

	self
		assert:
			(FAMIXNameResolver extractCategoryNameFromMoose: (FAMIXNameResolver browserCategoryToSourceAnchor: 'accessing'))
		equals: 'accessing'
]

{ #category : #tests }
UtilitiesTest >> testExtractMethodSelectorFromMoose [
	"(self selector: #testExtractMethodSelectorFromMoose) run"

	self assert: (FAMIXNameResolver extractMethodSelectorFromMoose: #'accept:node:()') equals: 'accept:node:'.
	self assert: (FAMIXNameResolver extractMethodSelectorFromMoose: #'accept()') equals: 'accept'
]

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
UtilitiesTest >> testFamixNameFromFamixFullName [
	self assert: (FAMIXNameResolver famixNameFromFamixFullName: #Smalltalk::LANNode) equals: #LANNode.
	self
		assert: (FAMIXNameResolver famixNameFromFamixFullName: #'Smalltalk::LANNode.printOn:(Object)')
		equals: #'LANNode.printOn:(Object)'
]

{ #category : #tests }
UtilitiesTest >> testFamixNamespaceNameFromFamixFullName [
	self assert: (FAMIXNameResolver famixNamespaceNameFromFamixFullName: #Smalltalk::Node) equals: #Smalltalk.
	self
		assert: (FAMIXNameResolver famixNamespaceNameFromFamixFullName: #'Smalltalk::Node.printOn:(Object)')
		equals: #Smalltalk
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
UtilitiesTest >> testIsVariableAClass [
	"self run: #testIsVariableAClass"
	"self debug: #testIsVariableAClass"
	
	self assert: (FAMIXNameResolver isVariableAClass: self class name).
	self deny: (FAMIXNameResolver isVariableAClass: #Transcript)
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

{ #category : #tests }
UtilitiesTest >> testSmalltalkClassFromFamixClassName [
	"self debug: #testSmalltalkClassFromFamixClassName"

	self assert: (FAMIXNameResolver smalltalkClassFromFamixClassName: 'Smalltalk::Point') equals: Point.
	self assert: (FAMIXNameResolver smalltalkClassFromFamixClassName: 'Smalltalk::Point_class') equals: Point class.
	self assert: (FAMIXNameResolver smalltalkClassFromFamixClassName: Point mooseName) equals: Point.
	self assert: (FAMIXNameResolver smalltalkClassFromFamixClassName: Point class mooseName) equals: Point class
]

{ #category : #tests }
UtilitiesTest >> testSmalltalkClassNameFromFamixClassName [
	"self debug: #testSmalltalkClassNameFromFamixClassName"

	self assert: (FAMIXNameResolver smalltalkClassNameFromFamixClassName: self class name) equals: self class name.
	self
		assert: (FAMIXNameResolver soleClassNameFromFamixName: self class class mooseName)
		equals: self class absoluteName asSymbol.
	self
		assert: (FAMIXNameResolver soleClassNameFromFamixName: self class mooseName)
		equals: self class absoluteName asSymbol.
	self
		assert: (FAMIXNameResolver smalltalkClassNameFromFamixClassName: self class name , FAMIXNameResolver metaclassTag)
		equals: self class class name asSymbol.
	self
		assert: (FAMIXNameResolver smalltalkClassNameFromFamixClassName: self class class mooseName)
		equals: self class class absoluteName asSymbol
]

{ #category : #tests }
UtilitiesTest >> testisVariableAGlobal [
	"self run: #testisVariableAGlobal"
	"self debug: #testisVariableAGlobal"
	
	self assert: (FAMIXNameResolver isVariableAGlobal: 'Transcript').
	self assert: (FAMIXNameResolver isVariableAGlobal: 'Smalltalk').
	self deny: (FAMIXNameResolver isVariableAGlobal: 'Object')
]
