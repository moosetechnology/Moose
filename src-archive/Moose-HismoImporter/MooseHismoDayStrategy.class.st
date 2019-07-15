Class {
	#name : #MooseHismoDayStrategy,
	#superclass : #MooseHismoImportingStrategy,
	#instVars : [
		'days'
	],
	#category : #'Moose-HismoImporter'
}

{ #category : #accessing }
MooseHismoDayStrategy >> days [

	^ days
]

{ #category : #accessing }
MooseHismoDayStrategy >> days: nDays [

	days := nDays
]

{ #category : #hook }
MooseHismoDayStrategy >> selectVersion: aVersion [

	^ (aVersion - lastSelectedVersion) days >= self days
]
