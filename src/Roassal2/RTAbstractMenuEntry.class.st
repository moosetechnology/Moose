Class {
	#name : #RTAbstractMenuEntry,
	#superclass : #RTObject,
	#category : #'Roassal2-Plugins'
}

{ #category : #'world menu' }
RTAbstractMenuEntry class >> menuConfigurationEntryTitle [
	^ #'Plugin: '
]

{ #category : #'world menu' }
RTAbstractMenuEntry class >> menuConfigurationSymbol [
	^ #RoassalPlugin
]

{ #category : #public }
RTAbstractMenuEntry >> configurationMessage [
	^ self subclassResponsibility 
]

{ #category : #accessing }
RTAbstractMenuEntry >> description [
	^ self subclassResponsibility 
]

{ #category : #hooks }
RTAbstractMenuEntry >> execute [
	"Code to be executed"
	self subclassResponsibility
]

{ #category : #testing }
RTAbstractMenuEntry >> isEnabled [
	^ true
	
]

{ #category : #hooks }
RTAbstractMenuEntry >> label [
	"Menu entry"
	^ 'Need to define'
]

{ #category : #'public - useful snippet' }
RTAbstractMenuEntry >> loadPeterFileDialog [
	"
	self new loadPeterFileDialog
	"

	Metacello new
	    baseline: 'FileDialog';
	    repository: 'github://peteruhnak/file-dialog/repository';
	    load.
	(Smalltalk at: #FDMorphicUIManager) new beDefault
]

{ #category : #'public - useful snippet' }
RTAbstractMenuEntry >> loadPeterFileDialogIfNecessary [
	"
	self new loadPeterFileDialogIfNecessary
	"
	(Smalltalk includesKey: #FDOpenFileDialog) ifFalse: [
		Metacello new
		    baseline: 'FileDialog';
		    repository: 'github://peteruhnak/file-dialog/repository';
		    load ].
"	(Smalltalk at: #FDMorphicUIManager) new beDefault"
]

{ #category : #public }
RTAbstractMenuEntry >> run [
	| answer |
	self description notEmpty ifTrue: [ 
		answer := UIManager default
			confirm: self description
			label:
				self configurationMessage , self label , '?'.
		answer ifNil: [ ^ self ].
		answer
			ifTrue: [ self execute ]
	] ifFalse: [ self execute ]
	
]
