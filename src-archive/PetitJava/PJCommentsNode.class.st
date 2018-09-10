Class {
	#name : #PJCommentsNode,
	#superclass : #PJSyntaxNode,
	#instVars : [
		'comment'
	],
	#category : #'PetitJava-AST'
}

{ #category : #'as yet unclassified' }
PJCommentsNode class >> comment: aString [
	^(self new) comment: aString; yourself.
]

{ #category : #'as yet unclassified' }
PJCommentsNode >> acceptVisitor: aVisitor [
	^ aVisitor visitCommentsNode: self
]

{ #category : #'as yet unclassified' }
PJCommentsNode >> comment [
^ comment.
]

{ #category : #'as yet unclassified' }
PJCommentsNode >> comment: aString [ 
	comment := aString.
]

{ #category : #'as yet unclassified' }
PJCommentsNode >> printOn: aStream [
	^	aStream 
		nextPutAll: 'comment value ==> ';
		nextPutAll: self comment.
  
]
