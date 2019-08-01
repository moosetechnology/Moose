Class {
	#name : #FamixJavaMethodTest,
	#superclass : #FamixJavaNamedEntityTest,
	#category : #'Famix-Java-Tests'
}

{ #category : #helpers }
FamixJavaMethodTest >> actualClass [ 
		^ FamixJavaMethod
]

{ #category : #testing }
FamixJavaMethodTest >> testIsConstructor [
	self
		assert:
			(self actualClass new
				isConstructor: true;
				isConstructor).
	self
		deny:
			(self actualClass new
				isConstructor: true;
				isConstructor: false;
				isConstructor).
	self
		assert:
			(self actualClass new
				isConstructor: true;
				isConstructor: false;
				isConstructor: true;
				isConstructor)
]

{ #category : #testing }
FamixJavaMethodTest >> testIsConstructorByKind [
	self assert: (self actualClass new kind: 'constructor'; isConstructor)
]
