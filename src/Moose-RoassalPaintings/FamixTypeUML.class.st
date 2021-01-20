"
I show the UML representation of a FamixTType.
"
Class {
	#name : #FamixTypeUML,
	#superclass : #FamixAbstractVisualization,
	#instVars : [
		'builder',
		'famixType'
	],
	#category : #'Moose-RoassalPaintings-FamixVisualizations'
}

{ #category : #accessing }
FamixTypeUML class >> defaultTitle [
	^ 'UML class diagram'
]

{ #category : #public }
FamixTypeUML class >> forType: aFamixType [
	^ self new
		famixType: aFamixType;
		build;
		yourself
]

{ #category : #accessing }
FamixTypeUML class >> icon [
	^ MooseIcons mooseUml
]

{ #category : #building }
FamixTypeUML >> build [
	builder renderIn: self canvas
]

{ #category : #accessing }
FamixTypeUML >> famixType: aFamixType [
	famixType := aFamixType.
	builder classes: {aFamixType}
]

{ #category : #initialization }
FamixTypeUML >> initialize [
	super initialize.
	self initializeBuilder
]

{ #category : #initialization }
FamixTypeUML >> initializeBuilder [
	builder := RSUMLClassBuilder new.
	builder modelDescriptor
		instVars: [ :type | 
			(type attributes sorted: [ :a1 :a2 | a1 name < a2 name ])
				collect: #name ];
		methods: [ :type | type methods sorted: [ :m1 :m2 | m1 name < m2 name ] ];
		methodSelector: #name
]

{ #category : #accessing }
FamixTypeUML >> windowTitle [
	^ famixType name , ' UML diagram'
]
