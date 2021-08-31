"
I am the welcome window that opens when a Moose image
"
Class {
	#name : #MooseWelcome,
	#superclass : #CustomHelp,
	#category : #'Moose-Help'
}

{ #category : #accessing }
MooseWelcome class >> bookName [ 
	^ 'Moose Tutorial'
]

{ #category : #accessing }
MooseWelcome class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'Moose Help')
			order: 998; 
			parent: #Moose;
			label: 'Moose help';
			help: 'Open the Moose help documentation';
			icon: (Smalltalk ui icons iconNamed: #smallHelp);
			action: [ self open ]
]

{ #category : #accessing }
MooseWelcome class >> open [
	<script>
	^ (HelpBrowser openOn: self) next
]

{ #category : #accessing }
MooseWelcome class >> openForRelease [
	<script>
	| browser window findBlock |
	
	findBlock := [ :each | (each isKindOf: SystemWindow) and: [ each label = self bookName ] ]. 
	self currentWorld submorphs 
		detect: findBlock 
		ifFound: [ :oldWindow | oldWindow delete ].
	browser := self open.
	window := browser dependents detect: findBlock.
	window extent: 700@500.
	window center: Display extent / 2
]

{ #category : #accessing }
MooseWelcome class >> pages [
	^ #(welcome)
]

{ #category : #accessing }
MooseWelcome class >> welcome [

	| version |
	version := MooseVersion current.

	^ HelpTopic
		  title: 'Welcome to Moose ' , version major
		  contents: (self
				   heading: 'Moose ' , version versionNumber
				   withSubtitle: 'commit: ' , version commitHash printString)
			  , 'Moose is a platform for software analysis.

It allows to represent software system in a model, to query, manipulate, transform, visualize this model.

Moose based on Pharo and it''s open source under BSD/MIT.

For more information, please visit here: '
			  , (self url: 'https://modularmoose.org/moose-wiki/')
			  , (self subheading: 'Quick setup')
			  , 'Create or load a model with the '
			  ,
			  (self doItFrom: 'MiModelRootBrowser open' text: 'model browser')
]
