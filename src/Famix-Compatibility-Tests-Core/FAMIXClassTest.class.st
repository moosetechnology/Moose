Class {
	#name : #FAMIXClassTest,
	#superclass : #FAMIXTypeTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXClassTest >> actualClass [
	^ FAMIXClass
]

{ #category : #tests }
FAMIXClassTest >> testIsAbstract [
	| entity |
	entity := self actualClass new.
	entity isAbstract: true.
	self assert: entity isAbstract
]

{ #category : #tests }
FAMIXClassTest >> testIsFinal [
	| entity |
	entity :=self actualClass new.
	entity isFinal: true.
	self assert: entity isFinal
]

{ #category : #tests }
FAMIXClassTest >> testIsInterface [
	self
		assert:
			(self actualClass new
				isInterface: true;
				isInterface)
]

{ #category : #tests }
FAMIXClassTest >> testIsPackage [
	| entity |
	entity := self actualClass new.
	entity isPackage: true.
	self assert: entity isPackage
]

{ #category : #tests }
FAMIXClassTest >> testIsPrivate [
	| entity |
	entity := self actualClass new.
	entity isPrivate: true.
	self assert: entity isPrivate
]

{ #category : #tests }
FAMIXClassTest >> testIsProtected [
	| entity |
	entity := self actualClass new.
	entity isProtected: true.
	self assert: entity isProtected
]

{ #category : #tests }
FAMIXClassTest >> testIsPublic [
	| entity |
	entity := self actualClass new.
	entity isPublic: true.
	self assert: entity isPublic
]

{ #category : #tests }
FAMIXClassTest >> testVisiblity [
	self assert: self actualClass new visibility isNil
]
