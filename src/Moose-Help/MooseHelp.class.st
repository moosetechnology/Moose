"
I am the class responsible for giving help on Moose

"
Class {
	#name : #MooseHelp,
	#superclass : #Object,
	#category : #'Moose-Help'
}

{ #category : #'world menu' }
MooseHelp class >> menuCommandOn: aBuilder [

	<worldMenu>
	(aBuilder item: #'Online documentation')
		order: 999;
		parent: #Moose;
		label: 'Online documentation';
		help: 'Open the Moose documentation in a web browser';
		icon: (Smalltalk ui icons iconNamed: #remote);
		action: [ WebBrowser openOn: 'https://modularmoose.org/moose-wiki/' ]
]
