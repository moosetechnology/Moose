Class {
	#name : #MooseParserEntry,
	#superclass : #MooseAbstractInstallToolEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #execution }
MooseParserEntry class >> isCategory [
	^ self name = #MooseParserEntry
]

{ #category : #'world menu' }
MooseParserEntry class >> menuCommandOn: aBuilder [
	<worldMenu>
	| b |
	b := ((aBuilder
		item: self menuConfigurationSymbol;
		order: 15;
		parent: super menuConfigurationSymbol) icon: MooseIcons mooseIcon)
		yourself.
	b
		with: [ self allToolClasses
						do: [ :cls | 
							(aBuilder item: cls new label)
								order: 15;
								parent: self menuConfigurationSymbol;
								label: 'Load ', cls new label;
								help:'Load ', cls new label;
								icon: MooseIcons mooseIcon;
								action: [ cls new run ] ] ].
]

{ #category : #'world menu' }
MooseParserEntry class >> menuConfigurationSymbol [
	^ #'Moose Parser'
]

{ #category : #execution }
MooseParserEntry >> label [
	^ 'Parser'
]
