Class {
	#name : #MerlinMorphWidget,
	#superclass : #Object,
	#category : #'Merlin-Rendering'
}

{ #category : #'accessing - morph contents' }
MerlinMorphWidget >> morphContents [ 

	"should return  the concrete morph to use to display this Merlin widget"
	^ self subclassResponsability 
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newButtonNamed: aString withAction: selector [
	"use this method to create a new classic button that will execute the method designed by selector when clicked. The method selector must be defined and implemented in the subclass"
	
	| button |
	button := PluggableButtonMorph on: self getState: nil action: selector.
	button label: aString.
	^button
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newButtonOn: aModel named: aString withAction: selector [
	"use this method to create a new classic button that will execute the method designed by selector when clicked. The method selector must be defined and implemented in the subclass"
	
	| button |
	button := PluggableButtonMorph on: aModel getState: nil action: selector.
	button label: aString.
	^button
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newCheckboxFor: aModel getSelected: getSel setSelected: setSel label: label [
	"return a checkbox with the label label. the value of the checkbox will be accessed by the selector getSel (send to aModel) and set by the selector setSel (send to aModel)."

	
	^(CheckboxMorph
			on: aModel selected: getSel changeSelected: setSel)
		font: StandardFonts defaultFont;
		label: label;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		yourself
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newColumnWith: aCollectionOfMorphElements [
	"use this method to create a new column in your block"
	
	|answer|
	answer := PanelMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		fillStyle: Color transparent; "non pane color tracking"
		changeTableLayout;
		cellInset: 8; yourself.
	aCollectionOfMorphElements do: [:m | answer addMorphBack: m].
	^answer
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newDirectoryDialogNamed: title [

	"Answer a morph representing a directory open dialog with the given title"

	|tmpFileDialog|
	tmpFileDialog := FileDialogWindow basicNew
		initialize;
		title: title;
		answerDirectory.
	tmpFileDialog answerDirectory.
	^ tmpFileDialog
	
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newDropListOn: aModel [
			
	| morph |
	morph := (DropListMorph
			on: (aModel)
			list: #list
			selected: #selectionIndex
			changeSelected: #selectionIndex:
			useIndex: true)
		"cornerStyle: #rounded;"
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		yourself.
		
	
	^ morph.
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newDropListOn: aModel list: aSelector [
			
	| morph |
	morph := (DropListMorph
			on: (aModel)
			list: aSelector
			selected: #selectionIndex
			changeSelected: #selectionIndex:
			useIndex: true)
		"cornerStyle: #rounded;"
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		yourself.
		
	
	^ morph.
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newEmptyText [
	"Answer a new text."

	^TextMorph new
		wrapFlag: true;
		"font: self textFont;"
		autoFit: true;
		lock;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newFileDialogNamed: title [

"Answer a morph representing a file open dialog with the given title"

	|tmpFileDialog|
	tmpFileDialog := FileDialogWindow basicNew
		initialize;
		title: title;
		answerOpenFile.
	"exts ifNotNil: [fd validExtensions: exts].
	path ifNotNil: [fd selectPathName: path]."
	tmpFileDialog answerOpenFile .
	^ tmpFileDialog
	
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newGroupBoxNamed: aString with: aMorph [ 
	"Answer a groupbox with the given label and control."
	^ (self newGroupboxNamed: aString)
		addContentMorph: aMorph;
		yourself
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newGroupboxNamed: aString [ 
	"Answer a groupbox with the given label."
	^ GroupboxMorph new
		"cornerStyle: #rounded;"
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		label: aString;
		yourself
		

]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newLabel: aString [
	"return a simple label displaying the text aString"
	^LabelMorph contents: aString font: TextStyle defaultFont
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newListFor: aModel list: listSelector selected: getSelector changeSelected: setSelector [
	"return a PluggableListMorph. the value of the list will be accessed by the selector listSelector (send to aModel). the index of the current item selected will be accessed by getSelector (send to aModel) and set by the selector setSelector (send to aModel)."
	^PluggableListMorph new
		"selectionColor: self selectionColor;"
		font: TextStyle defaultFont;
		on: aModel
		list: listSelector
		selected: getSelector
		changeSelected: setSelector
		menu: nil
		keystroke: nil;
		autoDeselect: false;
		"cornerStyle: #rounded;"
		color: Color white;
		borderStyle: (BorderStyle inset width: 1);
		hResizing: #spaceFill;
		vResizing: #spaceFill; yourself.
		"getEnabledSelector: enabledSel;
		setBalloonText: helpText"
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newMorphDropListOn: aModel [
			
	| tmpDropList |
	tmpDropList := (MorphDropListMorph
			on: aModel
			list: #list 
			selected: #selectionIndex
			changeSelected: #selectionIndex:
			useIndex: true)
		"selectionColor: self selectionColor;
		getEnabledSelector: enabledSel;"
		"cornerStyle: #rounded;"
		hResizing: #spaceFill;
		vResizing: #shrinkWrap.
		"setBalloonText: helpText"
		
	
	^ tmpDropList.
	
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newMultiSelectionListFor: aModel list: listSelector primarySelection: primarySelectionSelector changePrimarySelection: changePrimarySelectionSelector listSelection: listSelectionSelector changeListSelection: changeListSelectionSelector [

^ (PluggableListMorph
		on: aModel
		list: listSelector 
		primarySelection: primarySelectionSelector 
		changePrimarySelection: changePrimarySelectionSelector 
		listSelection: listSelectionSelector 
		changeListSelection: changeListSelectionSelector
		menu: nil )
		font: StandardFonts defaultFont;
		autoDeselect: false;
		"cornerStyle: #rounded;"
		color: Color white;
		borderStyle: (BorderStyle inset width: 1);
		hResizing: #spaceFill;
		vResizing: #spaceFill; yourself.
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newNormalListFor: aModel list: listSelector selected: getSelector changeSelected: setSelector [

	^(PluggableListMorph 
		"selectionColor: self selectionColor;
		font: self listFont;"
		on: aModel
		list: listSelector
		selected: getSelector
		changeSelected: setSelector)
		"menu: nil
		keystroke: nil;
		autoDeselect: false;"
		"cornerStyle: #rounded;"
		color: Color white;
		borderStyle: (BorderStyle inset width: 1);
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		yourself
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newRadionButtonFor: aModel getSelected: getSel setSelected: setSel label: aString [


	^(CheckboxMorph
			on: aModel selected: getSel changeSelected: setSel)
		"getEnabledSelector: enabledSel;"
		"font: self labelFont;"
		label: aString;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		"setBalloonText: helpText;"
		beRadioButton
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newRowWith: aCollectionOfMorphElements [
	<lint: 'Utility methods' rationale: 'defined here to facilate the use of the library' author: 'cyrille.delaunay'>
	"use this method to create a new row in your block"
	
	|answer|
	answer := PanelMorph new
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		fillStyle: Color transparent; "non pane color tracking"
		changeTableLayout;
		listDirection: #leftToRight;
		cellInset: 8; yourself.
	aCollectionOfMorphElements do: [:m | answer addMorphBack: m].
	^answer
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newSaveFileDialogNamed: title [

	"Answer a morph representing a save file dialog with the given title"

	|tmpFileDialog|
	tmpFileDialog := FileDialogWindow basicNew
		initialize;
		title: title;
		answerSaveFile.
	tmpFileDialog answerSaveFile.
	^ tmpFileDialog
	
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newTabGroupBoxFor: labelsAndControls [

	^(TabGroupMorph  new
		"font: self labelFont;"
		"cornerStyle: #rounded;"
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		labelsAndPages: labelsAndControls)
		selectedPageIndex: (labelsAndControls isEmpty ifTrue: [0] ifFalse: [1])
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newText: aStringOrText [
	"Answer a new text."

	^TextMorph new
		wrapFlag: true;
		contents: aStringOrText;
		"font: self textFont;"
		autoFit: true;
		lock;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newTextEditorFor: aModel getText: getSel setText: setSel [
	"Answer a text editor for the given model."

	^ (PluggableTextEditorMorph new)
		on: aModel
			text: getSel
			accept: setSel
			readSelection: nil
			menu: nil;
		"font: self textFont;"
		"cornerStyle: #rounded;"
		hResizing: #rigid;
		vResizing: #spaceFill
		"borderStyle: (BorderStyle inset width: 1);"
		"extent: 800@(Preferences standardDefaultTextFont height + 8);"
"		color: Color white."
		"selectionColor: self selectionColor"	
			"getEnabledSelector: enabledSel;" 
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newTextEntryFor: aModel getText: getTextSelector setText: setTextSelector [

		
	| pt |
	pt := PluggableTextFieldMorph new
		convertTo: String;
		alwaysAccept: true;
		on: aModel
		text: getTextSelector
		accept: setTextSelector
		readSelection: nil
		menu: nil;
		acceptOnCR: true;
		"getEnabledSelector: enabledSel;"
		"font: StandardFonts defaultFont;"
		"cornerStyle:  #rounded;"
		hResizing: #spaceFill"#rigid";
		vResizing: #rigid;
		"borderStyle: (BorderStyle inset width: 1);
		color: Color white;"
		"selectionColor: self selectionColor;"
		hideScrollBarsIndefinitely;
		extent: 24@ (StandardFonts defaultFont height + 8);
		"setBalloonText: helpText."
		yourself.
	pt textMorph
		autoFit: true;
		wrapFlag: false;
		margins: (2@1 corner: 2@1).
		
	^ pt.
]

{ #category : #'utils - morph creation' }
MerlinMorphWidget >> newVerticalSeparator [
	"Answer a new vertical separator."

	^SeparatorMorph new
		fillStyle: Color transparent;
		borderStyle: (BorderStyle inset baseColor: Color blue; width: 1);
		extent: 2@2;
		vResizing: #spaceFill
]
