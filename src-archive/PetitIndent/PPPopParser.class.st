Class {
	#name : #PPPopParser,
	#superclass : #PPParser,
	#category : #'PetitIndent-Core'
}

{ #category : #parsing }
PPPopParser >> parseOn: context [
	context indentStack isEmpty ifTrue: [ 
		^ PPFailure message: 'cannot pop an empty stack' context: context
	].

	^ context indentStack pop
]
