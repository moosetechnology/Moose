Class {
	#name : #MooseContextCheckboxesPart,
	#superclass : #MultiCheckboxesPartOld,
	#instVars : [
		'entityDependencies'
	],
	#category : #'Moose-Wizard'
}

{ #category : #'private - utilities' }
MooseContextCheckboxesPart >> checkboxForContextNamed: aContextName [
	^ allCheckboxes detect: [ :each | each label asString == aContextName ].
]

{ #category : #accessing }
MooseContextCheckboxesPart >> dependenciesFor: aCollectionOfContexts [
	"return all contexts depending of contexts in aCollectionOfContexts"
	| dependenciesForContext |

	dependenciesForContext := Set new.
	aCollectionOfContexts do: [:each | dependenciesForContext addAll: ( entityDependencies at: each)].

	dependenciesForContext size == aCollectionOfContexts size
		ifTrue: [^ dependenciesForContext ]
		ifFalse: [^ self dependenciesFor: dependenciesForContext ].
]

{ #category : #'initialize-release' }
MooseContextCheckboxesPart >> initialize: aDictionaryWithEntityDependencies [

	super initialize: (aDictionaryWithEntityDependencies keys collect: [:each | each asString]).
	entityDependencies := aDictionaryWithEntityDependencies.
	self setActionToCheckboxes .
	
]

{ #category : #accessing }
MooseContextCheckboxesPart >> revertDependenciesFor: aCollectionOfContexts [
	"return all the contexts from wich aCollectionOfContexts depends"
	| revertDependenciesForContext |

	revertDependenciesForContext := Set new.
	 entityDependencies.
	aCollectionOfContexts do: [:each | 
		entityDependencies associationsDo: [:assoc | 
		(assoc value includes: each ) ifTrue: [revertDependenciesForContext add: assoc key] ] ].
	
	revertDependenciesForContext size == aCollectionOfContexts size
	ifTrue: [ ^ revertDependenciesForContext ]
	ifFalse: [^ self revertDependenciesFor: revertDependenciesForContext ].
]

{ #category : #'morph content setup tools' }
MooseContextCheckboxesPart >> setActionToCheckboxes [
	"initialize the action to do when clicking on a checkbox"
	allCheckboxes do: [ :each | 
		each buttonMorph
				target: self;
				actionSelector: #updateCheckboxesWhenChangesOn:;
				arguments: {  (each label)  } ].
]

{ #category : #'private - utilities' }
MooseContextCheckboxesPart >> updateCheckboxesNamed: aCollectionOfLabels withState: aStateSelector [

	allCheckboxes do: 
				[ :each | (aCollectionOfLabels includes: each label asSymbol) ifTrue: [ each buttonMorph state: aStateSelector  ] ].
]

{ #category : #actions }
MooseContextCheckboxesPart >> updateCheckboxesWhenChangesOn: contextName [ 
	" when the context contextName has been selected or deselected, update all the others contexts checkboxes that are linked to this context "
	| dependenciesForContext contextCheckBox |
	contextCheckBox := self checkboxForContextNamed: contextName .
	
	({#pressed. #on} includes: contextCheckBox buttonMorph state) 
		ifTrue: 
			[ 
				dependenciesForContext := self dependenciesFor: { (contextName asSymbol)}.
				self updateCheckboxesNamed: dependenciesForContext  withState: #on.
			]
		ifFalse: 
			[ 
				dependenciesForContext := self revertDependenciesFor: {(contextName asSymbol)}.
				self updateCheckboxesNamed: dependenciesForContext  withState: #off  .
			].
		
	"self updateSelectedContext ". 
]
