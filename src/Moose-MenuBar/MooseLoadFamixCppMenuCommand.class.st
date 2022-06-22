"
This class adds a menu item to load github://moosetechnology/Famix-CPP
"
Class {
	#name : #MooseLoadFamixCppMenuCommand,
	#superclass : #MooseAbstractLoadModuleMenuCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #accessing }
MooseLoadFamixCppMenuCommand class >> help [

	^ 'Famix Metamodel for C++'
]

{ #category : #accessing }
MooseLoadFamixCppMenuCommand class >> label [

	^ 'Famix-Cpp'
]

{ #category : #'world menu' }
MooseLoadFamixCppMenuCommand class >> menuCommandOn: aBuilder [

	"<worldMenu>"

	"Removed from the menu since Famix-Cpp is loaded by default"

	^ self menuCommandOn: aBuilder forCommand: self
]

{ #category : #accessing }
MooseLoadFamixCppMenuCommand class >> menuPriority [

	^ 10
]

{ #category : #accessing }
MooseLoadFamixCppMenuCommand >> baselineName [

	^ 'FamixCpp'
]

{ #category : #accessing }
MooseLoadFamixCppMenuCommand >> repositoryURL [

	^ 'github://moosetechnology/Famix-CPP:' , self version , '/src'
]

{ #category : #accessing }
MooseLoadFamixCppMenuCommand >> version [

	^ 'main'
]
