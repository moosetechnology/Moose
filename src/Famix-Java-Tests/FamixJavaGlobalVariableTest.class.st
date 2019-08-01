Class {
	#name : #FamixJavaGlobalVariableTest,
	#superclass : #FamixJavaNamedEntityTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #helpers }
FamixJavaGlobalVariableTest >> actualClass [ 
		^ FamixJavaGlobalVariable
]

{ #category : #tests }
FamixJavaGlobalVariableTest >> testClassScope [ 
	self flag: 'this test has been migrated as such, but has to be modified because parentScope of a global variable is a class and not a package'.
	self assert: self actualClass new typeScope isNil.
	
]

{ #category : #tests }
FamixJavaGlobalVariableTest >> testIsPublic [
	| entity |
	entity := self actualClass new.
	entity isPublic: true.
	self deny: entity isPublic 
]

{ #category : #tests }
FamixJavaGlobalVariableTest >> testNamespaceScope [
	| namespace globalVariable |
	self flag: 'this test has been migrated as such, but has to be modified because parentScope of a global variable is a class and not a package'.
	namespace := FamixJavaNamespace new.
	globalVariable := self actualClass new parentScope: namespace.
	self assert: globalVariable namespaceScope equals: namespace
]
