Class {
	#name : #FAMIXMethodTest,
	#superclass : #FAMIXNamedEntityTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXMethodTest >> actualClass [
	^ FAMIXMethod
]

{ #category : #tests }
FAMIXMethodTest >> testIsAbstract [
	| entity |
	entity := self actualClass new.
	entity isAbstract: true.
	self assert: entity isAbstract
]

{ #category : #testing }
FAMIXMethodTest >> testIsConstructor [
	self
		assert:
			(self actualClass new
				isConstructor: true;
				isConstructor).
	self
		deny:
			(self actualClass new
				isConstructor: true;
				isConstructor: false;
				isConstructor).
	self
		assert:
			(self actualClass new
				isConstructor: true;
				isConstructor: false;
				isConstructor: true;
				isConstructor)
]

{ #category : #testing }
FAMIXMethodTest >> testIsConstructorByKind [
	self assert: (self actualClass new kind: 'constructor'; isConstructor)
]

{ #category : #tests }
FAMIXMethodTest >> testIsFinal [
	| entity |
	entity :=self actualClass new.
	entity isFinal: true.
	self assert: entity isFinal
]

{ #category : #tests }
FAMIXMethodTest >> testIsPackage [
	| entity |
	entity := self actualClass new.
	entity isPackage: true.
	self assert: entity isPackage
]

{ #category : #tests }
FAMIXMethodTest >> testIsPrivate [
	| entity |
	entity := self actualClass new.
	entity isPrivate: true.
	self assert: entity isPrivate
]

{ #category : #tests }
FAMIXMethodTest >> testIsProtected [
	| entity |
	entity := self actualClass new.
	entity isProtected: true.
	self assert: entity isProtected
]

{ #category : #tests }
FAMIXMethodTest >> testIsPublic [
	| entity |
	entity := self actualClass new.
	entity isPublic: true.
	self assert: entity isPublic
]
