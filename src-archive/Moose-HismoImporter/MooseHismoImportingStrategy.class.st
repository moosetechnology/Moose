Class {
	#name : #MooseHismoImportingStrategy,
	#superclass : #Object,
	#instVars : [
		'versions',
		'selectedVersions',
		'lastSelectedVersion',
		'datePattern'
	],
	#category : #'Moose-HismoImporter'
}

{ #category : #private }
MooseHismoImportingStrategy >> colllectDateInString: aString [

	^ (aString 
		regex: self datePatternAsRegex 
		matchesCollect: #yourself) first
]

{ #category : #accessing }
MooseHismoImportingStrategy >> datePattern [

	^ datePattern
]

{ #category : #accessing }
MooseHismoImportingStrategy >> datePattern: aPattern [

	datePattern := aPattern
]

{ #category : #private }
MooseHismoImportingStrategy >> datePatternAsRegex [
	"Check this!!!"
	"example: for the pattern 'dd-mm-yyyy' or 'd-m-yyyy' we want the regex  '\d?\d-\d?\d-\d\d\d\d' "
	^ ((self datePattern replaceAllRegex: 'dd|d|mm|m' with: 'x') replaceAllRegex: 'x' with: '\d?\d') replaceAllRegex: 'y' with: '\d'
]

{ #category : #private }
MooseHismoImportingStrategy >> filterDate: aString [

	self datePattern isEmptyOrNil
		ifTrue: [ ^ aString ].
	^ (self colllectDateInString: aString) asDateWithPattern: self datePattern
]

{ #category : #hook }
MooseHismoImportingStrategy >> selectVersion: aDate [

	^ self subclassResponsibility
]

{ #category : #accessing }
MooseHismoImportingStrategy >> selectVersions [
	
	lastSelectedVersion := '01/01/1001' asDateWithPattern: 'dd/mm/yyyy'.
	
	"sort the versions by date"
	versions := versions sorted: [ :a :b | (self filterDate: a) < (self filterDate: b) ].

	^ versions select: [ :each |
		
		| version shouldSelectCurrent |
		
		version := self filterDate: each.
		shouldSelectCurrent := self selectVersion: version.
		shouldSelectCurrent ifTrue: [ lastSelectedVersion := version ].
		shouldSelectCurrent ]
]

{ #category : #accessing }
MooseHismoImportingStrategy >> selectedVersions [
	
	^ selectedVersions ifNil: [ selectedVersions := self selectVersions ]
]

{ #category : #accessing }
MooseHismoImportingStrategy >> versions [

	^ versions
]

{ #category : #accessing }
MooseHismoImportingStrategy >> versions: aListOfVersions [

	versions := aListOfVersions
]
