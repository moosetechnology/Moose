Class {
	#name : #RTInteractiveComposerExample,
	#superclass : #RTObject,
	#category : #'Roassal2-InteractiveComposer'
}

{ #category : #examples }
RTInteractiveComposerExample >> example01 [
	<script: 'self new example01'>
	<noTest>
| i b |
i := RTInteractiveComposer new.

i forCollectionOf: Class do: [ :someClasses |
	b := RTMondrian new.
	b nodes: someClasses.
	b normalizer normalizeSize: #numberOfMethods; 	normalizeColor: #numberOfLinesOfCode.
	b layout flow.
	b ].

i for: Class do: [ :aClass |
	b := RTMondrian new.
	b shape label text: #selector.
	b nodes: aClass methods.
	b edges connectToAll: #dependentMethods.
	b layout force.
	b
].

i openOn: Collection withAllSubclasses.

]

{ #category : #examples }
RTInteractiveComposerExample >> example02 [
	<script: 'self new example02'>
	<noTest>
| i b |
i := RTInteractiveComposer new.

i forCollectionOf: Class do: [ :someClasses |
	b := RTMondrian new.
	b nodes: someClasses.
	b normalizer normalizeSize: #numberOfMethods; 	normalizeColor: #numberOfLinesOfCode.
	b layout flow.
	b ].

i for: Class do: [ :aClass |
	b := RTMondrian new.
	b nodes: aClass methods.
	b edges connectToAll: #dependentMethods.
	b layout tree.
	b normalizer normalizeSize: #numberOfLinesOfCode.
	b
].

i for: CompiledMethod do: [ :aMethod |
	b := RTMondrian new.
	b shape label.
	b node: aMethod.
	b
].

i openOn: Collection withAllSubclasses.

]
