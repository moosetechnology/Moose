Class {
	#name : #FAMIXMethodTest,
	#superclass : #FAMIXNamedEntityTest,
	#category : #'Famix-Compatibility-Tests-Core'
}

{ #category : #helpers }
FAMIXMethodTest >> actualClass [
	^ FAMIXMethod
]

{ #category : #testing }
FAMIXMethodTest >> testIsConstructor [
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
FAMIXMethodTest >> testIsConstructorByKind [
	self assert: (self actualClass new kind: 'constructor'; isConstructor)
]
