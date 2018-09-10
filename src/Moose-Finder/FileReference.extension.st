Extension { #name : #FileReference }

{ #category : #'*Moose-Finder' }
FileReference >> gtInspectorActionImportMSE [
	<gtInspectorAction>
	^ GLMGenericAction new
		action: [ :composite | 
			| result |
			result := MooseModel new 
				importFromMSEStream: (StandardFileStream readOnlyFileNamed: self fullName).
			composite selection: result ];
		icon: MooseIcons mooseImportMse;
		condition: [ self extension = 'mse' ];
		title: 'Import'
]
