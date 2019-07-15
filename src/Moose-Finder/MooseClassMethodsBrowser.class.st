Class {
	#name : #MooseClassMethodsBrowser,
	#superclass : #GLMBrowserTemplate,
	#category : #'Moose-Finder'
}

{ #category : #'as yet unclassified' }
MooseClassMethodsBrowser >> buildBrowser [ 
	browser := GLMTabulator new.
	browser title: 'Methods'.
	browser column: #methods; column: #source.
	browser transmit to: #methods; andShow: [:a | 
		a list 
			display: [ :type | type methods ];
			format: #name ].
	browser transmit from: #methods; to: #source; andShow: [:a | 
		a text 
			display: [:method | method formattedSourceText ]].
	^ browser 
]
