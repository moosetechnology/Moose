Class {
	#name : #GTGlamourDebuggingStone,
	#superclass : #GTDebuggingStone,
	#category : #'GT-GlamourDebugger'
}

{ #category : #private }
GTGlamourDebuggingStone >> glamourValueDeliveryPredicate [
	^ self session
		createPredicateForBlock: [ :aContext | 
			aContext selector = #glamourValueWithArgs:
				and: [ 
					aContext peekInstruction arguments notEmpty
						and: [ #(#value #valueWithArguments:) includes: aContext peekInstruction argument ] ] ]
]

{ #category : #'testing context' }
GTGlamourDebuggingStone >> hasPresentationConditionReachedTarget [

	^ true
	"^ self session context peekInstruction arguments size = 1 and: [
		self session context peekInstruction argument = #condition ]"
]

{ #category : #'testing receiver' }
GTGlamourDebuggingStone >> isPresentationConditionValid [

	^ (self session context receiver condition 
		ifNil: [ false ]
		ifNotNil: [ :aBlock |  aBlock printString ~= [true] printString ])
]

{ #category : #'testing receiver' }
GTGlamourDebuggingStone >> isPresentationCreationValid [

	^ self session context receiver presentationsFactory notNil
	
]

{ #category : #'testing receiver' }
GTGlamourDebuggingStone >> isTransmissionConditionValid [

	^ self session context receiver condition isBlock
]

{ #category : #'testing receiver' }
GTGlamourDebuggingStone >> isTransmissionTransformationValid [

	^ self session context receiver transformation notNil
]

{ #category : #actions }
GTGlamourDebuggingStone >> stepToGlamourValueBlock [

	self session stepUntil: self glamourValueDeliveryPredicate from: self session context.
	self session isActive ifTrue: [ 
		self session stepInto ].
	^ true
]

{ #category : #actions }
GTGlamourDebuggingStone >> stepToPresentationCondition [
	| ctxt |

	ctxt := self session context.
	self session 
		stepUntil: ((self session createPredicateForBlock: [ ctxt isDead ]) or:  self glamourValueDeliveryPredicate)
		from: self session context.
		
	ctxt isDead not ifTrue: [ 
		self session stepInto ].
	
	^ ctxt isDead not
]

{ #category : #actions }
GTGlamourDebuggingStone >> stepToPresentationCreation [
	
	^ self stepToGlamourValueBlock
]

{ #category : #actions }
GTGlamourDebuggingStone >> stepToTransmissionCondition [

	^ self stepToGlamourValueBlock
]

{ #category : #actions }
GTGlamourDebuggingStone >> stepToTransmissionTransformation [

	^ self stepToGlamourValueBlock
]
