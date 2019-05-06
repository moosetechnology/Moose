"
Visual browser of Roassal example.
This class create a world menu item to open the examples
"
Class {
	#name : #RTExampleBrowser,
	#superclass : #RTAbstractWorldMenu,
	#category : #'Roassal2-MorphSpecific-Menu'
}

{ #category : #menu }
RTExampleBrowser class >> menuCommandOn: aBuilder [
	<worldMenu>
	((aBuilder item: #Roassal) icon: RTIcon smallRoassal)
	withSeparatorAfter;
	with: [
		(aBuilder item: #'Roassal Examples')
			order: 0.1; 
			parent: #Roassal;
			label: 'Roassal examples';
			help: 'Browse Roassal interactive examples';
			icon: RTIcon smallRoassal;
			action: [ self new open ] ]
]

{ #category : #'instance creation' }
RTExampleBrowser >> checkSendingData [
	| result |
	Privacy sendDiagnosticsAndUsageData ifTrue: [ ^ self ].
	result := UIManager default questionWithoutCancel: 'Please, do you want to let us know how you use the Roassal example browser? 

Roassal is free to use, but you can retribute to it by letting us know which examples 
interest you the most. 

By pressing YES, you will send to our server the name of the example you have pressed on later on.  
Note that answering YES will also activate other monitoring mechanism, such as Spotter.

__ All the data is sent anonymously__
	' title: 'Send Us Usage Data'. 
	result ifNil: [ ^ self ].
	result ifTrue: [ Privacy sendDiagnosticsAndUsageData: true ]
]

{ #category : #'instance creation' }
RTExampleBrowser >> examples [
	| es |
	es := RTAbstractExample allSubclasses collect: #new.
	^ es sortedAs: #label
]

{ #category : #'instance creation' }
RTExampleBrowser >> open [
	| pager |
	self shouldEventBeManaged ifTrue: [ self checkSendingData ]. 
	pager := GLMPager new.
	pager title: 'Roassal examples browser'.
	pager showFirst: [ :a | a list format: #label. ].
	pager
		show: [ :a :each | 
			a title: [ GTInspector new printObjectAsAnItem: each ].
			a dynamicActions: [ :aPresentation | each gtInspectorActions asOrderedCollection ].
			a dynamic
				display: [ :x | (GLMCompositePresentation new with: [ :d | each gtInspectorPresentationsIn: d inContext: pager ]) startOn: x ] ].
	pager openOn: self examples
]

{ #category : #'instance creation' }
RTExampleBrowser >> shouldEventBeManaged [
	"Per default, data about example usage is not collected"
	^ false
]
