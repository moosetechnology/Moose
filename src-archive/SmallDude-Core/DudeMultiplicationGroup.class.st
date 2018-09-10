"
a group of duplication groups should store a bunch of distinct clone groups


"
Class {
	#name : #DudeMultiplicationGroup,
	#superclass : #MooseGroup,
	#category : #'SmallDude-Core'
}

{ #category : #meta }
DudeMultiplicationGroup class >> annotation [
	<MSEClass: #MultiplicationGroup super: #MooseGroup>
	<package: #Dude>
]

{ #category : #roassal }
DudeMultiplicationGroup >> browseConstellation [
	<menuItem: 'Constellation' category: 'Browse'>
	
	MooseBrowsers new multiplicationConstellationBrowser openOn: self
]

{ #category : #selection }
DudeMultiplicationGroup >> selectWhereAnyFragment: aBlock [ 
	 
	^self 
		select: 
			[:aMultiplication |  
			| sel | 
			sel := false. 
			aMultiplication fragments 
				do: [:elem | (aBlock value: elem) ifTrue: [sel := true]]. 
			sel]
]

{ #category : #roassal }
DudeMultiplicationGroup >> viewConstellation [
	<menuItem: 'View Multiplication constelation' category: 'Visualize'>

	| view |
	view := RTMondrian new.
	self viewConstellationOn: view.
	^ view openWithToolbar title: 'View Multiplication constelation'
]

{ #category : #roassal }
DudeMultiplicationGroup >> viewConstellationOn: view [
	| multipliedEntities  |
	multipliedEntities := (self flatCollect: #multiplyingEntities) asSet.
	view interaction popupText: [:each | each multiplyingEntities collect: #name ].
	view shape rectangle size: 1.
	view nodes: self.
	view shape rectangle 
		fillColor: Color lightGray;
		size: 10.
	view nodes: multipliedEntities.
	view shape line color: Color veryVeryLightGray.
	view edges source: self connectFrom: #yourself toAll: #multiplyingEntities.
	view layout force "graphvizLayout circo"
]
