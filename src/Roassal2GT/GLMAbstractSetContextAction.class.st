Class {
	#name : #GLMAbstractSetContextAction,
	#superclass : #GLMRoassal2Action,
	#category : #'Roassal2GT-Glamour-Actions'
}

{ #category : #accessing }
GLMAbstractSetContextAction >> category [
	^ 'Set context...'
]

{ #category : #accessing }
GLMAbstractSetContextAction >> contextClass [
	"Override to return the class to be considered"
	self subclassResponsibility
]

{ #category : #hooks }
GLMAbstractSetContextAction >> execute [
	"This method is executed by the menu offered by the Playground. Method #contextClass and #title have to be overriden"
"	self inform: self roassalPresentation hash asString."
	self contextClass setOnView: self roassalView.
	self roassalUpdate
]

{ #category : #hooks }
GLMAbstractSetContextAction >> order [
	^ 50
]

{ #category : #hooks }
GLMAbstractSetContextAction >> title [
	^ 'Set context ', self contextClass name
]
