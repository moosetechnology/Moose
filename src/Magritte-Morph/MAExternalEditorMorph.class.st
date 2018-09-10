Class {
	#name : #MAExternalEditorMorph,
	#superclass : #MAOneToOneMorph,
	#category : #'Magritte-Morph-Model'
}

{ #category : #testing }
MAExternalEditorMorph class >> isAbstract [
	^ false
]

{ #category : #actions }
MAExternalEditorMorph >> create [
	self newRelation asMagritteMorph
		onAnswer: [ :result | result isNil ifFalse: [ self value: result ] ];
		addButtons; 
		addWindow;
		openInWorld
]

{ #category : #actions }
MAExternalEditorMorph >> edit [
	self chooser: (self editorFor: self value)
]

{ #category : #rendering }
MAExternalEditorMorph >> renderButtonsOn: html [
	html submitButton on: #remove of: self.
	html submitButton on: #edit of: self
]

{ #category : #rendering }
MAExternalEditorMorph >> renderViewerOn: html [
	html render: (self reference toString: self value)
]
