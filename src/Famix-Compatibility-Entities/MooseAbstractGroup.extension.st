Extension { #name : #MooseAbstractGroup }

{ #category : #'*Famix-Compatibility-Entities' }
MooseAbstractGroup >> allParameterTypes [
	<navigation: 'All parameter types'>
	<package: #Java>
	^ self allWithType: FAMIXParameterType
]

{ #category : #'*Famix-Compatibility-Entities' }
MooseAbstractGroup >> allUnknownVariables [
	
	<navigation: 'All unknown variables'>
	^self allWithType: FAMIXUnknownVariable 
]
