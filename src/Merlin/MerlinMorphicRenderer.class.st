Class {
	#name : #MerlinMorphicRenderer,
	#superclass : #MerlinRenderer,
	#instVars : [
		'dialogWindow',
		'builder'
	],
	#category : #'Merlin-Rendering'
}

{ #category : #accessing }
MerlinMorphicRenderer >> builder [

	^ builder
]

{ #category : #accessing }
MerlinMorphicRenderer >> dialogWindow [ 

	^ dialogWindow 
]

{ #category : #accessing }
MerlinMorphicRenderer >> dialogWindow: aDialogWindow [ 

	dialogWindow := aDialogWindow  
]

{ #category : #rendering }
MerlinMorphicRenderer >> doOpen: aDialogWindow [

	self builder openModal: aDialogWindow.
]

{ #category : #'initialize-release' }
MerlinMorphicRenderer >> initialize [

	super initialize.
	builder := StandardWindow new.
	dialogWindow :=  PluggableDialogWindow new beResizeable; yourself.
	dialogWindow contentMorph: (dialogWindow newColumn: {   }).
]

{ #category : #'parts rendering' }
MerlinMorphicRenderer >> merlinButtonRenderingFor: aButtonPart [

	^ MerlinMorphButtonWidget new wizardPart: aButtonPart; yourself  
]

{ #category : #'parts rendering' }
MerlinMorphicRenderer >> merlinCheckboxRenderingFor: aCheckboxePart [

	^ MerlinMorphCheckboxWidget new wizardPart: aCheckboxePart; yourself  
]

{ #category : #'parts rendering' }
MerlinMorphicRenderer >> merlinChooseFileRenderingFor: aChooseFilePart [

	^ MerlinMorphChooseFileWidget new wizardPart: aChooseFilePart; yourself  
]

{ #category : #'parts rendering' }
MerlinMorphicRenderer >> merlinColumnRenderingFor: aPaneColumn [

	^ MerlinMorphColumnWidget new wizardCell: aPaneColumn; yourself. 
]

{ #category : #'parts rendering' }
MerlinMorphicRenderer >> merlinDirectoryChooseRenderingFor: aChooseFilePart [

	^ MerlinMorphDirectoryChooseWidget new wizardPart: aChooseFilePart; yourself
]

{ #category : #'parts rendering' }
MerlinMorphicRenderer >> merlinDropListRenderingFor: aDroplListPart [

	^ MerlinMorphDroplListWidget new wizardPart: aDroplListPart; yourself. 
]

{ #category : #'parts rendering' }
MerlinMorphicRenderer >> merlinItemsSelectorRenderingFor: anItemSelectorPart [


	^ MerlinItemsSelectorWidget new wizardPart: anItemSelectorPart; yourself. 
	
]

{ #category : #'parts rendering' }
MerlinMorphicRenderer >> merlinListRenderingFor: aListPart [

	^ MerlinMorphListWidget new wizardPart: aListPart; yourself. 
]

{ #category : #'parts rendering' }
MerlinMorphicRenderer >> merlinMorphDropListRenderingFor: aMorphDroplListPart [

	^ MerlinMorphMorphDroplListWidget new wizardPart: aMorphDroplListPart; yourself. 
]

{ #category : #'parts rendering' }
MerlinMorphicRenderer >> merlinMultiCheckboxesRenderingFor: aMulticheckboxesPart [

	^ MerlinMorphMultiCheckboxesWidget new wizardPart: aMulticheckboxesPart; yourself  
]

{ #category : #'parts rendering' }
MerlinMorphicRenderer >> merlinMultiPartsRenderingFor: aCompositePart [

	^ MerlinMorphMultiPartsWidget new wizardPart: aCompositePart; yourself. 
]

{ #category : #'parts rendering' }
MerlinMorphicRenderer >> merlinMultiSelectionItemsSelectorRenderingFor: aMultiSelectionItemSelectorPart [


	^ MerlinMultiSelectionItemsSelectorWidget new wizardPart: aMultiSelectionItemSelectorPart; yourself. 
	
]

{ #category : #'parts rendering' }
MerlinMorphicRenderer >> merlinRadioButtonsRenderingFor: aRadioButtonsPart [

	^ MerlinMorphRadioButtonsWidget new wizardPart: aRadioButtonsPart ; yourself. 
]

{ #category : #'parts rendering' }
MerlinMorphicRenderer >> merlinRowRenderingFor: aPaneRow [

	^ MerlinMorphRowWidget new wizardCell: aPaneRow; yourself. 
]

{ #category : #'parts rendering' }
MerlinMorphicRenderer >> merlinSaveChooseFileRenderingFor: aChooseFilePart [

	^ MerlinMorphSaveChooseFileWidget new wizardPart: aChooseFilePart; yourself  
]

{ #category : #'parts rendering' }
MerlinMorphicRenderer >> merlinTextEditorRenderingFor: aTextEditorPart [

	^ MerlinMorphTextEditorWidget new wizardPart: aTextEditorPart ; yourself. 
]

{ #category : #'parts rendering' }
MerlinMorphicRenderer >> merlinTextFieldRenderingFor: aTextFieldPart [

	^ MerlinMorphTextFieldWidget new wizardPart: aTextFieldPart ; yourself. 
]

{ #category : #'parts rendering' }
MerlinMorphicRenderer >> merlinTextRenderingFor: aTextPart [

	^ MerlinMorphTextWidget new wizardPart: aTextPart ; yourself. 
]

{ #category : #rendering }
MerlinMorphicRenderer >> renderColumn: aPaneRow [

	^ MerlinMorphicColumnRenderer new dialogWindow: self dialogWindow ; render: aPaneRow  
]

{ #category : #rendering }
MerlinMorphicRenderer >> renderMerlinFirstPane: aWizardFirstPane [

	| tmpRenderer |
	tmpRenderer := MerlinMorphicFirstPaneRenderer new dialogWindow: self dialogWindow ; wizardRenderer: self; yourself.
	aWizardFirstPane renderer: tmpRenderer.
	^ tmpRenderer render: aWizardFirstPane        
]

{ #category : #rendering }
MerlinMorphicRenderer >> renderMerlinLastPane: aWizardLastPane [

	|tmpRenderer|
	tmpRenderer := MerlinMorphicLastPaneRenderer new dialogWindow: self dialogWindow ;wizardRenderer: self;yourself.
	aWizardLastPane renderer: tmpRenderer.
	^ tmpRenderer render: aWizardLastPane      
]

{ #category : #rendering }
MerlinMorphicRenderer >> renderMerlinMiddlePane: aWizardMiddlePane [

	| tmpRenderer |
	tmpRenderer := MerlinMorphicMiddlePaneRenderer new dialogWindow: self dialogWindow ; wizardRenderer: self; yourself.
	aWizardMiddlePane renderer: tmpRenderer.
	^ tmpRenderer render: aWizardMiddlePane    
]

{ #category : #rendering }
MerlinMorphicRenderer >> renderMerlinSinglePane: aWizardSinglePane [

	|tmpRenderer|
	tmpRenderer :=  MerlinMorphicSinglePaneRenderer new dialogWindow: self dialogWindow ; wizardRenderer: self; yourself.
	aWizardSinglePane renderer: tmpRenderer.
	^ tmpRenderer render: aWizardSinglePane  
]

{ #category : #rendering }
MerlinMorphicRenderer >> renderRow: aPaneRow [

	^ MerlinMorphicRowRenderer new dialogWindow: self dialogWindow ; render: aPaneRow  
]
