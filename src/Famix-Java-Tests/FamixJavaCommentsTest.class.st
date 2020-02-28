Class {
	#name : #FamixJavaCommentsTest,
	#superclass : #TestCase,
	#category : #'Famix-Java-Tests'
}

{ #category : #tests }
FamixJavaCommentsTest >> testClassWithComment [
	| javaClass |
	javaClass := FamixJavaClass new.
	FamixJavaComment new container: javaClass.
	self assert: javaClass numberOfComments equals: 1
]

{ #category : #tests }
FamixJavaCommentsTest >> testClassWithCommentAndMethodsWithComments [
	| javaClass |
	javaClass := FamixJavaClass new.
	FamixJavaComment new container: javaClass.
	FamixJavaComment new
		container:
			(FamixJavaMethod new
				parentType: javaClass;
				yourself).
	FamixJavaComment new
		container:
			(FamixJavaMethod new
				parentType: javaClass;
				yourself).
	self assert: javaClass numberOfComments equals: 3	"one in the class, one on each of the 2 methods"
]
