Extension { #name : #MooseAbstractGroup }

{ #category : #'*Famix-C' }
MooseAbstractGroup >> allHeaders [
	<navigation: 'All headers'>
	^ self allWithType: FamixHeader  
]

{ #category : #'*Famix-C' }
MooseAbstractGroup >> allModules [
	<navigation: 'All modules'>
	^ self allWithType: FamixModule  
]

{ #category : #'*Famix-C' }
MooseAbstractGroup >> allTypeAliases [
	<navigation: 'All type aliases'>
	^ self allWithType: FamixTypeAlias
]
