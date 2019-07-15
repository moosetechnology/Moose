Class {
	#name : #PackageCommitWizard,
	#superclass : #WizardControl,
	#instVars : [
		'packages'
	],
	#category : #'Moose-Wizard'
}

{ #category : #'instance creation' }
PackageCommitWizard class >> openWith: workingCopies [

	^ (self with: workingCopies) open
]

{ #category : #'instance creation' }
PackageCommitWizard class >> with: workingCopies [

	^ self new initializeContent: workingCopies
]

{ #category : #private }
PackageCommitWizard >> commitPackageSpec: packageSpec into: repositoryList with: message [

	| gofer |
	gofer := Gofer new.
	gofer disablePackageCache.
	repositoryList do: [:repository | gofer repository: repository].
	gofer package: packageSpec name.
	gofer commit: message

]

{ #category : #private }
PackageCommitWizard >> goferCommitPackage: wCopy with: commitMessage [

	| gofer |
	gofer := Gofer new.
	gofer repository: (self repositoryFor: wCopy).
	gofer package: wCopy packageName.
	gofer commit: commitMessage

]

{ #category : #'initialize-release' }
PackageCommitWizard >> initializeContent: workingCopies [

	| lastPane messagePart packagesPart |
	packages := workingCopies.
	
	messagePart := (TextEditorPart inGroupboxNamed: 'Commit Message')
					textEditorVerticalSize: 175;
					textEditorHorizontalSize: 300;
					yourself.
	packagesPart := TextPart 
					on: [:requiredInputs | self stringForPackages: workingCopies] 
					inGroupBoxNamed: 'Packages'.

	lastPane := WizardLastPane named: 'Save dirty packages'.	
	
	lastPane 
		column: [:c |
			c row: messagePart associatedTo: #message.
			];
		column: packagesPart associatedTo: #packages.
	self addPane: lastPane

]

{ #category : #'wizard panes transition' }
PackageCommitWizard >> performTerminateButtonAction [

	| sourceVersion targetVersion versionSelector blessing commitMessage project version dirtyPackages category projectMessage |
	
	super performTerminateButtonAction.
	commitMessage := wizardInformations at: #message.
		
	"save packages"
	packages do: [:wCopy |
		self goferCommitPackage: wCopy with: commitMessage ].

]

{ #category : #private }
PackageCommitWizard >> repositoryFor: workingCopy [ 

	^ workingCopy repositoryGroup disableCache repositories first

]

{ #category : #private }
PackageCommitWizard >> stringForPackages: workingCopies [

	| assoc |
	^ String streamContents: [:str |
		workingCopies do: [:workingCopy |
			str
				nextPutAll: workingCopy packageName;
				nextPutAll: ' -> ';
				nextPutAll: (self repositoryFor: workingCopy) description;
				cr ]
		]

]
