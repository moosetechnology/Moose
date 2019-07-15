Class {
	#name : #FAMIXNamedEntityTest,
	#superclass : #FAMIXSourcedEntityTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXNamedEntityTest >> actualClass [
	^ FAMIXNamedEntity
]

{ #category : #tests }
FAMIXNamedEntityTest >> testIsAbstract [
	| entity |
	entity := self actualClass new.
	entity isAbstract: true.
	self assert: entity isAbstract
]

{ #category : #tests }
FAMIXNamedEntityTest >> testIsFinal [
	| entity |
	entity :=self actualClass new.
	entity isFinal: true.
	self assert: entity isFinal
]

{ #category : #tests }
FAMIXNamedEntityTest >> testIsPackage [
	| entity |
	entity := self actualClass new.
	entity isPackage: true.
	self assert: entity isPackage
]

{ #category : #tests }
FAMIXNamedEntityTest >> testIsPrivate [
	| entity |
	entity := self actualClass new.
	entity isPrivate: true.
	self assert: entity isPrivate
]

{ #category : #tests }
FAMIXNamedEntityTest >> testIsProtected [
	| entity |
	entity := self actualClass new.
	entity isProtected: true.
	self assert: entity isProtected
]

{ #category : #tests }
FAMIXNamedEntityTest >> testIsPublic [
	| entity |
	entity := self actualClass new.
	entity isPublic: true.
	self assert: entity isPublic
]
