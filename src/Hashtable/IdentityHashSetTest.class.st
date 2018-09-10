Class {
	#name : #IdentityHashSetTest,
	#superclass : #TestCase,
	#instVars : [
		'set'
	],
	#category : #'Hashtable-Test'
}

{ #category : #running }
IdentityHashSetTest >> setUp [
	super setUp.
	set := IdentityHashSet new
]

{ #category : #testing }
IdentityHashSetTest >> testSameHash [

	| string1 string2 |
	string1 := String newFrom: 'testme!'.
	string2 := String newFrom: 'testme!'.
	
	self assert: set isEmpty.
	self deny: (set includes: string1).
	self deny: (set includes: string2).
	
	set add: string1.
	self assert: set size = 1.
	self assert: (set includes: string1).
	self deny: (set includes: string2).
	
	set add: string1.
	self assert: set size = 1.
	self assert: (set includes: string1).
	self deny: (set includes: string2).
	
	set add: string2.
	self assert: set size = 2.
	self assert: (set includes: string1).
	self assert: (set includes: string2).
	
	set remove: string1.
	self assert: set size = 1.
	self deny: (set includes: string1).
	self assert: (set includes: string2).
	
	set remove: string2.
	self assert: set isEmpty.
	self deny: (set includes: string1).
	self deny: (set includes: string2).
]
