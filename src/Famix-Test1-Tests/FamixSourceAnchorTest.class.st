Class {
	#name : #FamixSourceAnchorTest,
	#superclass : #TestCase,
	#category : #'Famix-Test1-Tests-SourceAnchor'
}

{ #category : #testing }
FamixSourceAnchorTest class >> isAbstract [
	^ self = FamixSourceAnchorTest
]

{ #category : #testing }
FamixSourceAnchorTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helpers }
FamixSourceAnchorTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #tests }
FamixSourceAnchorTest >> testEntity [
	| anchor m1 m2 |
	anchor := self actualClass new.
	m1 := FamixTest1Method named: 'method1'.
	m2 := FamixTest1Method named: 'method2'.

	anchor element: m1.
	self assert: anchor element equals: m1.
	self assert: m1 sourceAnchor equals: anchor.

	anchor element: m2.
	self assert: anchor element equals: m2.
	self assert: m2 sourceAnchor equals: anchor
]

{ #category : #tests }
FamixSourceAnchorTest >> testImportFileAnchors [
	| model aMethod |
	model := FamixTest1Model new.
	model
		importFromMSEStream:
			'(		
		(Famix-Test1-Entities.Class (id: 1) (name ''AClass'') (sourceAnchor (ref: 3)))
		(Famix-Test1-Entities.Method (id: 2) (name ''aMethod'') (parentType (ref: 1)) (sourceAnchor (ref: 4)))
		(Famix-Test1-Entities.FileAnchor (id: 3) (element (ref: 1)) (fileName ''afile''))
		(Famix-Test1-Entities.FileAnchor (id: 4) (element (ref: 2)) (fileName ''afile'') (startLine 3) (endLine 30))
	)' readStream.
	self assert: model entities size equals: 4.
	self assert: model allClasses first sourceAnchor notNil.
	self assert: model allClasses first sourceAnchor mooseModel identicalTo: model.
	self assert: (model allClasses first sourceAnchor isKindOf: FamixTest1SourceAnchor).
	self assert: model allClasses first sourceAnchor fileName equals: 'afile'.
	aMethod := model allMethods first.
	self assert: aMethod hasSourceAnchor.
	self assert: aMethod sourceAnchor notNil.
	self assert: aMethod sourceAnchor fileName equals: 'afile'.
	self assert: aMethod sourceAnchor startLine equals: 3.
	self assert: aMethod sourceAnchor endLine equals: 30.
	self assert: aMethod sourceAnchor completeText isEmpty.
	self assert: aMethod sourceText isEmpty.
	self assert: aMethod sourceAnchor lineCount equals: 28.
	self deny: aMethod sourceAnchor hasSourceText.
	self assert: aMethod numberOfLinesOfCode equals: 28.
	self shouldnt: [ model allMethods collect: #numberOfLinesOfCode ] raise: Error.
	self shouldnt: [ model allClasses collect: #numberOfLinesOfCode ] raise: Error
]

{ #category : #tests }
FamixSourceAnchorTest >> testIsMultiple [
	^ self deny: self actualClass new isMultiple
]

{ #category : #tests }
FamixSourceAnchorTest >> testLineCount [
	self assert: self actualClass new lineCount equals: self actualClass new notExistentMetricValue
]

{ #category : #tests }
FamixSourceAnchorTest >> testSourceText [
	"source text is empty by default"

	self assert: self actualClass new sourceText isNil
]
