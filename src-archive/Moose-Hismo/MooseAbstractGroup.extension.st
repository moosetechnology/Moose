Extension { #name : #MooseAbstractGroup }

{ #category : #'*Moose-Hismo' }
MooseAbstractGroup >> allModelHistories [
	<navigation: 'All model histories'>
	^ self allWithType: HismoModelHistory
]
