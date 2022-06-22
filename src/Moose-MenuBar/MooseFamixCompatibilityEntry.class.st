Class {
	#name : #MooseFamixCompatibilityEntry,
	#superclass : #MooseAbstractInstallToolEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MooseFamixCompatibilityEntry class >> help [

	^ 'Old Famix Metamodel - Not maintained anymore'
]

{ #category : #'world menu' }
MooseFamixCompatibilityEntry class >> label [

	^ 'Famix-Compatibility'
]

{ #category : #'world menu' }
MooseFamixCompatibilityEntry class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self toolEntryMenuCommandOn: aBuilder
]

{ #category : #'world menu' }
MooseFamixCompatibilityEntry class >> menuPriority [

	^ super menuPriority - 1
]

{ #category : #accessing }
MooseFamixCompatibilityEntry >> baselineName [

	^ 'FamixCompatibility'
]

{ #category : #accessing }
MooseFamixCompatibilityEntry >> repositoryURL [

	^ 'github://moosetechnology/FAMIX-Compatibility:' , self version
	  , '/src'
]

{ #category : #accessing }
MooseFamixCompatibilityEntry >> version [

	^ 'main'
]
