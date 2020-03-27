Extension { #name : #FamixTGroup }

{ #category : #'*Famix-Compatibility-Entities' }
FamixTGroup >> allParameterTypes [
	<navigation: 'All parameter types'>
	<package: #Java>
	^ self allUsing: FamixTParameterType
]

{ #category : #'*Famix-Compatibility-Entities' }
FamixTGroup >> allPrimitiveTypes [
	
	<navigation: 'All primitive types'>
	^(self allWithType: FAMIXPrimitiveType) sorted: [:a :b | a name < b name]; yourself
]

{ #category : #'*Famix-Compatibility-Entities' }
FamixTGroup >> allUnknownVariables [
	
	<navigation: 'All unknown variables'>
	^self allWithType: FAMIXUnknownVariable 
]
