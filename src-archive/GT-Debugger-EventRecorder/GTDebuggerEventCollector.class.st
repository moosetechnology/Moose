"
I represent a GTEventCollector for GTDebugger application.
"
Class {
	#name : #GTDebuggerEventCollector,
	#superclass : #GTEventCollector,
	#category : #'GT-Debugger-EventRecorder-Base'
}

{ #category : #initialization }
GTDebuggerEventCollector >> collectDataFrom: aDebugger [
	self occupant: aDebugger;
		category: #gtdebugger;
		register;
		linkToDebugger: aDebugger;
		recordDebuggerOpenEventFor: aDebugger.
		
	aDebugger announcer announce: (GTGenericStackDebuggerSelectionChanged forDebugger: aDebugger).
]

{ #category : #initialization }
GTDebuggerEventCollector >> linkToDebugger: aDebugger [

	aDebugger announcer when: Announcement send: #recordAnnouncementIgnoreExecuted: to: self
]

{ #category : #events }
GTDebuggerEventCollector >> recordAnnouncement: anAnnouncement [
	| event |
	Privacy sendDiagnosticsAndUsageData ifFalse: [ ^ self ].
	(anAnnouncement respondsTo: #asRecorderEvent) ifTrue: [	
		event := anAnnouncement asRecorderEvent.
		self add: event.
		GTEventRecorder uniqueInstance announcer announce: (GTDebuggerRecorderEventRecorded forEvent: event). ]
]

{ #category : #events }
GTDebuggerEventCollector >> recordAnnouncementIgnoreExecuted: anAnnouncement [
	(anAnnouncement class ~= DebugActionExecuted) ifTrue: [ self recordAnnouncement: anAnnouncement ]
]

{ #category : #events }
GTDebuggerEventCollector >> recordDebuggerOpenEventFor: aDebugger [
	| event |
	Privacy sendDiagnosticsAndUsageData ifFalse: [ ^ self ].
	event := GTDebuggerRecorderOpenEvent new fromDebugger: aDebugger.
	self add: event.
	GTEventRecorder uniqueInstance announcer announce: (GTDebuggerRecorderEventRecorded forEvent: event).
]
