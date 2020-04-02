"
Description
--------------------

I am an abstract class to define tags assertion failures.
"
Class {
	#name : #FamixTagFailure,
	#superclass : #AssertionFailure,
	#category : #'Famix-Tagging-Exceptions'
}

{ #category : #private }
FamixTagFailure >> isResumable [
	^ true
]
