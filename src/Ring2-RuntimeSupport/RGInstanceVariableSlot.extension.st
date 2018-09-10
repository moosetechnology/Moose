Extension { #name : #RGInstanceVariableSlot }

{ #category : #'*Ring2-RuntimeSupport' }
RGInstanceVariableSlot >> emitStore: methodBuilder [

	methodBuilder storeInstVar: self index
]

{ #category : #'*Ring2-RuntimeSupport' }
RGInstanceVariableSlot >> emitValue: methodBuilder [

	methodBuilder pushInstVar: self index.

]

{ #category : #'*Ring2-RuntimeSupport' }
RGInstanceVariableSlot >> index [

	"TODO!"
	^ self parent parent allSlots indexOf: self
]
