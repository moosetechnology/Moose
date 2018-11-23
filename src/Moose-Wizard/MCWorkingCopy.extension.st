Extension { #name : #MCWorkingCopy }

{ #category : #'*Moose-Wizard' }
MCWorkingCopy >> shortDescription [

	^ self modified
		ifTrue: ['*', ancestry ancestorString]
		ifFalse: [ancestry ancestorString]
]
