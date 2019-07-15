Class {
	#name : #GTPPReflectivityStepDebugAction,
	#superclass : #GTReflectivityDebugAction,
	#category : #'GT-PetitParserDebugger'
}

{ #category : #testing }
GTPPReflectivityStepDebugAction >> appliesToContext: aContext [

	^ self session isActive and: [
		aContext locateTopPPParser notNil ]
]

{ #category : #accessing }
GTPPReflectivityStepDebugAction >> debuggerClass [
	^ GTPPDebugger
]
