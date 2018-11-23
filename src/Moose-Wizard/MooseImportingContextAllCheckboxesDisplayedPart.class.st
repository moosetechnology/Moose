Class {
	#name : #MooseImportingContextAllCheckboxesDisplayedPart,
	#superclass : #MooseImportingContextPart,
	#category : #'Moose-Wizard'
}

{ #category : #'initialize-release' }
MooseImportingContextAllCheckboxesDisplayedPart >> initialize [

	super initialize.
	self contents: { self newGroupboxNamed: 'Context' With: contextFrame dialogWindow contentMorph .}
	
]
