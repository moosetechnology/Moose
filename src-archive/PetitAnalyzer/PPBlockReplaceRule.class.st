"
PPBlockReplaceRule replaces the matching node by the result of evaluating replaceBlock. This allows arbitrary computation to come up with a replacement.

Instance Variables:
	replaceBlock <BlockClosure>	The block that returns the parer to replace to matching parser with.

"
Class {
	#name : #PPBlockReplaceRule,
	#superclass : #PPReplaceRule,
	#instVars : [
		'replaceBlock'
	],
	#category : #'PetitAnalyzer-Core'
}

{ #category : #'instance creation' }
PPBlockReplaceRule class >> searchFor: aSearchParser replaceWith: aReplaceBlock when: aVerificationBlock [
	^ (self searchFor: aSearchParser) 
		setReplaceBlock: aReplaceBlock;
		setVerificationBlock: aVerificationBlock;
		yourself
]

{ #category : #matching }
PPBlockReplaceRule >> foundMatchFor: aParser [ 
	^ replaceBlock cull: aParser
]

{ #category : #initialization }
PPBlockReplaceRule >> setReplaceBlock: aBlock [
	replaceBlock := aBlock
]
