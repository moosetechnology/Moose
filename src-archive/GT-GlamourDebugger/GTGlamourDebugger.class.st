Class {
	#name : #GTGlamourDebugger,
	#superclass : #GTGenericStackDebugger,
	#category : #'GT-GlamourDebugger'
}

{ #category : #accessing }
GTGlamourDebugger class >> defaultTitle [

	^ 'Glamour'
]

{ #category : #testing }
GTGlamourDebugger class >> handlesContext: aContext [

	^ aContext locateBrowserContext notNil 
]

{ #category : #'tools registry' }
GTGlamourDebugger class >> register [

	self registerToolsOn: Smalltalk tools.
]

{ #category : #'tools registry' }
GTGlamourDebugger class >> registerToolsOn: registry [

	"Add ourselves to registry. See [Smalltalk tools]" 
	registry registerDebugger: self withRank: 50.
]

{ #category : #private }
GTGlamourDebugger class >> sessionClass [

	^ GTGlamourDebugSession
]

{ #category : #building }
GTGlamourDebugger >> browserStructureFor: aGlmBrowser in: aComposite [
	
	aComposite roassal2
		title: 'Browser structure';
		painting: [:view :b | 
			aGlmBrowser viewTreeOn: view ]
]

{ #category : #building }
GTGlamourDebugger >> debuggerStructureIn: browser [

	browser
			row: [ :row | 
						row
							column: [ :c |
								c
									row: #stack;
									row: #code ];
							column: #browser ] span: 4;
			row: #inspector span: 3.
]

{ #category : #building }
GTGlamourDebugger >> debuggerTransmissionsIn: browser. [
		
	super debuggerTransmissionsIn: browser.
	
	browser transmit
		from: #stack port: #selection;
		to: #browser;
		andShow: [ :composite | self browserStructureFor: self session rootBrowser in: composite ]
]

{ #category : #'building actions' }
GTGlamourDebugger >> debuggingActionsPragmas [

	^ super debuggingActionsPragmas, { #glamourDebuggingAction }
]
