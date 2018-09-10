Class {
	#name : #PJAnnotationNode,
	#superclass : #PJExpressionNode,
	#instVars : [
		'typeName'
	],
	#category : #'PetitJava-AST'
}

{ #category : #'instance creation' }
PJAnnotationNode class >> typeName: aPJNameNode [

	^(self new) typeName: aPJNameNode ; yourself
]

{ #category : #testing }
PJAnnotationNode >> isAnnotation [

	^true
]

{ #category : #testing }
PJAnnotationNode >> isModifier [ 

	^ false
]

{ #category : #accessing }
PJAnnotationNode >> typeName [
	^ typeName
]

{ #category : #accessing }
PJAnnotationNode >> typeName: anObject [
	typeName := anObject
]
