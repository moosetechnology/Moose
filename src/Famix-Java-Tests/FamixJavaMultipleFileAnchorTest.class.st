"
A FamixJavaMultipleFileAnchorTest is a test class for testing the behavior of FamixJavaMultipleFileAnchor
"
Class {
	#name : #FamixJavaMultipleFileAnchorTest,
	#superclass : #FamixJavaSourceAnchorTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #helpers }
FamixJavaMultipleFileAnchorTest >> actualClass [
	^ FamixJavaMultipleFileAnchor
]

{ #category : #tests }
FamixJavaMultipleFileAnchorTest >> testContainerFiles [
	| anchor file1 file2 |
	anchor := self actualClass new
		addSourceAnchor:
			(FamixJavaFileAnchor new
				correspondingFile:
					(file1 := FamixJavaFile new
						name: 'test';
						yourself);
				yourself);
		addSourceAnchor:
			(FamixJavaFileAnchor new
				correspondingFile:
					(file2 := FamixJavaFile new
						name: 'test2';
						yourself);
				yourself);
		yourself.
	self assert: anchor containerFiles size equals: 2.
	(anchor containerFiles collect: #name) do: [ :fileName | self assert: (#('test' 'test2') includes: fileName) ]
]

{ #category : #tests }
FamixJavaMultipleFileAnchorTest >> testContainerFilesWithoutFileReferenced [
	"This test was added because before if a multiple source anchor does not have the corresponding files we got array of nils"

	| anchor |
	anchor := self actualClass new
		addSourceAnchor: FamixJavaFileAnchor new;
		addSourceAnchor: FamixJavaFileAnchor new;
		yourself.
	self assert: anchor containerFiles size equals: 0
]

{ #category : #tests }
FamixJavaMultipleFileAnchorTest >> testIsMultiple [
	^ self assert: self actualClass new isMultiple
]
