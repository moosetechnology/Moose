Class {
	#name : #FAMIXInvocationNavigationTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB'
}

{ #category : #tests }
FAMIXInvocationNavigationTest >> testIsASureInvocation [
	| invoc1 invoc2 method |
	method := self getMethod: 'm5p10c17Mtd1()'.
	invoc1 := method outgoingInvocations detect: [ :each | each signature = 'm5p10c18InstCreation()' ].
	self assert: invoc1 isASureInvocation.

	invoc2 := method outgoingInvocations detect: [ :each | each signature = 'm5p10c18Mtd1()' ].
	self deny: invoc2 isASureInvocation
]

{ #category : #tests }
FAMIXInvocationNavigationTest >> testIsSurelyInvokedBy [
	| method |
	method := self model allMethods entityNamed: #'Model5InteractedReferencer::M5P10C17FullReferencerInSide.m5p10c17Mtd1()'.

	self assert: ((self getMethod: 'm5p10c18InstCreation()') isSurelyInvokedBy: method).
	self deny: ((self getMethod: 'm5p10c18Mtd1()') isSurelyInvokedBy: method)
]
