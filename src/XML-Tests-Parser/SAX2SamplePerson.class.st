"
The sample person object parsed by the SAX2ElementParser.
"
Class {
	#name : #SAX2SamplePerson,
	#superclass : #Object,
	#instVars : [
		'name',
		'dateOfBirth',
		'emailAddresses',
		'residence'
	],
	#category : #'XML-Tests-Parser-ElementHandlers'
}

{ #category : #adding }
SAX2SamplePerson >> addEmailAddress: aString [
	^ self emailAddresses addLast: aString
]

{ #category : #accessing }
SAX2SamplePerson >> dateOfBirth [
	^ dateOfBirth
]

{ #category : #accessing }
SAX2SamplePerson >> dateOfBirth: aDate [
	dateOfBirth := aDate
]

{ #category : #accessing }
SAX2SamplePerson >> emailAddresses [
	^ emailAddresses
]

{ #category : #initialization }
SAX2SamplePerson >> initialize [
	super initialize.

	name := ''.
	dateOfBirth := nil.
	emailAddresses := OrderedCollection new.
	residence := ''.
]

{ #category : #accessing }
SAX2SamplePerson >> name [
	^ name
]

{ #category : #accessing }
SAX2SamplePerson >> name: aString [
	name := aString
]

{ #category : #accessing }
SAX2SamplePerson >> residence [
	^ residence
]

{ #category : #accessing }
SAX2SamplePerson >> residence: aString [
	residence := aString
]
