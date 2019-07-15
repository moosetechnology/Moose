Class {
	#name : #MooseImportFromJdt2FamixWizard,
	#superclass : #WizardControl,
	#classVars : [
		'JavaProjectPath'
	],
	#category : #'Moose-Wizard'
}

{ #category : #'class initialization' }
MooseImportFromJdt2FamixWizard class >> reinitialize [
	
	"self reinitialize"
	VerveineJPath := nil
]

{ #category : #actions }
MooseImportFromJdt2FamixWizard >> doImport [

	| mseFile javaProjectPath model|
	javaProjectPath := wizardInformations at: #javaFolderPath.	",'/'"
	self
		generateMseFile: '' 
		forProject: javaProjectPath  
		usingJdt2FamixPath: self jdt2famixPath.

	mseFile := javaProjectPath asFileReference / (javaProjectPath asFileReference basename , '.mse').
	
	model := (MooseModel new 
		importFromMSEStream: (StandardFileStream readOnlyFileNamed: mseFile fullName);
		name: javaProjectPath asFileReference basename).
	model rootFolder: javaProjectPath.
	model install.

	JavaProjectPath := javaProjectPath
]

{ #category : #actions }
MooseImportFromJdt2FamixWizard >> generateMseFile: mseFileName forProject: javaProjectPath usingJdt2FamixPath: verveineJPath [
	self system:
		('cd ''{1}'' ; sh -c "''{2}''"'
			format:
				{javaProjectPath.
				(verveineJPath asFileReference / 'jdt2famix.sh') fullName})
]

{ #category : #'initialize-release' }
MooseImportFromJdt2FamixWizard >> initialize [
	 
	| wizardPane1 wizardPart1 wizardPane2 wizardPart2 |
	
	super initialize.
	
	wizardPane1 := WizardFirstPane named: 'Select the file "jdt2famix.sh"'.
	wizardPart1 := self selectJdt2FamixPart.
	wizardPane1 addPart: wizardPart1 associatedTo: #jdt2famixPath.
	
	wizardPane2 := WizardLastPane named: 'Select the root sources folder of the project you want to import'.
	wizardPart2 := self selectJavaProjectPart .
	wizardPane2 addPart: wizardPart2 associatedTo: #javaFolderPath. 
	
	self addPane: wizardPane1.
	self addPane: wizardPane2.	
	
	wizardPane1 condition: [:tmpWizardInformations |
		(tmpWizardInformations at: #jdt2famixPath) endsWith: 'jdt2famix.sh' 
		] named: 'You have to select the file named jdt2famix.sh'.

	self javaProjectPath asString asFileReference exists
				ifTrue: [ wizardPart2 selectPathName:  self javaProjectPath ]
]

{ #category : #accessing }
MooseImportFromJdt2FamixWizard >> javaProjectPath [

	^ JavaProjectPath
]

{ #category : #accessing }
MooseImportFromJdt2FamixWizard >> jdt2famixPath [

	^ Jdt2FamixSettings jdt2famixPath
]

{ #category : #'wizard panes transition' }
MooseImportFromJdt2FamixWizard >> performTerminateButtonAction [	
	MooseCustomTask
		runWithProgress:
			[:bar |
				super performTerminateButtonAction .
				self doImport.
				bar increment.
		 ]
		description: 'generating mse file with jdt2famix'
		length: 1.
	

]

{ #category : #accessing }
MooseImportFromJdt2FamixWizard >> selectJavaProjectPart [

	^ ChooseFilePart new
			yourself.
]

{ #category : #accessing }
MooseImportFromJdt2FamixWizard >> selectJdt2FamixPart [

	|tmpDefaultPath|
	tmpDefaultPath := FileSystem disk workingDirectory.
	(self jdt2famixPath asFileReference / 'jdt2famix.sh') exists
			ifTrue: [ tmpDefaultPath := self jdt2famixPath asFileReference / 'jdt2famix.sh' ].
	^ ChooseFilePart new 
		selectedPathName: tmpDefaultPath fullName;
		validExtensions: #('sh'); yourself.
]

{ #category : #actions }
MooseImportFromJdt2FamixWizard >> system: command [
	"Perform OS system() call."

	^ self ffiCall: #(int system #(char * command)) module: LibC
]
