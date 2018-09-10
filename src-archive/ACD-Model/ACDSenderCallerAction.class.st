Class {
	#name : #ACDSenderCallerAction,
	#superclass : #DebugAction,
	#category : #'ACD-Model'
}

{ #category : #registration }
ACDSenderCallerAction class >> gtACDSenderActionFor: aDebugger [
	<gtACDSenderDebuggingAction>
]

{ #category : #accessing }
ACDSenderCallerAction >> defaultIcon [

	^ GLMUIThemeExtraIcons glamorousLeft
]

{ #category : #accessing }
ACDSenderCallerAction >> defaultLabel [

	^ 'Previous Context'
]

{ #category : #actions }
ACDSenderCallerAction >> executeAction [

	self session updateSenderFrom: self session senderContext sender
]
