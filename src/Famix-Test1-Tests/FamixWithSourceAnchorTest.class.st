Class {
	#name : #FamixWithSourceAnchorTest,
	#superclass : #FamixTest1SimpleModelTest,
	#category : #'Famix-Test1-Tests'
}

{ #category : #running }
FamixWithSourceAnchorTest >> setUp [
	super setUp.
	m3 sourceAnchor: nil.
	anchor2 source: 'abc\ab\a\ a  \ ab \abc\ab' withCRs
]

{ #category : #tests }
FamixWithSourceAnchorTest >> testAllSourceAnchors [
	self assertCollection: m1 allSourceAnchors hasSameElements: {anchor1}
]

{ #category : #tests }
FamixWithSourceAnchorTest >> testAllSourceAnchorsDo [
	| res multipleFileAnchor |
	multipleFileAnchor := FamixTest1MultipleFileAnchor model: model.
	1 to: 3 do: [ :each | multipleFileAnchor addFileAnchorWithPath: 'aFileName' , each asString ].

	m3 sourceAnchor: multipleFileAnchor.


	res := OrderedCollection new.
	m3 allSourceAnchorsDo: [ :each | res add: each ].

	self assert: res size equals: 3.
	res do: [ :each | self assert: each isFileAnchor ]
]

{ #category : #tests }
FamixWithSourceAnchorTest >> testAllSourceAnchorsWithMultipleFileAnchor [
	| multipleFileAnchor |
	self assertEmpty: m3 allSourceAnchors.

	multipleFileAnchor := FamixTest1MultipleFileAnchor model: model.
	1 to: 3 do: [ :each | multipleFileAnchor addFileAnchorWithPath: 'aFileName' , each asString ].

	m3 sourceAnchor: multipleFileAnchor.

	self assert: m3 allSourceAnchors size equals: 3
]

{ #category : #tests }
FamixWithSourceAnchorTest >> testHasSourceAnchor [

	self assert: m1 hasSourceAnchor.
	self deny: m3 hasSourceAnchor.
]

{ #category : #tests }
FamixWithSourceAnchorTest >> testNumberOfLinesOfCodeWithMoreThanOneCharacter [
	
	self assert: m1 numberOfLinesOfCodeWithMoreThanOneCharacter equals: 2.

	self assert: m2 numberOfLinesOfCodeWithMoreThanOneCharacter equals: 5.

	self assert: m3 numberOfLinesOfCodeWithMoreThanOneCharacter equals: 0.
	m3 sourceAnchor: anchor3.
	m3 resetPrivateState.
	self assert: m3 numberOfLinesOfCodeWithMoreThanOneCharacter equals: 4.

]

{ #category : #tests }
FamixWithSourceAnchorTest >> testSourceAnchor [

	self assert: m1 sourceAnchor equals: anchor1.
	
	self assert: m3 sourceAnchor isNil.
	m3 sourceAnchor: anchor3.
	self assert: m3 sourceAnchor equals: anchor3.

]

{ #category : #tests }
FamixWithSourceAnchorTest >> testSourceText [

	self assert: m3 sourceText equals: ''.
	self assert: m1 sourceText equals: 'method1\source1' withCRs.
	
]

{ #category : #tests }
FamixWithSourceAnchorTest >> testSourceTextForStub [

	self assert: m1 sourceText equals: 'method1\source1' withCRs.
	m1 isStub: true.
	self assert: m1 sourceText equals: ''.
	
	
]
