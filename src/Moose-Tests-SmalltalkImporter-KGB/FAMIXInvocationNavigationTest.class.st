Class {
	#name : #FAMIXInvocationNavigationTest,
	#superclass : #AbstractFAMIXNavigationTest,
	#category : #'Moose-Tests-SmalltalkImporter-KGB'
}

{ #category : #'as yet unclassified' }
FAMIXInvocationNavigationTest >> testIsASureInvocation [
	 
	| invoc1 invoc2 method | 
	method := self getMethod: 'm5p10c17Mtd1()' from: self c17FullReferencerInSide.
	invoc1 := method outgoingInvocations detect: [:each |
		each signature = 'm5p10c18InstCreation()' ].
	self assert: invoc1 isASureInvocation. 
	
	invoc2 := method outgoingInvocations detect: [:each |
		each signature = 'm5p10c18Mtd1()' ].
	self assert: (invoc2 isASureInvocation) not. 
]

{ #category : #'as yet unclassified' }
FAMIXInvocationNavigationTest >> testIsSurelyInvokedBy [
	 
	| method m1 m2 | 
	method := self model allMethods entityNamed: #'Model5InteractedReferencer::M5P10C17FullReferencerInSide.m5p10c17Mtd1()'.
	m1 := self getMethod: 'm5p10c18InstCreation()' from: self c18FullRefereeInSideOutSide.
	m2 := self getMethod: 'm5p10c18Mtd1()' from: self c18FullRefereeInSideOutSide.
	
	self assert: (m1 isSurelyInvokedBy: method).
	self deny: (m2 isSurelyInvokedBy: method)

]
