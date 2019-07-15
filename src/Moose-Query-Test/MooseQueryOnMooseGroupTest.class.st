Class {
	#name : #MooseQueryOnMooseGroupTest,
	#superclass : #MooseQueryTest,
	#category : #'Moose-Query-Test'
}

{ #category : #tests }
MooseQueryOnMooseGroupTest >> testAllOutgoing [
	| methGroup classGroup |
	methGroup := FAMIXMethodGroup withAll: (self model entities select: #isMethod).
	self assert: methGroup queryAllOutgoing size equals: 6.
	classGroup := FAMIXClassGroup withAll: (self model entities select: #isClass).
	self assert: classGroup queryAllOutgoing size equals: 7
]

{ #category : #tests }
MooseQueryOnMooseGroupTest >> testIncomingInvocation [
	| methGroup classGroup|
	methGroup := FAMIXMethodGroup withAll: (self model entities select: #isMethod).
	self assert: (methGroup queryIncoming: FamixTInvocation) size equals: 3.
	
	classGroup := FAMIXClassGroup withAll: (self model entities select: #isClass).
	self assert: (classGroup queryIncoming: FamixTInvocation) size equals: 3.
	
]

{ #category : #tests }
MooseQueryOnMooseGroupTest >> testOutgoingInvocation [
	| methGroup classGroup|
	methGroup := FAMIXMethodGroup withAll: (self model entities select: #isMethod).
	self assert: (methGroup queryOutgoing: FamixTInvocation) size equals: 3.
	
	classGroup := FAMIXClassGroup withAll: (self model entities select: #isClass).
	self assert: (classGroup queryOutgoing: FamixTInvocation) size equals: 3.
	
]
