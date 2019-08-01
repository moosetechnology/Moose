Class {
	#name : #FamixStSourceAnchorTest,
	#superclass : #FamixStEntityTest,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #helpers }
FamixStSourceAnchorTest >> actualClass [ 
		^ FamixStSourceAnchor
]

{ #category : #tests }
FamixStSourceAnchorTest >> testImportFileAnchors [
	| model aMethod |
	MooseModel resetMeta.
	model := FamixStMooseModel 
		importFromMSEStream:
			'(		
		(Famix-PharoSmalltalk-Entities.Class (id: 1) (name ''AClass'') (sourceAnchor (ref: 3)))
		(Famix-PharoSmalltalk-Entities.Method (id: 2) (name ''aMethod'') (parentType (ref: 1)) (sourceAnchor (ref: 4)))
		(Famix-PharoSmalltalk-Entities.SourceTextAnchor (id: 3) (element (ref: 1)) )  
		(Famix-PharoSmalltalk-Entities.SourceTextAnchor (id: 4) (element (ref: 2)) (source ''''))
	)' readStream.
	self assert: model entities size equals: 4.
	self assert: model allClasses first sourceAnchor notNil.
	self assert: model allClasses first sourceAnchor mooseModel == model.
	"self assert: (model allClasses first sourceAnchor isKindOf: FamixStFileAnchor)."
	aMethod := model allMethods first.
	self assert: aMethod hasSourceAnchor.
	self assert: aMethod sourceAnchor notNil.
	
	self assert: aMethod sourceText isEmpty.
	self shouldnt: [ model allMethods collect: #numberOfLinesOfCode ] raise: Error.
	self shouldnt: [ model allClasses collect: #numberOfLinesOfCode ] raise: Error
]
