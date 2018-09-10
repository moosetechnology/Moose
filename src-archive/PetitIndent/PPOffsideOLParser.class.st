Class {
	#name : #PPOffsideOLParser,
	#superclass : #PPParser,
	#category : #'PetitIndent-Offside-rule'
}

{ #category : #analysis }
PPOffsideOLParser >> acceptsEpsilon [
	^ true
]

{ #category : #analysis }
PPOffsideOLParser >> firstCharSet [
	^ PPCharSetPredicate on: [:e | true ] 
]

{ #category : #parsing }
PPOffsideOLParser >> parseOn: context [
	(context column < (context indentStack topIfEmpty: 1)) ifFalse: [  
		^ PPFailure message: 'Not in offside' context: context
	].
	^ #offside
]
