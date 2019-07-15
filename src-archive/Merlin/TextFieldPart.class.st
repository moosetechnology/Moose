Class {
	#name : #TextFieldPart,
	#superclass : #WizardPart,
	#instVars : [
		'textEntryContents',
		'useRequiredInputAsDefault',
		'defaultBlock',
		'prefix',
		'suffix',
		'returnSuffixAndPrefix',
		'horizontalSize'
	],
	#category : #'Merlin-Parts'
}

{ #category : #'instance creation' }
TextFieldPart class >> inGroupboxNamed: aString [

	^ super new inGroupboxNamed: aString.
]

{ #category : #accessing }
TextFieldPart >> defaultBlock: aBlock [
	
	"this method enable to compute the default text by computing the value of a block. Using a block is usefull, for example, to specify required value in its contents. Since this block will only be evaluated when this part will retrieve its required inputs, all will works well"
	defaultBlock := aBlock.
]

{ #category : #accessing }
TextFieldPart >> horizontalSize [

	^ horizontalSize 
]

{ #category : #accessing }
TextFieldPart >> horizontalSize: anInteger [ 

	horizontalSize := anInteger
]

{ #category : #'initialize-release' }
TextFieldPart >> initialize [ 

	super initialize.
	prefix := ''.
	suffix := ''.
	returnSuffixAndPrefix := false.
	
]

{ #category : #'initialize-release' }
TextFieldPart >> initialize: defaultText [

	self initialize.
	self textEntryContents: defaultText
	
]

{ #category : #accessing }
TextFieldPart >> initializeDefault [
	| default |
	default := self valueOf: self defaultValue.
	default ifNotNil: [ :aString | self textEntryContents: aString ]
]

{ #category : #accessing }
TextFieldPart >> latePopulateContents [

	self initializeDefault
	

]

{ #category : #'*Merlin-Rendering' }
TextFieldPart >> merlinRendering [

	^ self renderer merlinTextFieldRenderingFor: self
]

{ #category : #'accessing - wizard mangement' }
TextFieldPart >> outputValue [ 

		"this method is an abstract method as only the subclass itself know what is the information to send to the WizardPane which will send it  to the wizarControl "
		"textField  acceptTextInModel."
		"^ textEntryContents ."
		"^textField textMorph asText"
		
		returnSuffixAndPrefix 
			ifTrue: [
				^ prefix, self textEntryContents , suffix. 
				]
			ifFalse: [
				^ self textEntryContents  
				]
		
]

{ #category : #accessing }
TextFieldPart >> prefix [

	^ prefix 
]

{ #category : #accessing }
TextFieldPart >> prefix: aString [

	prefix := aString.
]

{ #category : #'accessing - wizard mangement' }
TextFieldPart >> retrieveInputRequired [
	"this method is an abstract method as only the subclass itself know what to do with the input that it needs to make its work "
	"by default do nothing"
	"make here all the thing required to build or make run this wizard part. This method will be clalled by wizardPane before opening the 'page'"
		

	
]

{ #category : #accessing }
TextFieldPart >> returnSuffixAndPrefix: trueOrFalse [

	returnSuffixAndPrefix := trueOrFalse. 
]

{ #category : #accessing }
TextFieldPart >> suffix [

	^ suffix
]

{ #category : #accessing }
TextFieldPart >> suffix: aString [

	suffix := aString.
]

{ #category : #'text entry control' }
TextFieldPart >> textEntryContents [
	"return the contents of the text entry "
	^ textEntryContents
]

{ #category : #'text entry control' }
TextFieldPart >> textEntryContents: newContents [ 
	"set the content of the text entry "
	textEntryContents := newContents.
	wizardPane ifNotNil: 
		[self hasChanged ].
	self changed: #textEntryContents.
	
]

{ #category : #accessing }
TextFieldPart >> textFieldHorizontalSize: anInteger [ 

	self horizontalSize: anInteger. .
]

{ #category : #accessing }
TextFieldPart >> useRequiredInputAsDefault: trueOrFalse [

	useRequiredInputAsDefault := trueOrFalse.
]
