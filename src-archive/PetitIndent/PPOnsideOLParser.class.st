Class {
	#name : #PPOnsideOLParser,
	#superclass : #PPParser,
	#category : #'PetitIndent-Offside-rule'
}

{ #category : #analysis }
PPOnsideOLParser >> acceptsEpsilon [
	^ true
]

{ #category : #analysis }
PPOnsideOLParser >> firstCharSet [
	^ PPCharSetPredicate on: [:e | true ] 
]

{ #category : #parsing }
PPOnsideOLParser >> parseOn: context [
	((context indentStack topIfEmpty: 0) < context column) ifFalse: [  
		^ PPFailure message: 'Not in onside' context: context
	].
	^ #onside
]
