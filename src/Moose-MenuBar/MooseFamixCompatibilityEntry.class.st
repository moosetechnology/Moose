Class {
	#name : #MooseFamixCompatibilityEntry,
	#superclass : #MooseAbstractInstallToolEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MooseFamixCompatibilityEntry class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ self toolEntryMenuCommandOn: aBuilder
]

{ #category : #'world menu' }
MooseFamixCompatibilityEntry class >> menuPriority [

	^ super menuPriority - 1
]

{ #category : #execution }
MooseFamixCompatibilityEntry >> execute [

	Metacello new
		baseline: 'FamixCompatibility';
		repository:
			'github://moosetechnology/FAMIX-Compatibility:' , self version
			, '/src';
		load
]

{ #category : #accessing }
MooseFamixCompatibilityEntry >> label [

	^ 'Famix-Compatibility'
]

{ #category : #versions }
MooseFamixCompatibilityEntry >> version [

	^ 'main'
]
