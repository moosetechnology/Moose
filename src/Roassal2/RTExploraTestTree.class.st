Class {
	#name : #RTExploraTestTree,
	#superclass : #RTObject,
	#instVars : [
		'left',
		'right',
		'parent'
	],
	#category : #'Roassal2-Builder-Explora'
}

{ #category : #accessing }
RTExploraTestTree >> left [
	^ left
]

{ #category : #accessing }
RTExploraTestTree >> left: aNode [
	left := aNode
]

{ #category : #accessing }
RTExploraTestTree >> parent [
	^ parent
]

{ #category : #accessing }
RTExploraTestTree >> parent: aNode [
	parent := aNode
]

{ #category : #accessing }
RTExploraTestTree >> right [
	^ right
]

{ #category : #accessing }
RTExploraTestTree >> right: aNode [
	right := aNode
]
