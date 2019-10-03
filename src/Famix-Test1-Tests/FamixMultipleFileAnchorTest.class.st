Class {
	#name : #FamixMultipleFileAnchorTest,
	#superclass : #FamixSourceAnchorTest,
	#category : #'Famix-Test1-Tests-SourceAnchor'
}

{ #category : #helpers }
FamixMultipleFileAnchorTest >> actualClass [
	^ FamixTest1MultipleFileAnchor
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testContainerFiles [
	| anchor |
	anchor := self actualClass new
		addSourceAnchor:
			(FamixTest1FileAnchor new
				correspondingFile:
					(FamixTest1File new
						name: 'test';
						yourself);
				yourself);
		addSourceAnchor:
			(FamixTest1FileAnchor new
				correspondingFile:
					(FamixTest1File new
						name: 'test2';
						yourself);
				yourself);
		yourself.
	self assert: anchor containerFiles size equals: 2.
	(anchor containerFiles collect: #name) do: [ :fileName | self assert: (#('test' 'test2') includes: fileName) ]
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testContainerFilesWithoutFileReferenced [
	"This test was added because before if a multiple source anchor does not have the corresponding files we got array of nils"

	| anchor |
	anchor := self actualClass new
		addSourceAnchor: FamixTest1FileAnchor new;
		addSourceAnchor: FamixTest1FileAnchor new;
		yourself.
	self assertEmpty: anchor containerFiles
]

{ #category : #tests }
FamixMultipleFileAnchorTest >> testIsMultiple [
	^ self assert: self actualClass new isMultiple
]
