Extension { #name : #MooseAbstractGroup }

{ #category : #'*Famix-Compatibility-Entities' }
MooseAbstractGroup >> allParameterTypes [
	<navigation: 'All parameter types'>
	<package: #Java>
	^ self allUsing: FamixTParameterType
]

{ #category : #'*Famix-Compatibility-Entities' }
MooseAbstractGroup >> allPrimitiveTypes [
	
	<navigation: 'All primitive types'>
	^(self allWithType: FAMIXPrimitiveType) sorted: [:a :b | a name < b name]; yourself
]

{ #category : #'*Famix-Compatibility-Entities' }
MooseAbstractGroup >> allUnknownVariables [
	
	<navigation: 'All unknown variables'>
	^self allWithType: FAMIXUnknownVariable 
]
