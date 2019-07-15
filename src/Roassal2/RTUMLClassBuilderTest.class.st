Class {
	#name : #RTUMLClassBuilderTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Builder-UML'
}

{ #category : #tests }
RTUMLClassBuilderTest >> testBasic [

	| b |
	b := RTUMLClassBuilder new.
	b methodShape label
		if: [ :method | method selector beginsWith: 'init' ] color: Color green;
		if: [ :method | method selector beginsWith: 'with' ] color: Color red.
				
	b attributeShape label
		if: [ :attribute | attribute beginsWith: 'a' ] color: Color blue.
	b addObjects: RTShape withAllSubclasses.
	b treeLayout.

	b view setDefaultMenu.
	b build.

]

{ #category : #tests }
RTUMLClassBuilderTest >> testBasic02 [

	| classes classNode b |
	classes := OrderedCollection new.

	classNode := #('Node').

	b := RTUMLClassBuilder new.
	b forSelfMadeClasses.
	b addObjects: (Array with: classNode).
	b build

]
