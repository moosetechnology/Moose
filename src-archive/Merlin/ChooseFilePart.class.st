Class {
	#name : #ChooseFilePart,
	#superclass : #WizardPart,
	#instVars : [
		'fileDialog',
		'fileDialogMorph',
		'dialogLabel',
		'validExtensions',
		'selectedPathName'
	],
	#category : #'Merlin-Parts'
}

{ #category : #accessing }
ChooseFilePart >> dialogLabel [

	^ dialogLabel  
]

{ #category : #accessing }
ChooseFilePart >> dialogLabel: aString [

	dialogLabel := aString 
]

{ #category : #'initialize-release' }
ChooseFilePart >> initialize [

	super initialize.
	self selectedPathName: FileSystem disk workingDirectory fullName.
]

{ #category : #accessing }
ChooseFilePart >> latePopulateContents [
	
	

	
	
]

{ #category : #'*Merlin-Rendering' }
ChooseFilePart >> merlinRendering [

	^ self renderer merlinChooseFileRenderingFor: self
]

{ #category : #accessing }
ChooseFilePart >> mightHasChanged [
	"The contents of a part might has changed without the part itself know it (This is the case for a textField). This method will be called by the parent wizard pane to be sure all has been corretly done before opening the next pane. By default does nothing. If you have to make something special before opening the next pane, it 's the good place to do it'"
	
	self hasChanged
]

{ #category : #'accessing - wizard mangement' }
ChooseFilePart >> outputValue [
	"this method is an abstract method as only the subclass itself know what is the information to send to the WizardPane which will send it  to the wizarControl "
	""
	^ output
]

{ #category : #accessing }
ChooseFilePart >> selectPathName: aPathString [
	
	self selectedPathName: aPathString. 
]

{ #category : #accessing }
ChooseFilePart >> selectedPathName [

	^ selectedPathName
]

{ #category : #accessing }
ChooseFilePart >> selectedPathName: aString [

	selectedPathName := aString 
]

{ #category : #accessing }
ChooseFilePart >> validExtensions [ 

	^ validExtensions
]

{ #category : #accessing }
ChooseFilePart >> validExtensions: aCollectionOfStrings [

	validExtensions := aCollectionOfStrings 
]
