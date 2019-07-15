Extension { #name : #ExecutionEnvironment }

{ #category : #'*Mocketry-Domain' }
ExecutionEnvironment >> allowsForkedProcessInheritMocks [

	^false
]

{ #category : #'*Mocketry-Domain' }
ExecutionEnvironment >> createMockBehaviour [
	^MockBehaviour for: self
]

{ #category : #'*Mocketry-Domain' }
ExecutionEnvironment >> currentMetaLevelForMocks [
	^GHMetaLevel standard
]

{ #category : #'*Mocketry-Domain' }
ExecutionEnvironment >> isMockBehaviourActive: aMockBehaviour [
	^aMockBehaviour ownerEnvironment == self
]

{ #category : #'*Mocketry-Domain' }
ExecutionEnvironment >> setUpMockNameFor: aMock inContextOf: ownerProcess [
]
