"
This browser simply provides the possibility to open a sourceAnchor with the text of the sourceAnchor interval selected. It is a helper browser used in the Finder.
"
Class {
	#name : #MooseFileSourceAnchorViewer,
	#superclass : #GLMBrowserTemplate,
	#category : #'Moose-Finder'
}

{ #category : #accessing }
MooseFileSourceAnchorViewer >> buildBrowser [
	browser := GLMTabulator new.
	browser column: #one.
	browser transmit 
		to: #one; 
		andShow: [:a | a text display: [:sourceAnchor | sourceAnchor completeText ]].
	browser transmit 
		fromOutsidePort: #entity; 
		to: #one port: #selectionInterval; 
		transformed: [:sourceAnchor | sourceAnchor intervalAsCharPos ];
		when: [:sourceAnchor | sourceAnchor notNil ].
	^ browser
]
