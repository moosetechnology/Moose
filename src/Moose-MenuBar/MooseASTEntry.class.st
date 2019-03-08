Class {
	#name : #MooseASTEntry,
	#superclass : #MooseAbstractInstallToolEntry,
	#category : #'Moose-MenuBar'
}

{ #category : #execution }
MooseASTEntry class >> isCategory [
	^ self name = #MooseASTEntry
]

{ #category : #'world menu' }
MooseASTEntry class >> menuCommandOn: aBuilder [
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
								order: 20;
								parent: self menuConfigurationSymbol;
								label: 'Load ', cls new label;
								help:'Load ', cls new label;
								icon: MooseIcons mooseIcon;
								action: [ cls new run ] ] ].
]

{ #category : #'world menu' }
MooseASTEntry class >> menuConfigurationSymbol [
	^ #'AST Representation'
]

{ #category : #execution }
MooseASTEntry >> label [
	^ 'AST representation'
]
