"
A ContextFrame is the frame that is open by the MooseImportInterface when the user click on the 'detailContextbutton'. It is composed by a set of checkboxes corresponding the context of import for an importer.

Instance Variables
	builder:		<StandardWindow>
	checkboxes:		<OrderedCollection>
	contextSelected:		<SortedCollection> 
	dialogWindow:		<PluggableDialogWindow>

builder
	- the main window in which we plugg the dialog

checkboxes
	- contains all checkboxes objects (CheckboxMorph) present in this frame. 

contextSelected
	- contains items selected when the ok button is clicked by the user.

dialogWindow
	- in which we position all the morph elements

"
Class {
	#name : #MooseContextFrame,
	#superclass : #Object,
	#instVars : [
		'checkboxes',
		'contextSelected',
		'dialogWindow',
		'builder'
	],
	#category : #'Moose-Finder'
}

{ #category : #'instance creation' }
MooseContextFrame class >> new [

^ super new initialize.
]

{ #category : #'morph - creation context frame' }
MooseContextFrame >> addVerticalSeparatorAtTheMiddleOf: aCollection [

	|  index result result1 result2 |
	index := aCollection size / 2.
	result := OrderedCollection new.
	result1 := OrderedCollection new.
	result2 := OrderedCollection new.
	1 to: (index ) do: [:i | result1 add: (aCollection at: i)].
	
	(index + 1) to: aCollection size do: [:i | result2 add: (aCollection at: i)].
	result add: (dialogWindow newColumn: result1 ); add: (dialogWindow  newVerticalSeparator) ; add: (dialogWindow newColumn: result2 ). 
	^ result.
]

{ #category : #'context informations' }
MooseContextFrame >> allContexts [

| result |
result :=  MooseImportingContext entityDependencies keys .

^ result.
]

{ #category : #testing }
MooseContextFrame >> allSelected [
	"return true if all the context items are selected in the frame, and false if not"
	
	^ contextSelected size = self allContexts size.
]

{ #category : #utilities }
MooseContextFrame >> checkboxForContextNamed: aContextName [
	^ checkboxes detect: [ :each | each label asString == aContextName ].
]

{ #category : #'morph - creation context frame' }
MooseContextFrame >> close [

	dialogWindow close.
]

{ #category : #accessing }
MooseContextFrame >> contextSelected [
	"return a collection with symbols representing all the items selected"
	^ contextSelected
]

{ #category : #'morph - creation context frame' }
MooseContextFrame >> createContextFrame [
	"open a frame asking wich contexts have to be imported with your packages importation."
	"self disableMainFrame."

	checkboxes := OrderedCollection new.
	builder := StandardWindow new.
	dialogWindow := builder newPluggableDialogWindow: 'Context to import'.
	dialogWindow useDefaultOKButton.
	dialogWindow
		contentMorph: (dialogWindow newRow: { 
					(dialogWindow newGroupboxForAll: {(dialogWindow newRow: (self addVerticalSeparatorAtTheMiddleOf: (self newContextCheckBoxes: dialogWindow)))})
				 });
		model: nil.
	dialogWindow buttons anyOne
		actionSelector: #updateSelectedContext;
		arguments: {   };
		model: self.
	
]

{ #category : #'context informations' }
MooseContextFrame >> dependenciesFor: aCollectionOfContexts [
	"return all the contexts depending of contexts in aCollectionOfContexts"
	| dependenciesForContext |

	dependenciesForContext := Set new.
	aCollectionOfContexts do: [:each | dependenciesForContext addAll: (MooseImportingContext entityDependencies at: each)].

	dependenciesForContext size == aCollectionOfContexts size
		ifTrue: [^ dependenciesForContext ]
		ifFalse: [^ self dependenciesFor: dependenciesForContext ].
]

{ #category : #accessing }
MooseContextFrame >> dialogWindow [

	^ dialogWindow 
]

{ #category : #actions }
MooseContextFrame >> getSelectedContexts [
	"return a collection containing context symbols corresponding to the checkboxes selected"
	| result |
	result := OrderedCollection new.
	checkboxes do: [ :each | each buttonMorph selected ifTrue: [ result add: each label asSymbol ] ].
	^ result
]

{ #category : #'initialize-release' }
MooseContextFrame >> initialize [

	contextSelected := self allContexts.
	
	self createContextFrame  
]

{ #category : #'morph - creation context frame' }
MooseContextFrame >> newContextCheckBoxes: dialog [
	"return a collection of checkboxes representing the different contexts that can be imported"
	| result |
	checkboxes := OrderedCollection new.
	result :=  (self allContexts asSortedCollection: [:a :b | a < b]) collect: 
		[ :each | checkboxes add: (dialog 
				newCheckboxFor: (ValueHolder new contents: (contextSelected  includes: each))
				getSelected: #contents
				setSelected: #contents:
				label: each asString
				help: '') ].
	self setActionToCheckboxes.
	^ result. 
]

{ #category : #accessing }
MooseContextFrame >> okButtonActionSelector: selector  arguments: collectionOfArguments  model: model [ 
	"set the action of the ok button . the message selector will be send to model with the arguments arguments."
	dialogWindow buttons anyOne
		actionSelector: selector;
		arguments: collectionOfArguments ;
		model: model.
]

{ #category : #'morph - creation context frame' }
MooseContextFrame >> open [

	builder openModal: dialogWindow
]

{ #category : #'context informations' }
MooseContextFrame >> revertDependenciesFor: aCollectionOfContexts [
	"return all the contexts from wich aCollectionOfContexts depends"
	| revertDependenciesForContext entityDependencies |

	revertDependenciesForContext := Set new.
	entityDependencies := MooseImportingContext entityDependencies.
	aCollectionOfContexts do: [:each | 
		entityDependencies associationsDo: [:assoc | 
		(assoc value includes: each ) ifTrue: [revertDependenciesForContext add: assoc key] ] ].
	
	revertDependenciesForContext size == aCollectionOfContexts size
	ifTrue: [ ^ revertDependenciesForContext ]
	ifFalse: [^ self revertDependenciesFor: revertDependenciesForContext ].
	

]

{ #category : #accessing }
MooseContextFrame >> selectAllContext [
	"make all checkboxes selected"
	checkboxes do: [:each | each buttonMorph state: #on]
]

{ #category : #'morph - creation context frame' }
MooseContextFrame >> setActionToCheckboxes [
	"initialize the action to do when clicking on a checkbox"
	checkboxes do: [ :each | 
		each buttonMorph
				target: self;
				actionSelector: #updateCheckboxesWhenChangesOn:;
				arguments: {  (each label)  } ].
]

{ #category : #utilities }
MooseContextFrame >> updateCheckboxesNamed: aCollectionOfLabels withState: aStateSelector [

	checkboxes do: 
				[ :each | (aCollectionOfLabels includes: each label asSymbol) ifTrue: [ each buttonMorph state: aStateSelector  ] ].
]

{ #category : #actions }
MooseContextFrame >> updateCheckboxesWhenChangesOn: contextName [ 
	" when the context contextName has been selected or deselected, update all the others contexts checkboxes that are linked to this context "
	| dependenciesForContext contextCheckBox |
	contextCheckBox := self checkboxForContextNamed: contextName .
	
	({#pressed. #on} includes: contextCheckBox buttonMorph state) 
		ifTrue: 
			[ 
				dependenciesForContext := self dependenciesFor: { (contextName asSymbol)}.
				self updateCheckboxesNamed: dependenciesForContext  withState: #on.
			]
		ifFalse: 
			[ 
				dependenciesForContext := self revertDependenciesFor: {(contextName asSymbol)}.
				self updateCheckboxesNamed: dependenciesForContext  withState: #off  .
			].
	self updateSelectedContext . 
]

{ #category : #actions }
MooseContextFrame >> updateSelectedContext [
	contextSelected := self getSelectedContexts.

]
