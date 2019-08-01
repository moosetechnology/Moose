Class {
	#name : #FamixJavaAccessTest,
	#superclass : #FamixJavaAssociationTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #helpers }
FamixJavaAccessTest >> actualClass [ 
		^ FamixJavaAccess
]

{ #category : #tests }
FamixJavaAccessTest >> testDefaultIsRead [
	self assert: self actualClass new isRead not
]

{ #category : #tests }
FamixJavaAccessTest >> testDefaultIsReadWriteUnknown [
	self assert: self actualClass new isReadWriteUnknown
]

{ #category : #tests }
FamixJavaAccessTest >> testDefaultIsWrite [
	self assert: self actualClass new isWrite not
]

{ #category : #tests }
FamixJavaAccessTest >> testIsRead [
	self assert: (self actualClass new isWrite: false) isRead.
	self assert: (self actualClass new isWrite: true) isRead not
]

{ #category : #tests }
FamixJavaAccessTest >> testIsWrite [
	self assert: (self actualClass new isWrite: false) isWrite not.
	self assert: (self actualClass new isWrite: true) isWrite
]
