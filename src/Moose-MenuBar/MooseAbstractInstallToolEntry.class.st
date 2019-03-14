Class {
	#name : #MooseAbstractInstallToolEntry,
	#superclass : #MooseAbstractMenuEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MooseAbstractInstallToolEntry class >> allToolClasses [
	^ self subclasses reject: #isCategory
]

{ #category : #testing }
MooseAbstractInstallToolEntry class >> isCategory [
	^ false
]

{ #category : #'world menu' }
MooseAbstractInstallToolEntry class >> menuCommandOn: aBuilder [
	<worldMenu>
	| b |
	b := ((aBuilder
		item: self menuConfigurationSymbol;
		order: 15;
		parent: #Moose) icon: MooseIcons mooseIcon)
		withSeparatorAfter;
		yourself.
	b
		with: [ self allToolClasses
						do: [ :cls | 
							(aBuilder item: cls new label)
								order: 20;
								parent: self menuConfigurationSymbol;
								label: 'Load ', cls new label;
								help:'Load ', cls new label;
								icon: MooseIcons mooseIcon;
								action: [ cls new run ] ] ].
]

{ #category : #'world menu' }
MooseAbstractInstallToolEntry class >> menuConfigurationSymbol [
	^ #'Mosse Tools'
]
