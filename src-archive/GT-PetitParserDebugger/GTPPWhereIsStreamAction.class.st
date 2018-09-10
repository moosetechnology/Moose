Class {
	#name : #GTPPWhereIsStreamAction,
	#superclass : #GTPPDebugAction,
	#category : #'GT-PetitParserDebugger'
}

{ #category : #registration }
GTPPWhereIsStreamAction class >> gtActionType [
	<gtPPStreamDebuggingAction>
]

{ #category : #accessing }
GTPPWhereIsStreamAction >> defaultIcon [
	
	^ GLMUIThemeExtraIcons glamorousSearch
]

{ #category : #accessing }
GTPPWhereIsStreamAction >> defaultLabel [ 
	
	^ 'Where is stream?'
]

{ #category : #actions }
GTPPWhereIsStreamAction >> executeAction [

	self debugger updateStreamSelectionInterval
]

{ #category : #initialization }
GTPPWhereIsStreamAction >> initialize [ 
	super initialize.
	self needsUpdate: false
]
