Extension { #name : #UndefinedObject }

{ #category : #'*Mocketry-Domain' }
UndefinedObject >> isAllowAutoStub [
	^false
]

{ #category : #'*Mocketry-Domain' }
UndefinedObject >> stub [
	"you should not stub nil. it crash anything"
	self shouldNotImplement 
]
