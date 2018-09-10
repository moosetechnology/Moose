Class {
	#name : #PJEndOfLineCommentsNode,
	#superclass : #PJCommentsNode,
	#category : #'PetitJava-AST'
}

{ #category : #'as yet unclassified' }
PJEndOfLineCommentsNode class >> comment: aString [
	^(self new) comment: aString; yourself.
]

{ #category : #'as yet unclassified' }
PJEndOfLineCommentsNode >> comment: aString [
	aString ifNotNil: [ comment := (aString collect: #asciiValue) asByteArray asString ].
	aString ifNil: [ comment := '' ]
]

{ #category : #'as yet unclassified' }
PJEndOfLineCommentsNode >> printOn: aStream [
	^	aStream 
		nextPutAll: 'EndOfLineComment value ==> ';
		nextPutAll: self comment.
 

]
