Class {
	#name : #RTMorphDropInteraction,
	#superclass : #RTInteraction,
	#instVars : [
		'condition',
		'behavior'
	],
	#category : #'Roassal2-Interactions'
}

{ #category : #'instance creation' }
RTMorphDropInteraction class >> if: aCondition do: aBlock [
	^ self new if: aCondition do: aBlock
]

{ #category : #'dropping/grabbing' }
RTMorphDropInteraction >> acceptDroppingMorph: aMorph event: anEvent [
	behavior value: aMorph value: anEvent
]

{ #category : #accessing }
RTMorphDropInteraction >> behavior: aTwoArgBlock [
	"What should happen with the morph when the condition was met?
	[ :aMorph :anEvent | what should happen ] block.
	Used in TRMorph>>#acceptDroppingMorph:event:"

	behavior := aTwoArgBlock
]

{ #category : #accessing }
RTMorphDropInteraction >> condition: aTwoArgBlock [
	"[ :aMorph :anEvent | boolean ] block condition whether this interaction wants the dropped morph.
This is used in TRMorph>>#wantsDroppedMorph:event:"
	condition := aTwoArgBlock
]

{ #category : #accessing }
RTMorphDropInteraction >> if: aConditionBlock do: aBehaviorBlock [
	self condition: aConditionBlock.
	self behavior: aBehaviorBlock
]

{ #category : #initialization }
RTMorphDropInteraction >> initialize [
	super initialize.
	behavior := [ :morph :event |  ].
	condition := [ :morph :event |  ]
]

{ #category : #hooks }
RTMorphDropInteraction >> initializeElement: anElement [
	anElement
		when: TRMorphWantsDrop
		do: [ :event | 
			(self wantsDroppedMorph: event droppedMorph event: event dropMorphEvent)
				ifTrue: [ event handledBy: event shape ] ].
	anElement
		when: TRMorphDrop
		do: [ :event | self acceptDroppingMorph: event droppedMorph event: event dropMorphEvent ]
]

{ #category : #'dropping/grabbing' }
RTMorphDropInteraction >> wantsDroppedMorph: aMorph event: anEvent [
	^ condition value: aMorph value: anEvent
]
