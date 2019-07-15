Extension { #name : #Any }

{ #category : #'*Mocketry-Domain' }
Any class >> asSpecOfArg: argumentNumber of: aMessageSendSpec [

	^SpecOfMessageArgument number: argumentNumber requiredValue: self
]

{ #category : #'*Mocketry-Domain' }
Any class >> captureValue: anObject [
]

{ #category : #'*Mocketry-Domain' }
Any class >> isAllowAutoStub [
	^false
]

{ #category : #'*Mocketry-Domain' }
Any class >> stub [
	^MockCurrentBehaviour value createHelperMockAs: (MockStubTeacher for: self)
]
