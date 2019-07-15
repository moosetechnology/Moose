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
			icon: (Smalltalk ui icons iconNamed: #smallHelp);
			action: [ WebBrowser openOn: 'http://www.themoosebook.org' ]
]
