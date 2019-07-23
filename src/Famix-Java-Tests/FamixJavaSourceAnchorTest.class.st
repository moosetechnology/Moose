Class {
	#name : #FamixJavaSourceAnchorTest,
	#superclass : #FamixJavaEntityTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #testing }
FamixJavaSourceAnchorTest class >> isAbstract [
	^ self = FamixJavaSourceAnchorTest
]

{ #category : #helpers }
FamixJavaSourceAnchorTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #tests }
FamixJavaSourceAnchorTest >> testImportFileAnchors [
	| model aMethod |
	MooseModel resetMeta.
	model := FamixJavaMooseModel 
		importFromMSEStream:
			'(		
		(Famix-Java-Entities.Class (id: 1) (name ''AClass'') (sourceAnchor (ref: 3)))
		(Famix-Java-Entities.Method (id: 2) (name ''aMethod'') (parentType (ref: 1)) (sourceAnchor (ref: 4)))
		(Famix-Java-Entities.FileAnchor (id: 3) (element (ref: 1)) (fileName ''afile''))  
		(Famix-Java-Entities.FileAnchor (id: 4) (element (ref: 2)) (fileName ''afile'') (startLine 3) (endLine 30))
	)' readStream.
	self assert: model entities size equals: 4.
	self assert: model allClasses first sourceAnchor notNil.
	self assert: model allClasses first sourceAnchor mooseModel == model.
	self assert: (model allClasses first sourceAnchor isKindOf: FamixJavaFileAnchor).
	aMethod := model allMethods first.
	self assert: aMethod hasSourceAnchor.
	self assert: aMethod sourceAnchor notNil.
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
FamixJavaSourceAnchorTest >> testIsMultiple [
	^ self deny: self actualClass new isMultiple
]
