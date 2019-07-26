"
A FAMIXAbstractFileTest is a test class for testing the behavior of FAMIXAbstractFile
"
Class {
	#name : #FAMIXAbstractFileTest,
	#superclass : #FAMIXNamedEntityTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #testing }
FAMIXAbstractFileTest class >> isAbstract [
	^ self = FAMIXAbstractFileTest
]

{ #category : #tests }
FAMIXAbstractFileTest >> testFullNameDoesNotRaiseError [
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
FAMIXAbstractFileTest >> testIsRoot [
	| file |
	file := self actualClass new.
	self assert: file isRoot.
	file parentFolder: FAMIXFolder new.
	self deny: file isRoot
]
