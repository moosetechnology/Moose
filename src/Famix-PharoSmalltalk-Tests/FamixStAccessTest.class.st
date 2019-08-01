Class {
	#name : #FamixStAccessTest,
	#superclass : #FamixStAssociationTest,
	#category : #'Famix-PharoSmalltalk-Tests'
}

{ #category : #helpers }
FamixStAccessTest >> actualClass [ 
		^ FamixStAccess
]

{ #category : #tests }
FamixStAccessTest >> testDefaultIsRead [
	self assert: self actualClass new isRead not
]

{ #category : #tests }
FamixStAccessTest >> testDefaultIsReadWriteUnknown [
	self assert: self actualClass new isReadWriteUnknown
]

{ #category : #tests }
FamixStAccessTest >> testDefaultIsWrite [
	self assert: self actualClass new isWrite not
]

{ #category : #tests }
FamixStAccessTest >> testIsRead [
	self assert: (self actualClass new isWrite: false) isRead.
	self assert: (self actualClass new isWrite: true) isRead not
]

{ #category : #tests }
FamixStAccessTest >> testIsWrite [
	self assert: (self actualClass new isWrite: false) isWrite not.
	self assert: (self actualClass new isWrite: true) isWrite
]
