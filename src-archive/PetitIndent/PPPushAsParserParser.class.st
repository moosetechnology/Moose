Class {
	#name : #PPPushAsParserParser,
	#superclass : #PPDelegateParser,
	#category : #'PetitIndent-Core'
}

{ #category : #parsing }
PPPushAsParserParser >> parseOn: context [
	| result |
	
	result := parser parseOn: context.
	result isPetitFailure ifFalse: [ 
		context indentStack push: result asParser.
	].
	^ result
]
