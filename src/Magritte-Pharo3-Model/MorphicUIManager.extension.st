Extension { #name : #MorphicUIManager }

{ #category : #'*Magritte-Pharo3-Model' }
MorphicUIManager >> chooseFile: windowTitle in: directoryString [

	| chooser |
	chooser := FileDialogWindow newWithTheme: UITheme current.
	chooser
		title: windowTitle;
		selectDirectory: directoryString;
		answerFileEntry.
	^ chooser openModal answer ifNotNil: [ :answer | answer asFileReference ].
]
