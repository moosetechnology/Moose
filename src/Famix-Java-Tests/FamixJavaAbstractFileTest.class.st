"
A FamixJavaAbstractFileTest is a test class for testing the behavior of FamixJavaAbstractFile
"
Class {
	#name : #FamixJavaAbstractFileTest,
	#superclass : #FamixJavaNamedEntityTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #'as yet unclassified' }
FamixJavaAbstractFileTest >> actualClass [ 
		^ FamixJavaAbstractFile
]

{ #category : #tests }
FamixJavaAbstractFileTest >> testFullNameDoesNotRaiseError [
	self
		shouldnt: [ self actualClass new
				mooseModel:
					(MooseModel new
						rootFolder: FileSystem memory root;
						yourself);
					name: 'test';
				fullName ]
		raise: Error
]

{ #category : #tests }
FamixJavaAbstractFileTest >> testIsRoot [
	| file |
	file := self actualClass new.
	self assert: file isRoot.
	file parentFolder: FamixJavaFolder new.
	self deny: file isRoot
]
