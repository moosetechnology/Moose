Class {
	#name : #MAInternalEditorMorph,
	#superclass : #MAOneToOneMorph,
	#instVars : [
		'component'
	],
	#category : #'Magritte-Morph-Model'
}

{ #category : #testing }
MAInternalEditorMorph class >> isAbstract [
	^ false
]

{ #category : #private }
MAInternalEditorMorph >> buildComponent [
	^ self value isNil ifFalse: [ 
		(self magritteDescription reference asComponentOn: self value)
			setParent: self;
			yourself ]
]

{ #category : #accessing }
MAInternalEditorMorph >> children [
	^ Array with: self component
]

{ #category : #accessing }
MAInternalEditorMorph >> component [
	^ component ifNil: [ component := self buildComponent ]
]

{ #category : #actions }
MAInternalEditorMorph >> create [
	self value: self newRelation.
	component := nil
]

{ #category : #rendering }
MAInternalEditorMorph >> renderViewerOn: html [
	html render: (self component
		readonly: self isReadonly;
		yourself)
]
