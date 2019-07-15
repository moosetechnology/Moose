Class {
	#name : #ACDSenderCalleeAction,
	#superclass : #DebugAction,
	#category : #'ACD-Model'
}

{ #category : #registration }
ACDSenderCalleeAction class >> gtACDSenderActionFor: aDebugger [
	<gtACDSenderDebuggingAction>
]

{ #category : #accessing }
ACDSenderCalleeAction >> defaultIcon [

	^ GLMUIThemeExtraIcons glamorousRight
]

{ #category : #accessing }
ACDSenderCalleeAction >> defaultLabel [

	^ 'Next Context'
]

{ #category : #actions }
ACDSenderCalleeAction >> executeAction [

	self session updateSenderFrom: (self session process calleeOf:  self session senderContext) 
]
