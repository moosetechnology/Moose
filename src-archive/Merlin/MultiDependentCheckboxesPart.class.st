"
Instead of specifying a collection of labels as starting point (like in the superclass), here you have to specify aDictionary of dependencies. This dictionary should contains all labels mapped to the other labels they are dependent on. 
It could look like:
	#(
		label1 -> #(label2 label3)
		label2 -> #(label3)
		label3 -> #()
	)

At the end, each time you select a label, all dependents will be updated accordingly, and each time you unselect a label, all labels having it s dependent are unselected.

Example:  MerlinExamples multiDependentCheckboxesPart 
"
Class {
	#name : #MultiDependentCheckboxesPart,
	#superclass : #MultiCheckboxesPart,
	#instVars : [
		'entityDependencies'
	],
	#category : #'Merlin-Parts'
}

{ #category : #private }
MultiDependentCheckboxesPart >> checkboxForContextNamed: aContextName [

	^ self modelOfOption: aContextName.
]

{ #category : #accessing }
MultiDependentCheckboxesPart >> dependenciesFor: aCollectionOfContexts [
	"return all contexts depending of contexts in aCollectionOfContexts"
	| dependenciesForContext |

	dependenciesForContext := Set new.
	aCollectionOfContexts do: [:each | dependenciesForContext addAll: ( entityDependencies at: each)].

	dependenciesForContext size == aCollectionOfContexts size
		ifTrue: [^ dependenciesForContext ]
		ifFalse: [^ self dependenciesFor: dependenciesForContext ].
]

{ #category : #'initialize-release' }
MultiDependentCheckboxesPart >> initializeFromLabelsAndDependencies: aDictionaryWithDependencies [

	self labels: (aDictionaryWithDependencies keys collect: [:each | each asString]).
	entityDependencies := aDictionaryWithDependencies.
]

{ #category : #accessing }
MultiDependentCheckboxesPart >> labelsAndDependencies [

	^ entityDependencies
]

{ #category : #accessing }
MultiDependentCheckboxesPart >> labelsAndDependencies: aDictionary [

	"aDictionary should contains all labels mapped to the other labels they are dependent on. At the end, each time you select a label, all dependents will be updated accordingly, and each time you unselect a label, all labels having it s dependent are unselected "
	self initializeFromLabelsAndDependencies: aDictionary   
]

{ #category : #accessing }
MultiDependentCheckboxesPart >> revertDependenciesFor: aCollectionOfContexts [
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

{ #category : #'initialize-release' }
MultiDependentCheckboxesPart >> update: aChange [

	(self options includes: aChange) ifTrue: [
		self updateCheckboxesWhenChangesOn: aChange.   
		self hasChanged.
		self wizardPane refresh.
		] 
]

{ #category : #private }
MultiDependentCheckboxesPart >> updateCheckboxesNamed: aCollectionOfLabels withState: aStateSelector [

	self optionsAndModels keysAndValuesDo: [:anOption :aModel |
		 (aCollectionOfLabels includes: anOption) ifTrue: [ aModel safeContents: aStateSelector  ]
		]  
]

{ #category : #actions }
MultiDependentCheckboxesPart >> updateCheckboxesWhenChangesOn: contextName [ 
	" when the context contextName has been selected or deselected, update all the others contexts checkboxes that are linked to this context "
	| dependenciesForContext contextCheckBox |
	contextCheckBox := self checkboxForContextNamed: contextName .
	
	(contextCheckBox contents) 
		ifTrue: 
			[ 
				dependenciesForContext := self dependenciesFor: { (contextName asSymbol)}.
				self updateCheckboxesNamed: dependenciesForContext  withState: true.
			]
		ifFalse: 
			[ 
				dependenciesForContext := self revertDependenciesFor: {(contextName asSymbol)}.
				self updateCheckboxesNamed: dependenciesForContext  withState: false.
			].
]
