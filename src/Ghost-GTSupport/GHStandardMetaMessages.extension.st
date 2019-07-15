Extension { #name : #GHStandardMetaMessages }

{ #category : #'*Ghost-GTSupport' }
GHStandardMetaMessages >> asGlamorousArray [ 
	 
	^Array with: ghost
]

{ #category : #'*Ghost-GTSupport' }
GHStandardMetaMessages >> asGlamorousMultiValue [
	^ GLMMultiValue with: ghost
]

{ #category : #'*Ghost-GTSupport' }
GHStandardMetaMessages >> gtDebuggerPresentationsIn: composite inContext: aGTInspector [
	| pragmas |
	pragmas := (Pragma 
				allNamed: #gtDebuggerPresentationOrder: 
				from: self metaMessagesClass 
				to: ProtoObject) asOrderedCollection.
	pragmas addAll:((Pragma 
				allNamed: #gtInspectorPresentationOrder: 
				from: self metaMessagesClass 
				to: ProtoObject)
					reject: [:pragma| pragma methodSelector = #gtInspectorRawIn: ]).
	pragmas := pragmas sorted: [: x :y | (x argumentAt: 1) < (y argumentAt: 1)].
	self gtInspectorPresentationsFromPragmas: pragmas In: composite inContext: aGTInspector

]

{ #category : #'*Ghost-GTSupport' }
GHStandardMetaMessages >> gtDisplayOn: stream [
	super gtDisplayOn: stream
]

{ #category : #'*Ghost-GTSupport' }
GHStandardMetaMessages >> gtDisplayString [
	
	^self printString
]

{ #category : #'*Ghost-GTSupport' }
GHStandardMetaMessages >> gtInspectorActions [
	"This is a utility method that allows each object to define a set of actions 
	specific for itself. These actions are used when the object appears in the inspector.

	The actions are collected based on the #gtInspectorAction pragma that are defined in
	unary methods corresponding to the body of the actions"
	
	| all |
	all := (Pragma 
				allNamed: #gtInspectorAction
				from: self metaMessagesClass 
				to: ProtoObject) collect: [:eachPragma |
					thisContext 
						object: self
						perform: eachPragma methodSelector 
						withArguments: #() 
						inClass: self metaMessagesClass ].
	^ all asSortedCollection: [:a :b | 
		| first second |
		first := a isCategorized ifTrue: [a category, a title] ifFalse: [a title].
		second := b isCategorized ifTrue: [b category, b title] ifFalse: [b title].
		first < second]
]

{ #category : #'*Ghost-GTSupport' }
GHStandardMetaMessages >> gtInspectorPresentationsFromPragmas: aCollection In: composite inContext: aGTInspector [

	aCollection
		do: [ :eachPragma | 
			eachPragma methodSelector numArgs = 0
				ifTrue: [ 
					| configurationProvider |
					configurationProvider := self perform: eachPragma methodSelector.
					configurationProvider glmPresentation cull: composite cull: aGTInspector cull: self ].
			eachPragma methodSelector numArgs = 1
				ifTrue: [ 
					thisContext 
						object: self 
						perform: eachPragma methodSelector 
						withArguments: { composite } 
						inClass: self metaMessagesClass ].
			eachPragma methodSelector numArgs = 2
				ifTrue: [ 
					thisContext 
						object: self 
						perform: eachPragma methodSelector 
						withArguments: { composite . aGTInspector } 
						inClass: self metaMessagesClass ] ]
]

{ #category : #'*Ghost-GTSupport' }
GHStandardMetaMessages >> gtInspectorPresentationsIn: composite inContext: aGTInspector [
	"This is a utility method that collects all presentations for the current object.
	By default, it simply looks for the #gtInspectorPresentationOrder: pragma.
	The inspector can decice whether or not a presentation should be dispayed.
	Subclasses might want to override it for more special behavior."
	| pragmas |
	pragmas := Pragma
		allNamed: #gtInspectorPresentationOrder:
		from: self metaMessagesClass
		to: ProtoObject
		sortedUsing: [ :x :y | (x argumentAt: 1) < (y argumentAt: 1) ].
	pragmas := pragmas select: [ :aPragma | 
		(aGTInspector respondsTo: #shouldDisplayPresentationCreatedBy:)
			ifTrue: [ "Pharo6" aGTInspector shouldDisplayPresentationCreatedBy: aPragma method]
			ifFalse: [ "Pharo5" aGTInspector shouldDisplayPresentationCreateBy: aPragma method ] ].
	self gtInspectorPresentationsFromPragmas: pragmas In: composite inContext: aGTInspector
]

{ #category : #'*Ghost-GTSupport' }
GHStandardMetaMessages >> gtInspectorVariableValuePairs [
	
	^super gtInspectorVariableValuePairs
]

{ #category : #'*Ghost-GTSupport' }
GHStandardMetaMessages >> iconOrThumbnailOfSize: aNumberOrPoint [ 
	^super iconOrThumbnailOfSize: aNumberOrPoint
]
