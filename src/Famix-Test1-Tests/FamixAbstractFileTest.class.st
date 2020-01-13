Class {
	#name : #FamixAbstractFileTest,
	#superclass : #TestCase,
	#category : #'Famix-Test1-Tests-Files'
}

{ #category : #testing }
FamixAbstractFileTest class >> isAbstract [
	^ self = FamixAbstractFileTest
]

{ #category : #testing }
FamixAbstractFileTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helpers }
FamixAbstractFileTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #tests }
FamixAbstractFileTest >> testFullNameDoesNotRaiseError [
	self
		shouldnt: [ self actualClass new
				mooseModel:
					(FamixTest1Model new
						rootFolder: FileSystem memory root;
						yourself);
				name: 'test';
				fullName ]
		raise: Error
]

{ #category : #tests }
FamixAbstractFileTest >> testIsRoot [
	| file |
	file := self actualClass new.
	self assert: file isRoot.
	file parentFolder: FamixTest1Folder new.
	self deny: file isRoot
]
