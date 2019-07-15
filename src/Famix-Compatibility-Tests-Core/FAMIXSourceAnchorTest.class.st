Class {
	#name : #FAMIXSourceAnchorTest,
	#superclass : #FAMIXEntityTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #testing }
FAMIXSourceAnchorTest class >> isAbstract [
	^ self = FAMIXSourceAnchorTest
]

{ #category : #tests }
FAMIXSourceAnchorTest >> testImportFileAnchors [
	| model aMethod |
	MooseModel resetMeta.
	model := MooseModel new.
	model
		importFromMSEStream:
			'(		
		(FAMIX.Class (id: 1) (name ''AClass'') (sourceAnchor (ref: 3)))
		(FAMIX.Method (id: 2) (name ''aMethod'') (parentType (ref: 1)) (sourceAnchor (ref: 4)))
		(FAMIX.FileAnchor (id: 3) (element (ref: 1)) (fileName ''afile''))
		(FAMIX.FileAnchor (id: 4) (element (ref: 2)) (fileName ''afile'') (startLine 3) (endLine 30))
	)' readStream.
	self assert: model entities size equals: 4.
	self assert: model allClasses first sourceAnchor notNil.
	self assert: model allClasses first sourceAnchor mooseModel == model.
	self assert: (model allClasses first sourceAnchor isKindOf: FAMIXSourceAnchor).
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
FAMIXSourceAnchorTest >> testIsMultiple [
	^ self deny: self actualClass new isMultiple
]
