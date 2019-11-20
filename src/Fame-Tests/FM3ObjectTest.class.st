Class {
	#name : #FM3ObjectTest,
	#superclass : #FM3ConstantTest,
	#category : #'Fame-Tests-Core'
}

{ #category : #helpers }
FM3ObjectTest >> actualClass [
	^ FM3Object
]

{ #category : #helpers }
FM3ObjectTest >> numberOfSuperClasses [
	^ 0
]

{ #category : #tests }
FM3ObjectTest >> testHasSuperclass [
	self deny: constant hasSuperclass
]

{ #category : #tests }
FM3ObjectTest >> testIsPrimitive [
	self deny: constant isPrimitive
]
