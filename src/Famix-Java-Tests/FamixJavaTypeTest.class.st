Class {
	#name : #FamixJavaTypeTest,
	#superclass : #FamixJavaNamedEntityTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #helpers }
FamixJavaTypeTest >> actualClass [ 
		^ FamixJavaType
]

{ #category : #tests }
FamixJavaTypeTest >> testBehaviorsWithDeclaredType [
	| type behaviour |
	type := self actualClass new.
	behaviour := FamixJavaMethod new.
	behaviour declaredType: type.
	self assert: behaviour declaredType == type.
	self assert: type behavioursWithDeclaredType size equals: 1.
	self assert: (type behavioursWithDeclaredType includes: behaviour)
]

{ #category : #tests }
FamixJavaTypeTest >> testStructuresWithDeclaredType [
	| type structure |
	type := self actualClass new.
	structure := FamixJavaAttribute new.
	structure declaredType: type.
	self assert: structure declaredType == type.
	self assert: type structuresWithDeclaredType size equals: 1.
	self assert: (type structuresWithDeclaredType includes: structure)
]
