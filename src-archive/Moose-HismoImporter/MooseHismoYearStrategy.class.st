Class {
	#name : #MooseHismoYearStrategy,
	#superclass : #MooseHismoImportingStrategy,
	#instVars : [
		'years'
	],
	#category : #'Moose-HismoImporter'
}

{ #category : #hook }
MooseHismoYearStrategy >> selectVersion: aVersion [

	^ (aVersion year - lastSelectedVersion year) >= self years
]

{ #category : #accessing }
MooseHismoYearStrategy >> years [

	^ years
]

{ #category : #accessing }
MooseHismoYearStrategy >> years: aNumber [

	years := aNumber
]
