"
MooseTestCommandLineHandler activateWith: (CommandLineArguments withArguments: {'--junit-xml-output'})
"
Class {
	#name : #MooseTestCommandLineHandler,
	#superclass : #TestCommandLineHandler,
	#category : #'Moose-Development-Tools'
}

{ #category : #accessing }
MooseTestCommandLineHandler class >> commandName [
	^ 'moosetest'
]

{ #category : #accessing }
MooseTestCommandLineHandler class >> description [
	^ 'A command line test runner specific for Moose'
]

{ #category : #private }
MooseTestCommandLineHandler >> addTestPackagesFrom: configVersion to: packages [
	(configVersion packagesForSpecNamed: 'Tests') do: [ :spec | 
		self addPackagesMatching: (spec name, '.*') to: packages ]
]

{ #category : #private }
MooseTestCommandLineHandler >> mooseDevelopmentVersion [
	^ ConfigurationOfMoose new project version: #development
]

{ #category : #private }
MooseTestCommandLineHandler >> packages [
	| packages |
	packages := Set new.
	self addTestPackagesFrom: self mooseDevelopmentVersion to: packages.
	(self mooseDevelopmentVersion projects reject: [:each | each name = 'OSProcess']) 
		do: [ :each | 
			self addTestPackagesFrom: each version to: packages ].
	^ packages
]
