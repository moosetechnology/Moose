"
PPReplaceRule is the abstract superclass of all of the transforming rules. The rules change the grammar by replacing the node that matches the rule. Subclasses implement different strategies for this replacement.

Instance Variables:
	verificationBlock	<BlockClosure>	Is evaluated with the matching parser and allows for further verification of a match.
"
Class {
	#name : #PPReplaceRule,
	#superclass : #PPRule,
	#instVars : [
		'verificationBlock'
	],
	#category : #'PetitAnalyzer-Core'
}

{ #category : #matching }
PPReplaceRule >> canMatch: aParser [ 
	^ verificationBlock cull: aParser
]

{ #category : #initialization }
PPReplaceRule >> initialize [
	super initialize.
	verificationBlock := [ :parser | true ]
]

{ #category : #initialization }
PPReplaceRule >> setVerificationBlock: aBlock [
	verificationBlock := aBlock
]
