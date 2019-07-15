Class {
	#name : #SmaCCDebugMatchedNode,
	#superclass : #Object,
	#instVars : [
		'matchResult',
		'node'
	],
	#category : #'SmaCC_Debugging_Support'
}

{ #category : #'instance creation' }
SmaCCDebugMatchedNode class >> forResult: matchResult andNode: aNode [
	^ self new
		matchResult: matchResult;
		node: aNode;
		yourself
]

{ #category : #accessing }
SmaCCDebugMatchedNode >> matchResult [
	^ matchResult
]

{ #category : #accessing }
SmaCCDebugMatchedNode >> matchResult: anObject [
	matchResult := anObject
]

{ #category : #accessing }
SmaCCDebugMatchedNode >> node [
	^ node
]

{ #category : #accessing }
SmaCCDebugMatchedNode >> node: anObject [
	node := anObject
]
