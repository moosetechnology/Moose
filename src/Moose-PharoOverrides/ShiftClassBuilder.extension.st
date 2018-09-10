Extension { #name : #ShiftClassBuilder }

{ #category : #'*Moose-PharoOverrides' }
ShiftClassBuilder >> copyClassSlotsFromExistingClass [
	
	"Moose override: 22278-Class-re-definition-makes-class-varialbes-from-tratis-local"

	"Ugly helper method: I copy over the class slots of the class in my builder environment."

	| anOldClass oldSlots |
	anOldClass := self environment at: name ifAbsent: [ ^ self ].

	oldSlots := anOldClass class classLayout slotScope visibleSlots.
	self classSlots:(oldSlots select: #isLocal thenCollect: [ :e | e copy index: nil; yourself ])
]
