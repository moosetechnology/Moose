"
PPBrowser support class that actually performs the reactorings.
"
Class {
	#name : #PPRefactoringUtils,
	#superclass : #Object,
	#category : #'PetitGui-Core'
}

{ #category : #'private refactoring' }
PPRefactoringUtils >> handleError: anException [
	anException actionBlock isNil
		ifTrue: [ UIManager default inform: anException messageText ]
		ifFalse: [ 
			(UIManager default confirm: anException messageText) 
				ifTrue: [ anException actionBlock value ] ].
	anException return
]

{ #category : #'private refactoring' }
PPRefactoringUtils >> handleWarning: anException [ 
	| message |
	message := (anException messageText endsWith: '?')
		ifTrue: [ anException messageText ]
		ifFalse: [ anException messageText , String cr , 'Do you want to proceed?' ].
	(UIManager default confirm: message)
		ifTrue: [ anException resume ]
		ifFalse: [ anException return ]
]

{ #category : #'private refactoring' }
PPRefactoringUtils >> performRefactoring: aRefactoring [
	[ [ aRefactoring execute ]
		on: RBRefactoringWarning
		do: [ :exception | self handleWarning: exception ] ]
		on: RBRefactoringError
		do: [ :exception | self handleError: exception ]
]

{ #category : #'private refactoring' }
PPRefactoringUtils >> performRenameProduction: oldName from: class [
	| refactoring newName |
	newName := UIManager default request: 'Production name:' initialAnswer: oldName.
	refactoring := PPRenameProdcutionRefactoring onClass: class rename: oldName to: newName.
	self performRefactoring: refactoring.
	^ refactoring
]
