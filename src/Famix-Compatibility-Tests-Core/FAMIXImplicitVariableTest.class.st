Class {
	#name : #FAMIXImplicitVariableTest,
	#superclass : #FAMIXNamedEntityTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXImplicitVariableTest >> actualClass [
	^ FAMIXImplicitVariable
]

{ #category : #tests }
FAMIXImplicitVariableTest >> testParentBehavioralEntity [
	| behaviour implicitVariable |
	behaviour := FAMIXBehaviouralEntity new.
	implicitVariable := self actualClass new.
	implicitVariable parentBehaviouralEntity: behaviour.
	self assert: implicitVariable parentBehaviouralEntity equals: behaviour.
	self assert: behaviour implicitVariables size equals: 1.
	self assert: behaviour implicitVariables first equals: implicitVariable
]
