Class {
	#name : #CheckboxPart,
	#superclass : #WizardPart,
	#instVars : [
		'label',
		'model',
		'checkbox',
		'contents',
		'actionSelector',
		'actionArguments',
		'actionModel',
		'parentComposite'
	],
	#category : #'Merlin-Parts'
}

{ #category : #accessing }
CheckboxPart >> actionArguments [

	"return a collection of arguments that should be passed when performing the action selector"
	^ actionArguments
]

{ #category : #accessing }
CheckboxPart >> actionArguments: aCollectionOfObjects [

	actionArguments := aCollectionOfObjects
]

{ #category : #accessing }
CheckboxPart >> actionModel [

	"return the model on which we should perform the action when clicking on a checkbox"
	^ actionModel
]

{ #category : #accessing }
CheckboxPart >> actionModel: anObject [

	actionModel := anObject.
]

{ #category : #accessing }
CheckboxPart >> actionSelector [

	"return the selector that should be performed when clicking on a checkbox"
	^ actionSelector
]

{ #category : #accessing }
CheckboxPart >> actionSelector: aSymbol [

	actionSelector  := aSymbol 
]

{ #category : #accessing }
CheckboxPart >> children [

	^ #()
]

{ #category : #'checkbox control' }
CheckboxPart >> contents [

	^contents
]

{ #category : #'checkbox control' }
CheckboxPart >> contents: newContents [

	contents := newContents.
"	self contentsChanged."
	self hasChanged.
	self parentComposite ifNotNil: [
		self parentComposite contentsChanged . 
		self parentComposite hasChanged.
		
		]  
]

{ #category : #'initialize-release' }
CheckboxPart >> initialize [ 

	super initialize.
	self label: ''.
	self actionModel: self.
	contents := true.
	
]

{ #category : #accessing }
CheckboxPart >> label [

	^ label
]

{ #category : #accessing }
CheckboxPart >> label:  aLabel [

	label := aLabel 
]

{ #category : #accessing }
CheckboxPart >> latePopulateContents [
	
	|default|
	default := defaultValue meValue: self requiredInputs.
	default ifNotNil: [:aBoolean |
		self selected: aBoolean.	
		]. 
	
	"groupBoxName 
		ifNotNilDo: [:aStringOrABlock |self populateContents: {self newGroupboxNamed: (aStringOrABlock meValue: self requiredInputs)  With: checkbox}]
		ifNil: [self populateContents: {checkbox }]."
	
]

{ #category : #rendering }
CheckboxPart >> merlinRendering [

	^ self renderer merlinCheckboxRenderingFor: self
]

{ #category : #'accessing - wizard mangement' }
CheckboxPart >> outputValue [
	"this method is an abstract method as only the subclass itself know what is the information to send to the WizardPane which will send it  to the wizarControl "
	"return true or false according the checkbox is selected or not"
	^ self contents 
]

{ #category : #accessing }
CheckboxPart >> parentComposite [

	^ parentComposite
]

{ #category : #accessing }
CheckboxPart >> parentComposite: aMultiCheckboxesPart [

	parentComposite := aMultiCheckboxesPart
]

{ #category : #'checkbox control' }
CheckboxPart >> safeContents: newContents [

	contents := newContents.
	self contentsChanged.  
]

{ #category : #accessing }
CheckboxPart >> selected [
	"return true if the checkBox button morph is selected "
	
	^ self contents

	
]

{ #category : #accessing }
CheckboxPart >> selected: trueOrFalse [
	"select or unselect the checkbox according the value of trueOrFalse "
	
	self contents: trueOrFalse.
	"checkbox updateSelection"

	
]
