Class {
	#name : #FAMIXAccessTest,
	#superclass : #FAMIXAssociationTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXAccessTest >> actualClass [
	^ FAMIXAccess
]

{ #category : #tests }
FAMIXAccessTest >> testDefaultIsRead [
	self assert: self actualClass new isRead not
]

{ #category : #tests }
FAMIXAccessTest >> testDefaultIsReadWriteUnknown [
	self assert: self actualClass new isReadWriteUnknown
]

{ #category : #tests }
FAMIXAccessTest >> testDefaultIsWrite [
	self assert: self actualClass new isWrite not
]

{ #category : #tests }
FAMIXAccessTest >> testIsRead [
	self assert: (self actualClass new isWrite: false) isRead.
	self assert: (self actualClass new isWrite: true) isRead not
]

{ #category : #tests }
FAMIXAccessTest >> testIsWrite [
	self assert: (self actualClass new isWrite: false) isWrite not.
	self assert: (self actualClass new isWrite: true) isWrite
]
