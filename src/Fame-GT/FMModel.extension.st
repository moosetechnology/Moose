Extension { #name : #FMModel }

{ #category : #'*Fame-GT' }
FMModel >> gtExportAction [
	<gtInspectorAction>
	^ GLMGenericAction new
		action: [ 
			| fileReference |
			fileReference := UITheme builder fileSave: 'Specify MSE file' extensions: #('mse').
			fileReference ifNotNil: [ 
				fileReference writeStreamDo: [ :s | self exportOn: s ].
				Notification signal: 'Save successful!' ] ];
		icon: (Smalltalk ui icons iconNamed: #glamorousSave);
		title: 'Export to MSE'
	
]
