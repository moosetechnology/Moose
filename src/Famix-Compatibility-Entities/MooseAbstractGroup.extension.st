Extension { #name : #MooseAbstractGroup }

{ #category : #'*Famix-Compatibility-Entities' }
MooseAbstractGroup >> allPrimitiveTypes [
	<navigation: 'All primitive types'>
	^ self allWithType: FAMIXPrimitiveType
]

{ #category : #'*Famix-Compatibility-Entities' }
MooseAbstractGroup >> allUnknownVariables [
	
	<navigation: 'All unknown variables'>
	^self allWithType: FAMIXUnknownVariable 
]
