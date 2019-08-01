Class {
	#name : #FamixStImplicitVariableTest,
	#superclass : #FamixStNamedEntityTest,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #helpers }
FamixStImplicitVariableTest >> actualClass [ 
		^ FamixStImplicitVariable
]

{ #category : #tests }
FamixStImplicitVariableTest >> testParentBehavioralEntity [
	| behaviour implicitVariable |
	behaviour := FamixStMethod new.
	implicitVariable := self actualClass new.
	implicitVariable parentBehaviouralEntity: behaviour.
	self assert: implicitVariable parentBehaviouralEntity equals: behaviour.
	self assert: behaviour implicitVariables size equals: 1.
	self assert: behaviour implicitVariables first equals: implicitVariable
]
