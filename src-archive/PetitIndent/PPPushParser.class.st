Class {
	#name : #PPPushParser,
	#superclass : #PPDelegateParser,
	#category : #'PetitIndent-Core'
}

{ #category : #parsing }
PPPushParser >> parseOn: context [
	| result |
	
	result := parser parseOn: context.
	result isPetitFailure ifFalse: [ 
		context indentStack push: result.
	].
	^ result
]
