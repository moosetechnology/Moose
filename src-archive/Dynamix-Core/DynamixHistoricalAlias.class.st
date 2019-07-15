Class {
	#name : #DynamixHistoricalAlias,
	#superclass : #DynamixAlias,
	#instVars : [
		'predecessor',
		'successor'
	],
	#category : #'Dynamix-Core'
}

{ #category : #meta }
DynamixHistoricalAlias class >> annotation [
	<MSEClass: #HistoricalAlias super: #DynamixAlias>
	<package: #Dynamix>
]

{ #category : #testing }
DynamixHistoricalAlias >> isRootAlias [
	^ false
]

{ #category : #accessing }
DynamixHistoricalAlias >> predecessor [
	^ predecessor
]

{ #category : #accessing }
DynamixHistoricalAlias >> predecessor: anObject [
	predecessor := anObject
]

{ #category : #accessing }
DynamixHistoricalAlias >> roleId [
	self subclassResponsibility
]

{ #category : #'accessing-derived' }
DynamixHistoricalAlias >> stopTimestamp [
	^ self successor
		ifNotNil: [ :alias | alias timestamp - 1 ]
		ifNil: [ MalUnlimited positive ]
]

{ #category : #accessing }
DynamixHistoricalAlias >> successor [
	^ successor
]

{ #category : #accessing }
DynamixHistoricalAlias >> successor: anObject [
	successor := anObject
]
