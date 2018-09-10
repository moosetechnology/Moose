Class {
	#name : #RGSlotTest,
	#superclass : #RGTest,
	#category : #'Ring2-Tests-Core'
}

{ #category : #tests }
RGSlotTest >> testNewSlot [

	| slot | 
	slot  := RGFixedLayout unnamed.
	self assert: (slot isRingResolved).
	self assert: (slot hasUnresolved: #name).
	self assert: (slot isLayout).
	
]

{ #category : #tests }
RGSlotTest >> testSlotsImplicitEnvironment [

	| layout |
	
	layout := RGInstanceVariableSlot unnamed.
	self assert: (layout hasUnresolved: #name).
	self assert: (layout parent isLayout).
	self checkImplicitSingleClassEnvironmentOf: layout parent parent.
	
	
	
	

]

{ #category : #tests }
RGSlotTest >> testUnknownSlot [

	| slot expression | 
	slot  := RGUnknownSlot unnamed.
	self assert: (slot isRingResolved).
	self assert: (slot hasUnresolvedAll: #(name expression)).
	self assert: (slot isSlot).
	expression := 'ToManyRelationSlot inverse: #director inClass: #SlotExampleMovie'.
	slot expression: expression.
	self assert: slot expression equals: expression.
	
]
