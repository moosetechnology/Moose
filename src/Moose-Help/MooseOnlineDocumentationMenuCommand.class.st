"
I represent the action of opening Moose-wiki in a web browser.
I am used to build an item in the 'Help' menu of Pharo.
"
Class {
	#name : #MooseOnlineDocumentationMenuCommand,
	#superclass : #MooseAbstractMenuCommand,
	#category : #'Moose-Help'
}

{ #category : #accessing }
MooseOnlineDocumentationMenuCommand class >> help [

	^ 'Open the Moose documentation in a web browser'
]

{ #category : #accessing }
MooseOnlineDocumentationMenuCommand class >> icon [

	^ Smalltalk ui icons iconNamed: #remote
]

{ #category : #accessing }
MooseOnlineDocumentationMenuCommand class >> label [

	^ 'Moose online documentation'
]

{ #category : #'world menu' }
MooseOnlineDocumentationMenuCommand class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ (self menuCommandOn: aBuilder forCommand: self) withSeparatorAfter
]

{ #category : #accessing }
MooseOnlineDocumentationMenuCommand class >> menuPriority [

	^ 0
]

{ #category : #'world menu' }
MooseOnlineDocumentationMenuCommand class >> menuRoot [

	^ #Help
]

{ #category : #execution }
MooseOnlineDocumentationMenuCommand >> execute [

	WebBrowser openOn: 'https://modularmoose.org/moose-wiki/'
]
