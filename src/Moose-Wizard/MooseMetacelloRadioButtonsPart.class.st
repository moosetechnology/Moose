Class {
	#name : #MooseMetacelloRadioButtonsPart,
	#superclass : #WizardPart,
	#instVars : [
		'option'
	],
	#category : #'Moose-Wizard'
}

{ #category : #'radio buttons model' }
MooseMetacelloRadioButtonsPart >> beBranchDev [

	self option: #branchDev
]

{ #category : #'radio buttons model' }
MooseMetacelloRadioButtonsPart >> beMainDev [

	self option: #mainDev
]

{ #category : #'radio buttons model' }
MooseMetacelloRadioButtonsPart >> beRelease [

	self option: #release
]

{ #category : #accessing }
MooseMetacelloRadioButtonsPart >> defaultSelection: aSymbol [

	aSymbol = #branchDev
		ifTrue: [ self beBranchDev ]
		ifFalse: [ self beMainDev ]
]

{ #category : #initialization }
MooseMetacelloRadioButtonsPart >> initialize [ 
	
	super initialize.
	self populateContents: {
	self newGroupboxNamed: 'Commit type' With:
		(self newColumnWith: {
		self newMainDevRadioButton.
		self newBranchDevRadioButton. 
		self newReleaseRadioButton    	
		 })}
]

{ #category : #'radio buttons model' }
MooseMetacelloRadioButtonsPart >> isBranchDev [

	^ option = #branchDev
]

{ #category : #'radio buttons model' }
MooseMetacelloRadioButtonsPart >> isMainDev [

	^ option = #mainDev
]

{ #category : #'radio buttons model' }
MooseMetacelloRadioButtonsPart >> isRelease [

	^ option = #release
]

{ #category : #'morph content setup tools' }
MooseMetacelloRadioButtonsPart >> newBranchDevRadioButton [

	^ self newRadionButtonFor: self 
			getSelected: #isBranchDev 
			setSelected: #beBranchDev 
			label: 'Branch developement'



]

{ #category : #'morph content setup tools' }
MooseMetacelloRadioButtonsPart >> newMainDevRadioButton [

	^ self newRadionButtonFor: self 
			getSelected: #isMainDev 
			setSelected: #beMainDev 
			label: 'Main developement'



]

{ #category : #'morph content setup tools' }
MooseMetacelloRadioButtonsPart >> newReleaseRadioButton [

	^ self newRadionButtonFor: self 
			getSelected: #isRelease 
			setSelected: #beRelease 
			label: 'Release'



]

{ #category : #'radio buttons model' }
MooseMetacelloRadioButtonsPart >> option [ 
	^ option
]

{ #category : #'radio buttons model' }
MooseMetacelloRadioButtonsPart >> option: aSymbol [
	"Set the value of option"

	option := aSymbol.
	self
		changed: #isBranchDev;
		changed: #isMainDev;
		changed: #isRelease
]

{ #category : #'accessing - wizard mangement' }
MooseMetacelloRadioButtonsPart >> outputValue [

	^ option
]
