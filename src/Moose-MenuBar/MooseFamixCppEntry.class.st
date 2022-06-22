"
This class adds a menu item to load github://moosetechnology/Famix-CPP
"
Class {
	#name : #MooseFamixCppEntry,
	#superclass : #MooseAbstractInstallToolEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MooseFamixCppEntry class >> help [

	^ 'Famix Metamodel for C++'
]

{ #category : #'world menu' }
MooseFamixCppEntry class >> label [

	^ 'Famix-Cpp'
]

{ #category : #'world menu' }
MooseFamixCppEntry class >> menuCommandOn: aBuilder [

	"<worldMenu>"

	"Removed from the menu since Famix-Cpp is loaded by default"

	^ self toolEntryMenuCommandOn: aBuilder
]

{ #category : #'world menu' }
MooseFamixCppEntry class >> menuPriority [

	^ -10
]

{ #category : #accessing }
MooseFamixCppEntry >> baselineName [

	^ 'FamixCpp'
]

{ #category : #accessing }
MooseFamixCppEntry >> repositoryURL [

	^ 'github://moosetechnology/Famix-CPP:' , self version , '/src'
]

{ #category : #accessing }
MooseFamixCppEntry >> version [

	^ 'main'
]
