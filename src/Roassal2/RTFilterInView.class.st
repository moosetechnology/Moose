"
This interaction adds a set of menu in the view to filter in and out some elements
Here is an example:
-=-=-=
| b |
b := RTMondrian new.
b shape box size: #numberOfMethods.
b nodes: (Collection withAllSubclasses).
b layout grid.
b normalizer normalizeColor: #numberOfMethods.
b view @ RTFilterInView.
b 
-=-=-=

With edges:
-=-=-=
| b |
b := RTMondrian new.
b shape box size: #numberOfMethods.
b nodes: (Collection withAllSubclasses).
b normalizer normalizeColor: #numberOfMethods.
b edges connectFrom: #superclass.
b layout tree.

b view @ RTFilterInView.

b 
-=-=-=

"
Class {
	#name : #RTFilterInView,
	#superclass : #RTAbstractHighlightElementsInView,
	#category : #'Roassal2-Interactions'
}

{ #category : #hooks }
RTFilterInView >> askForPattern [
	^ TRPlatform current
		dialogRequest:
			'Enter a regular expression'
		initialAnswer: '*aPattern*'
]

{ #category : #hooks }
RTFilterInView >> filterInUsing: aString [

	| elements |
	elements := self getRelevantElementsFor: aString.
	(view elements copyWithoutAll: elements) do: [ :el | el trachelShape hide ].
	view signalUpdate.
]

{ #category : #hooks }
RTFilterInView >> filterOutUsing: aString [

	| elements |
	elements := self getRelevantElementsFor: aString.
	elements do: [ :el | el trachelShape hide ].
	view signalUpdate.
]

{ #category : #hooks }
RTFilterInView >> initializeElement: aView [
	| string |
	super initializeElement: aView.
	view
		addMenu: 'FilterIn'
		callback: [ string := self askForPattern.
			string ifNotNil:
				[ self filterInUsing: string ] ].

	view
		addMenu: 'FilterOut'
		callback: [ string := self askForPattern.
			string ifNotNil:
				[ self filterOutUsing: string ] ].
		
	view
		addMenu: 'Reset'
		callback: [ self reset ]
]

{ #category : #hooks }
RTFilterInView >> reset [
	view elements do: [ :el | el trachelShape show ]
]
