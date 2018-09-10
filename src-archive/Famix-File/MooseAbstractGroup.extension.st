Extension { #name : #MooseAbstractGroup }

{ #category : #'*Famix-File' }
MooseAbstractGroup >> allFiles [
	<navigation: 'All files'>
	^ self allWithSubTypesOf: FAMIXFile
]

{ #category : #'*Famix-File' }
MooseAbstractGroup >> allFolders [
	<navigation: 'All folders'>
	^ self allWithSubTypesOf: FAMIXFolder
]
