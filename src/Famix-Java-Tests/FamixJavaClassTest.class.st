Class {
	#name : #FamixJavaClassTest,
	#superclass : #FamixJavaTypeTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #helpers }
FamixJavaClassTest >> actualClass [ 
		^ FamixJavaClass
]

{ #category : #tests }
FamixJavaClassTest >> testIsInterface [
	self
		assert:
			(self actualClass new
				isInterface: true;
				isInterface)
]

{ #category : #tests }
FamixJavaClassTest >> testIsJUnit40TestCase [
	| testAnnotation testAnnotationInstance famixClass famixMethod |
	testAnnotation := FamixJavaAnnotationType new name: 'Test'.
	testAnnotationInstance := FamixJavaAnnotationInstance new annotationType: testAnnotation.
	famixClass := FamixJavaClass new.
	famixMethod := FamixJavaMethod new name: 'someMethodAnnotated'.
	famixClass addMethod: famixMethod.
	famixMethod annotationInstances add: testAnnotationInstance.
	self assert: famixClass isJUnit4TestCase
]

{ #category : #tests }
FamixJavaClassTest >> testModifiers [
	self assert: self actualClass new modifiers isEmpty
]
