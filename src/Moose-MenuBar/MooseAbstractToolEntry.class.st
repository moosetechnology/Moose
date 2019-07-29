Class {
	#name : #MooseAbstractToolEntry,
	#superclass : #MooseAbstractMenuEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MooseAbstractToolEntry class >> allToolClasses [
	^ self subclasses reject: #isCategory
]

{ #category : #testing }
MooseAbstractToolEntry class >> isCategory [
	^ self name = #MooseAbstractToolEntry
]

{ #category : #'world menu' }
MooseAbstractToolEntry class >> menuCommandOn: aBuilder [
	<worldMenu>
	| b |
	b := ((aBuilder
		item: self menuConfigurationSymbol;
		order: 15;
		parent: #Moose) icon: MooseIcons mooseIcon)
		yourself.
	b
		with: [ self allToolClasses
						do: [ :cls | 
							(aBuilder item: cls new label)
								order: 20;
								parent: self menuConfigurationSymbol;
								label: cls new label;
								help: cls new label;
								icon: MooseIcons mooseIcon;
								action: [ cls new run ] ] ].
]

{ #category : #'world menu' }
MooseAbstractToolEntry class >> menuConfigurationSymbol [
	^ #'Moose Tools'
]
