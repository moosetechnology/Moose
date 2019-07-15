"
self new open
"
Class {
	#name : #MooseFameView,
	#superclass : #Object,
	#category : #'Moose-RoassalPaintings-FameView'
}

{ #category : #opening }
MooseFameView >> open [
	^ self openOn: MooseModel meta
]

{ #category : #opening }
MooseFameView >> openOn: aMetamodel [ 
	"
		self new openOn: MooseModel meta.
		
		self new openOn: FMMetaRepository fm3.
	"
	^ self viewFameClasses: aMetamodel classes
]

{ #category : #private }
MooseFameView >> propertyLabel: aFM3Property [
	
	^ String streamContents: [ :str |
		( aFM3Property isDerived ) ifTrue: [ str nextPut: $/ ].
		str nextPutAll: aFM3Property name copy.
		str nextPut: $: ; nextPut: $ ; nextPutAll: aFM3Property type name.
		( aFM3Property isMultivalued ) ifTrue: [ str nextPut: $* ].
		( aFM3Property hasOpposite ) ifTrue: [ str nextPutAll: ' -> ', aFM3Property opposite name ]		
	]

]

{ #category : #private }
MooseFameView >> viewFameClasses: classes [
	| view |
	view := RTUMLClassBuilder new.
	self viewFameClasses: classes on: view.
	^ view openWithToolbarEntitled: 'Fame UML'
]

{ #category : #private }
MooseFameView >> viewFameClasses: classes on: view [

	^ view
		addObjects: classes;
		classname: #name;
		instanceVariables: #allAttributes;
		methodsNames: {};
		superclass: #superclass;
		treeLayout
]

{ #category : #opening }
MooseFameView >> viewFamixCore [
	" This method displays Famix core classes i.e., Famix classes declared in FAMIX package."
	^ self viewFameClasses: (
		FamixCompatibilityGenerator metamodel classes" select: [ :fameClass | fameClass package notNil and: [fameClass package name = #FAMIX ]]")
]
