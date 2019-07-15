"
An Explora builder that do not try to guess what is coming to step before 
"
Class {
	#name : #RTExploraBuilderLazy,
	#superclass : #RTExploraBuilder,
	#category : #'Roassal2-Builder-Explora'
}

{ #category : #'as yet unclassified' }
RTExploraBuilderLazy >> buildNode: object parent: parent [
	| node element elementIconOpen elementIconClose |
	
	node := RTExploraNodeLazy new.
	node builder: self.
	node id: self newNodeId.
	node parentNode: parent.
	element := RTElement new model: object.	
	node element: element.
	
	element addShape: self shape shape.
	
	dragChildren ifTrue: [ element @ RTDraggableChildren ] ifFalse: [ element @ RTDraggable ].
	popUp ifTrue: [ element @ (RTPopup new text: popupText) ].
	
	(icons) ifNotNil: [ 

		elementIconOpen := (icons first) elementOn: #iconOpen.
		elementIconClose := (icons second) elementOn: #iconClose.
		
		RTConstraint move: ((Array with: elementIconOpen with: elementIconClose) asGroup) onTheRightOf: element.

		element addCallback: (TRTranslationCallback new block: [
			TRConstraint move: ((Array with: elementIconOpen with: elementIconClose) asGroup) onTheRightOf:element. 		
			self view signalUpdate
			]).
	
		node iconOpen: elementIconOpen.
		node iconClose: elementIconClose.
		]. 

	nodeListeners do: [ :block | block value: node ].
	
	^ node
]
