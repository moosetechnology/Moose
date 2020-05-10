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
	self deny: self actualClass new isRead
]

{ #category : #tests }
FAMIXAccessTest >> testDefaultIsReadWriteUnknown [
	self assert: self actualClass new isReadWriteUnknown
]

{ #category : #tests }
FAMIXAccessTest >> testDefaultIsWrite [
	self deny: self actualClass new isWrite
]

{ #category : #tests }
FAMIXAccessTest >> testIsRead [
	self assert: (self actualClass new isWrite: false) isRead.
	self deny: (self actualClass new isWrite: true) isRead
]

{ #category : #tests }
FAMIXAccessTest >> testIsWrite [
	self deny: (self actualClass new isWrite: false) isWrite.
	self assert: (self actualClass new isWrite: true) isWrite
]
