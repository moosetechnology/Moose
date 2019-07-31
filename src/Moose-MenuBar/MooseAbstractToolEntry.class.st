Class {
	#name : #MooseAbstractToolEntry,
	#superclass : #MooseAbstractMenuEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MooseAbstractToolEntry class >> allToolClasses [
	^ self subclasses reject: #isCategory
]

{ #category : #'world menu' }
MooseAbstractToolEntry class >> allToolPragma [
	^ (PragmaCollector filter: [:prg | prg keyword = 'mooseTool:']) reset; collected
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
		parent: #Moose) icon: MooseIcons mooseIcon) yourself.
	self allToolPragma
		do: [ :pragma |
			| label |
			label := pragma argumentAt: 1.
			(aBuilder item: label)
				order: 20;
				parent: self menuConfigurationSymbol;
				label: label;
				help: label;
				icon: MooseIcons mooseIcon;
				action: [ pragma method valueWithReceiver: pragma method methodClass soleInstance arguments: #()  ] ].
	b
		with: [ self allToolClasses
				do: [ :cls | 
					(aBuilder item: cls new label)
						order: 20;
						parent: self menuConfigurationSymbol;
						label: cls new label;
						help: cls new label;
						icon: MooseIcons mooseIcon;
						action: [ cls new run ] ] ]
]

{ #category : #'world menu' }
MooseAbstractToolEntry class >> menuConfigurationSymbol [
	^ #'Moose Tools'
]
