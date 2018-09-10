Class {
	#name : #ACDSenderWhereIsDebugAction,
	#superclass : #WhereIsDebugAction,
	#category : #'ACD-Model'
}

{ #category : #registration }
ACDSenderWhereIsDebugAction class >> gtActionFor: aDebugger [
	<gtACDSenderDebuggingAction>
	
	^ (self forDebugger: aDebugger)
			icon: GLMUIThemeExtraIcons glamorousSearch
]

{ #category : #actions }
ACDSenderWhereIsDebugAction >> executeAction [

	self debugger updateSenderCodeSelection
]

{ #category : #accessing }
ACDSenderWhereIsDebugAction >> id [

	^ #acdSenderWhereIs
]
