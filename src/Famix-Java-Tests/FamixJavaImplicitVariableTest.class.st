Class {
	#name : #FamixJavaImplicitVariableTest,
	#superclass : #FamixJavaNamedEntityTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #helpers }
FamixJavaImplicitVariableTest >> actualClass [ 
		^ FamixJavaImplicitVariable
]

{ #category : #tests }
FamixJavaImplicitVariableTest >> testParentBehavioralEntity [
	| behaviour implicitVariable |
	behaviour := FamixJavaMethod new.
	implicitVariable := self actualClass new.
	implicitVariable parentBehaviouralEntity: behaviour.
	self assert: implicitVariable parentBehaviouralEntity equals: behaviour.
	self assert: behaviour implicitVariables size equals: 1.
	self assert: behaviour implicitVariables first equals: implicitVariable
]
