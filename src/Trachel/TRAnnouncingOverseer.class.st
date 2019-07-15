"
I am modified EventOverseer that uses its announcer for firing events and thus is more easily observable.
"
Class {
	#name : #TRAnnouncingOverseer,
	#superclass : #TREventOverseer,
	#instVars : [
		'announcer'
	],
	#category : #'Trachel-Core'
}

{ #category : #example }
TRAnnouncingOverseer class >> example [
	| c s eo |
	c := TRCanvas new.
	s := TRBoxShape new size: 50.
	s when: TRMouseLeftClick do: [ :evt |  ].
	c addShape: s.

	eo := TRAnnouncingOverseer new.
	c eventOverseer: eo.

	eo
		when: TRMouseLeftClick
		do: [ :event | 
			Transcript
				log: event;
				tab;
				logCr: event shape ].

	c open
]

{ #category : #public }
TRAnnouncingOverseer >> announce: anEvent [
	self announcer announce: anEvent
]

{ #category : #public }
TRAnnouncingOverseer >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #public }
TRAnnouncingOverseer >> firedEvent: anEvent [
	self announce: anEvent
]

{ #category : #public }
TRAnnouncingOverseer >> when: anEvent do: aOneArgBlock [
	self announcer when: anEvent do: aOneArgBlock
]
