Class {
	#name : #PPAlignOLParser,
	#superclass : #PPParser,
	#category : #'PetitIndent-Offside-rule'
}

{ #category : #analysis }
PPAlignOLParser >> acceptsEpsilon [
	^ true
]

{ #category : #analysis }
PPAlignOLParser >> firstCharSet [
	^ PPCharSetPredicate on: [:e | true ] 
]

{ #category : #parsing }
PPAlignOLParser >> parseOn: context [
	"default value for indent stack is 1"
	((context indentStack topIfEmpty: 1) = context column) ifFalse: [  
		^ PPFailure message: 'Not aligned' context: context
	].
	^ #aligned
]
