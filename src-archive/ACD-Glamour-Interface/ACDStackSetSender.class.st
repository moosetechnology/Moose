Class {
	#name : #ACDStackSetSender,
	#superclass : #DebugAction,
	#category : #'ACD-Glamour-Interface'
}

{ #category : #'as yet unclassified' }
ACDStackSetSender class >> gtACDSenderActionFor: aDebugger [
	<gtContextACDStackDebuggingAction>
]

{ #category : #testing }
ACDStackSetSender >> appliesToDebugger: aDebugger [
	"Only a context bellow the receiver context can be selected as the sender"
	
	^ (aDebugger selectedStackContext findContextSuchThat: [ :aSenderContext |
		(aSenderContext == aDebugger session receiverContext) ]) isNil
]

{ #category : #accessing }
ACDStackSetSender >> defaultLabel [

	^ 'Set as sender'
]

{ #category : #accessing }
ACDStackSetSender >> defaultOrder [

	^ 205
]

{ #category : #actions }
ACDStackSetSender >> executeAction [

	self session updateSenderFrom: self debugger selectedStackContext
]

{ #category : #accessing }
ACDStackSetSender >> id [

	^ #gtSetAsSenderDebuggerAction
]
