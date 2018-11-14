Class {
	#name : #RTInteractiveComposerTest,
	#superclass : #TestCase,
	#instVars : [
		'i'
	],
	#category : #'Roassal2-InteractiveComposer'
}

{ #category : #running }
RTInteractiveComposerTest >> setUp [
	i := RTInteractiveComposer new.
]

{ #category : #tests }
RTInteractiveComposerTest >> testBasic [
	| b window |
	i
		forCollectionOf: Class
		do: [ :someClasses | 
			b := RTMondrian new.
			b nodes: someClasses.
			b normalizer
				normalizeSize: #numberOfMethods;
				normalizeColor: #numberOfLinesOfCode.
			b layout flow.
			b ].
	i
		for: Class
		do: [ :aClass | 
			b := RTMondrian new.
			b shape label text: #selector.
			b nodes: aClass rtmethods.
			b edges connectToAll: #dependentMethods.
			b layout grid.
			b ].
	window := i openOn: Collection withAllSubclasses.
	window delete.
	
	(i openOn: Collection) delete.
	(i openOn: Array) delete.
	i openOn: 'hello world'
]

{ #category : #tests }
RTInteractiveComposerTest >> testBasic2 [
	| b w1 w2 w3 |
	i
		forCollectionOf: Class
		do: [ :someClasses | 
			b := RTMondrian new.
			b nodes: someClasses.
			b normalizer
				normalizeSize: #numberOfMethods;
				normalizeColor: #numberOfLinesOfCode.
			b layout flow.
			b ].
	i
		for: Class
		do: [ :aClass | 
			b := RTMondrian new.
			b nodes: aClass rtmethods.
			b edges connectToAll: #dependentMethods.
			b layout tree.
			b normalizer normalizeSize: #numberOfLinesOfCode.
			b ].
	i
		for: CompiledMethod
		do: [ :aMethod | 
			b := RTMondrian new.
			b shape label.
			b node: aMethod sourceCode.
			b ].
	
	self assert: (i ruleFor: Array methods first) notNil.
		
	w1 := i openOn: Collection withAllSubclasses.
	w2 := i openOn: Array.
	w3 := i openOn: Array rtmethods first.
	w1 delete.
	w2 delete.
	w3 delete.
]
