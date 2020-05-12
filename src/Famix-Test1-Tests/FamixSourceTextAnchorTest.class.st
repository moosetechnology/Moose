Class {
	#name : #FamixSourceTextAnchorTest,
	#superclass : #FamixSourceAnchorTest,
	#category : #'Famix-Test1-Tests-SourceAnchor'
}

{ #category : #helpers }
FamixSourceTextAnchorTest >> actualClass [
	^ FamixTest1SourceTextAnchor
]

{ #category : #tests }
FamixSourceTextAnchorTest >> testHasSource [
	self deny: self actualClass new hasSource.
	self deny: (self actualClass source: '') hasSource.
	self assert: (self actualClass source: 'source') hasSource
]
