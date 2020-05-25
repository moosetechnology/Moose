Extension { #name : #MooseAbstractGroup }

{ #category : #'*Famix-Compatibility-Entities' }
MooseAbstractGroup >> allUnknownVariables [
	
	<navigation: 'All unknown variables'>
	^self allWithType: FAMIXUnknownVariable 
]
