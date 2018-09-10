"
I represent a GTEventCollector for windows.
"
Class {
	#name : #GTWindowEventCollector,
	#superclass : #GTEventCollector,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'GT-Window-EventRecorder-Base'
}

{ #category : #cleanup }
GTWindowEventCollector class >> cleanUp [
	self reset
]

{ #category : #accessing }
GTWindowEventCollector class >> commonWindowTypes [

	^ #( NautilusUI
		GTPlayground
		TestRunner
		MCWorkingCopyBrowser
		FinderUI
		VersionnerSpecBrowser
		DAPackageDependenciesWelcome
		ThreadSafeTranscript
		TimeProfiler
		SelectPackageBrowser
		ProcessBrowser
		FileList
		MessageBrowser
		DualChangeSorterApplication
		ExternalChangesBrowser
		PPBrowser
		CommandShellTranscript
		AboutDialogWindow
		SettingBrowser
		GTSpecPreDebugWindow
		GTGenericStackDebugger
		GTInspector
		SystemReporter
		KeymapBrowser
		TimeProfiler
		HelpBrowser
		FileDialogWindow ).
]

{ #category : #'class initialization' }
GTWindowEventCollector class >> initialize [

	self uniqueInstance
]

{ #category : #'instance creation' }
GTWindowEventCollector class >> reset [
	uniqueInstance ifNotNil: [
		uniqueInstance unregisterToWorldAnnouncements.
		uniqueInstance unregisterToSystemAnnouncer.
		uniqueInstance := nil ].
	self initialize.
]

{ #category : #'instance creation' }
GTWindowEventCollector class >> uniqueInstance [
	^ uniqueInstance ifNil: [
		uniqueInstance := self new ]
]

{ #category : #initialization }
GTWindowEventCollector >> initialize [
	super initialize.	
	recordedEvents := WaitfreeQueue new.
	
	self category: #windows;
		register.
	
	self registerToSystemAnnouncer.
	
	Privacy sendDiagnosticsAndUsageData
		ifTrue: [ self registerToWorldAnnouncements ]
]

{ #category : #'announcement registration' }
GTWindowEventCollector >> privacyChanged [
	Privacy sendDiagnosticsAndUsageData
		ifTrue: [ self registerToWorldAnnouncements ]
		ifFalse: [ self unregisterToWorldAnnouncements ]
]

{ #category : #initialization }
GTWindowEventCollector >> recordAnnouncement: anAnnouncement [
	| event |
	Privacy sendDiagnosticsAndUsageData ifFalse: [ ^ self ].
	(anAnnouncement respondsTo: #asRecorderEvent) ifTrue: [	
		event := anAnnouncement asRecorderEvent.
		self add: event.
		GTEventRecorder uniqueInstance announcer announce: (GTWindowRecorderEventRecorded forEvent: event). ]
]

{ #category : #'announcement registration' }
GTWindowEventCollector >> registerToSystemAnnouncer [

	SystemAnnouncer uniqueInstance unsubscribe: self.
	
	SystemAnnouncer uniqueInstance weak
		when: PrivacyChangedAnnoucement
			send: #privacyChanged 
			to: self.
]

{ #category : #'announcement registration' }
GTWindowEventCollector >> registerToWindowAnnouncementsFor: aWindow [

	^ aWindow announcer
		when: WindowActivated send: #windowActivated: to: self;
		when: WindowDeActivated send: #windowDeActivated: to: self;
		when: WindowCollapsed send: #windowCollapsed: to: self;
		when: WindowExpanded send: #windowExpanded: to: self;
		when: WindowLabelled send: #windowLabelled: to: self;
		when: WindowMoved send: #windowMoved: to: self.
]

{ #category : #'announcement registration' }
GTWindowEventCollector >> registerToWorldAnnouncements [

	World announcer unsubscribe: self.
	
	World announcer weak
		when: WindowOpened send: #windowOpened: to: self;
		when: WindowClosed send: #windowClosed: to: self.
]

{ #category : #'announcement registration' }
GTWindowEventCollector >> unregisterToSystemAnnouncer [

	SystemAnnouncer uniqueInstance unsubscribe: self
]

{ #category : #'announcement registration' }
GTWindowEventCollector >> unregisterToWindowAnnouncementsFor: aWindow [

	^ aWindow announcer unsubscribe: self.
]

{ #category : #'announcement registration' }
GTWindowEventCollector >> unregisterToWorldAnnouncements [

	World announcer unsubscribe: self
]

{ #category : #annuncements }
GTWindowEventCollector >> windowActivated: anAnnouncement [

	self recordAnnouncement: anAnnouncement
]

{ #category : #annuncements }
GTWindowEventCollector >> windowClosed: anAnnouncement [

	self recordAnnouncement: anAnnouncement.
	self unregisterToWindowAnnouncementsFor: anAnnouncement window
]

{ #category : #annuncements }
GTWindowEventCollector >> windowCollapsed: anAnnouncement [

	self recordAnnouncement: anAnnouncement
]

{ #category : #annuncements }
GTWindowEventCollector >> windowDeActivated: anAnnouncement [

	self recordAnnouncement: anAnnouncement
]

{ #category : #annuncements }
GTWindowEventCollector >> windowExpanded: anAnnouncement [

	self recordAnnouncement: anAnnouncement
]

{ #category : #annuncements }
GTWindowEventCollector >> windowLabelled: anAnnouncement [

	self recordAnnouncement: anAnnouncement
]

{ #category : #annuncements }
GTWindowEventCollector >> windowMoved: anAnnouncement [

	self recordAnnouncement: anAnnouncement
]

{ #category : #annuncements }
GTWindowEventCollector >> windowOpened: anAnnouncement [

	self recordAnnouncement: anAnnouncement.
	self registerToWindowAnnouncementsFor: anAnnouncement window
]
