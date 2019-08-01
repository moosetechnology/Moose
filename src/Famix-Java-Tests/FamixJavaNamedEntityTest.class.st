Class {
	#name : #FamixJavaNamedEntityTest,
	#superclass : #FamixJavaSourcedEntityTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #helpers }
FamixJavaNamedEntityTest >> actualClass [ 
		^ FamixJavaNamedEntity
]

{ #category : #tests }
FamixJavaNamedEntityTest >> testIsAbstract [
	| entity |
	entity := self actualClass new.
	entity isAbstract: true.
	self assert: entity isAbstract
]

{ #category : #tests }
FamixJavaNamedEntityTest >> testIsFinal [
	| entity |
	entity :=self actualClass new.
	entity isFinal: true.
	self assert: entity isFinal
]

{ #category : #tests }
FamixJavaNamedEntityTest >> testIsPackage [
	| entity |
	entity := self actualClass new.
	entity isPackage: true.
	self assert: entity isPackage
]

{ #category : #tests }
FamixJavaNamedEntityTest >> testIsPrivate [
	| entity |
	entity := self actualClass new.
	entity isPrivate: true.
	self assert: entity isPrivate
]

{ #category : #tests }
FamixJavaNamedEntityTest >> testIsProtected [
	| entity |
	entity := self actualClass new.
	entity isProtected: true.
	self assert: entity isProtected
]

{ #category : #tests }
FamixJavaNamedEntityTest >> testIsPublic [
	| entity |
	entity := self actualClass new.
	entity isPublic: true.
	self assert: entity isPublic
]
