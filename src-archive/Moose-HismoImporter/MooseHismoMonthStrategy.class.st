Class {
	#name : #MooseHismoMonthStrategy,
	#superclass : #MooseHismoImportingStrategy,
	#instVars : [
		'months'
	],
	#category : #'Moose-HismoImporter'
}

{ #category : #accessing }
MooseHismoMonthStrategy >> months [

	^ months
]

{ #category : #accessing }
MooseHismoMonthStrategy >> months: nMonths [

	months := nMonths
]

{ #category : #hook }
MooseHismoMonthStrategy >> selectVersion: aVersion [

	^ aVersion month >= (lastSelectedVersion month next: self months)
]
