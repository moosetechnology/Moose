Extension { #name : #MooseAbstractGroup }

{ #category : #'*Dynamix-Core' }
MooseAbstractGroup >> allActivations [
	^self allWithType: DynamixActivation
]

{ #category : #'*Dynamix-Core' }
MooseAbstractGroup >> allTraces [
	<navigation: 'All traces'>
	^self allWithType: DynamixTrace 
]
