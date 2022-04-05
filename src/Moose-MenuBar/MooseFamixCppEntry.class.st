"
This class adds a menu item to load github://moosetechnology/Famix-CPP
"
Class {
	#name : #MooseFamixCppEntry,
	#superclass : #MooseAbstractInstallToolEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MooseFamixCppEntry class >> menuCommandOn: aBuilder [
	"method needed for the pragma"
	<worldMenu>
	^self toolEntryMenuCommandOn: aBuilder
]

{ #category : #'world menu' }
MooseFamixCppEntry class >> menuPriority [
	^ 60
]

{ #category : #execution }
MooseFamixCppEntry >> execute [
	Metacello new
    baseline: 'FamixCpp';
    repository: 'github://moosetechnology/Famix-CPP:',self version, '/src';
    load.
]

{ #category : #execution }
MooseFamixCppEntry >> label [
	^ 'Famix-Cpp'
]

{ #category : #execution }
MooseFamixCppEntry >> version [
	^ 'main'
]
