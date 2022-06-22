"
This class adds a menu item to load github://moosetechnology/Famix-CPP
"
Class {
	#name : #MooseLoadFamixCppCommand,
	#superclass : #MooseAbstractLoadModuleCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #'world menu' }
MooseLoadFamixCppCommand class >> help [

	^ 'Famix Metamodel for C++'
]

{ #category : #'world menu' }
MooseLoadFamixCppCommand class >> label [

	^ 'Famix-Cpp'
]

{ #category : #'world menu' }
MooseLoadFamixCppCommand class >> menuCommandOn: aBuilder [

	"<worldMenu>"

	"Removed from the menu since Famix-Cpp is loaded by default"

	^ self menuCommandOn: aBuilder forCommand: self
]

{ #category : #'world menu' }
MooseLoadFamixCppCommand class >> menuPriority [

	^ 10
]

{ #category : #accessing }
MooseLoadFamixCppCommand >> baselineName [

	^ 'FamixCpp'
]

{ #category : #accessing }
MooseLoadFamixCppCommand >> repositoryURL [

	^ 'github://moosetechnology/Famix-CPP:' , self version , '/src'
]

{ #category : #accessing }
MooseLoadFamixCppCommand >> version [

	^ 'main'
]
