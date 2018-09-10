Class {
	#name : #PPTokenOLParser,
	#superclass : #PPTokenParser,
	#category : #'PetitIndent-Offside-rule'
}

{ #category : #parsing }
PPTokenOLParser >> parseOn: context [
	((context indentStack topIfEmpty: 1) <= context column) ifFalse: [  
		^ PPFailure message: 'Not aligned or onside' context: context
	].
	^ super parseOn: context
]
