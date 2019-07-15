Class {
	#name : #ACDStackSetReceiver,
	#superclass : #DebugAction,
	#category : #'ACD-Glamour-Interface'
}

{ #category : #testing }
ACDStackSetReceiver >> appliesToDebugger: aDebugger [
	"Only a context above the sender context can be selected as the receiver"
	
	^ (aDebugger selectedStackContext findContextSuchThat: [ :aContext |
		(aContext == aDebugger session senderContext) ]) isNil
]

{ #category : #accessing }
ACDStackSetReceiver >> defaultLabel [

	^ 'Set as receiver'
]

{ #category : #accessing }
ACDStackSetReceiver >> defaultOrder [

	^ 200
]

{ #category : #actions }
ACDStackSetReceiver >> executeAction [

	self session updateReceiverFrom: self debugger selectedStackContext
]

{ #category : #accessing }
ACDStackSetReceiver >> id [

	^ #gtSetAsReceiverDebuggerAction
]
