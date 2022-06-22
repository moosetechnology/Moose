Class {
	#name : #MooseLoadFamixCompatibilityCommand,
	#superclass : #MooseAbstractLoadModuleCommand,
	#category : #'Moose-MenuBar-Commands'
}

{ #category : #'world menu' }
MooseLoadFamixCompatibilityCommand class >> help [

	^ 'Old Famix Metamodel - Not maintained anymore'
]

{ #category : #'world menu' }
MooseLoadFamixCompatibilityCommand class >> label [

	^ 'Famix-Compatibility'
]

{ #category : #'world menu' }
MooseLoadFamixCompatibilityCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ (self menuCommandOn: aBuilder forCommand: self) withSeparatorAfter
]

{ #category : #'world menu' }
MooseLoadFamixCompatibilityCommand class >> menuPriority [

	^ 20
]

{ #category : #accessing }
MooseLoadFamixCompatibilityCommand >> baselineName [

	^ 'FamixCompatibility'
]

{ #category : #accessing }
MooseLoadFamixCompatibilityCommand >> repositoryURL [

	^ 'github://moosetechnology/FAMIX-Compatibility:' , self version
	  , '/src'
]

{ #category : #accessing }
MooseLoadFamixCompatibilityCommand >> version [

	^ 'main'
]
