Class {
	#name : #REPStakeholderTest,
	#superclass : #TestCase,
	#category : #'Arki-Tests-Reporter'
}

{ #category : #tests }
REPStakeholderTest >> testByName [
	self assert: (REPStakeholder named: 'a') == (REPStakeholder named: 'a').
	self assert: (REPStakeholder named: 'a') name = 'a'
]

{ #category : #tests }
REPStakeholderTest >> testByNameInitialization [
	self assert: REPStakeholder byName notNil.
]

{ #category : #tests }
REPStakeholderTest >> testByNameReset [
	REPStakeholder reset.
	self assert: REPStakeholder byName isEmpty
]

{ #category : #tests }
REPStakeholderTest >> testGroup [
	| group |
	group := (REPStakeholder named: 'a'), (REPStakeholder named: 'b').
	self assert: group asString = 'a, b'
]
