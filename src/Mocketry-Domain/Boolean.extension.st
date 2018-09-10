Extension { #name : #Boolean }

{ #category : #'*Mocketry-Domain' }
Boolean >> isAllowAutoStub [
	^false
]

{ #category : #'*Mocketry-Domain' }
Boolean >> stub [
	"you should not stub true or false. it crash anything"
	self shouldNotImplement 
]
