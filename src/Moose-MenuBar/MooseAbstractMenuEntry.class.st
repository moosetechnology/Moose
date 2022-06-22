Class {
	#name : #MooseAbstractMenuEntry,
	#superclass : #Object,
	#category : #'Moose-MenuBar'
}

{ #category : #'world menu' }
MooseAbstractMenuEntry class >> famixToolsMenuSymbol [

	^ #'Famix Tools'
]

{ #category : #'world menu' }
MooseAbstractMenuEntry class >> label [
	self subclassResponsibility
]

{ #category : #'world menu' }
MooseAbstractMenuEntry class >> menuCommandOn: aBuilder [

	<worldMenu>
	^ aBuilder
		  item: self famixToolsMenuSymbol;
		  order: 100;
		  parent: #Tools;
		  icon: MooseIcons mooseIcon;
		  withSeparatorAfter;
		  yourself
]

{ #category : #execution }
MooseAbstractMenuEntry >> execute [
	"Code to be executed"
	self subclassResponsibility
]

{ #category : #execution }
MooseAbstractMenuEntry >> run [
	self execute
]
