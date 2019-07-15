"
self openOn: (MooseModel root allModels last allMethods detect: [:each | each clientMethods size > 10])
"
Class {
	#name : #MooseSendersBrowser,
	#superclass : #GLMBrowserTemplate,
	#category : #'Moose-Finder'
}

{ #category : #'as yet unclassified' }
MooseSendersBrowser >> buildBrowser [ 
	browser := GLMFinder new.
	browser title: 'Senders browser'.
	browser show: [:a | 
		a custom: self methodsBrowser ].
	^ browser
]

{ #category : #'as yet unclassified' }
MooseSendersBrowser >> methodsBrowser [
	| methodsBrowser |
	methodsBrowser := GLMTabulator new.
	methodsBrowser row: #methods; row: #code.
	methodsBrowser transmit to: #methods; andShow: [:a | 
		a list 
			title: [:method | 'Senders of ', method name];
			display: [:method | method invokingMethods]].
	methodsBrowser transmit from: #methods; to: #code; andShow: [:a |
		a text 	
			display: [:method | method formattedSourceText ]].
	methodsBrowser transmit toOutsidePort: #selection; from: #methods.
	^ methodsBrowser
]
