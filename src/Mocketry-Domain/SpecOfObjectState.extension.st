Extension { #name : #SpecOfObjectState }

{ #category : #'*Mocketry-Domain' }
SpecOfObjectState >> captureValue: anObject [
]

{ #category : #'*Mocketry-Domain' }
SpecOfObjectState >> stub [
	^MockCurrentBehaviour value createHelperMockAs: (MockStubTeacher for: self)
]
