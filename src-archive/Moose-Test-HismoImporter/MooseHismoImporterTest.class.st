Class {
	#name : #MooseHismoImporterTest,
	#superclass : #TestCase,
	#instVars : [
		'hismoImporter',
		'datePattern'
	],
	#category : #'Moose-Test-HismoImporter'
}

{ #category : #private }
MooseHismoImporterTest >> colllectDateInString: aString [

	^ (hismoImporter importingStrategy colllectDateInString: aString) asDateWithPattern: datePattern
]

{ #category : #running }
MooseHismoImporterTest >> setUp [

	| systemVersions versionsAndDates dateTemp ddmmyyyy |

	datePattern := 'dd-mm-yyyy'.
	versionsAndDates := OrderedCollection new.
	dateTemp := '01-01-2000' asDateWithPattern: datePattern.

	1 to: 4000 do: [ :version |
		versionsAndDates add: (version -> dateTemp).
		dateTemp := dateTemp next ].
	
	"See Date>>printOn:format: Ex: version2459#12-03-2004"
	ddmmyyyy := #(1 2 3 $- 1 1 2).
	systemVersions := versionsAndDates collect: [ :each | 'version',each key asString, '#', (each value printFormat: ddmmyyyy) ].

	hismoImporter := MooseHismoImporter new 
		versions: systemVersions; 
		datePattern: datePattern.
]

{ #category : #tests }
MooseHismoImporterTest >> testEvery15Days [

	| date1 date2 selectedVersions |
	
	hismoImporter everyNDays: 15.
	selectedVersions := hismoImporter selectedVersions.
	
	self assert: selectedVersions size = 267.
	
	"compare the date of the two first selections"
	date1 := self colllectDateInString: selectedVersions first.
	date2 := self colllectDateInString: selectedVersions second.
	
	self assert: (date2 - date1) days >= 15.
	
	"compare the date of the two last selections"
	date1 := self colllectDateInString: (selectedVersions at: selectedVersions size - 1).
	date2 := self colllectDateInString: selectedVersions last.

	self assert: (date2 - date1) days >= 15.
]

{ #category : #tests }
MooseHismoImporterTest >> testEvery2Years [
	
	| date1 date2 selectedVersions |
	
	hismoImporter everyNYears: 2.
	selectedVersions := hismoImporter selectedVersions.
	
	self assert: selectedVersions size = 6.
	
	"compare the date of the two first selections"
	date1 := self colllectDateInString: selectedVersions first.
	date2 := self colllectDateInString: selectedVersions second.
	
	self assert: (date2 year - date1 year) >= 2.
	
	"compare the date of the two last selections"
	date1 := self colllectDateInString: (selectedVersions at: selectedVersions size - 1).
	date2 := self colllectDateInString: selectedVersions last.

	self assert: (date2 year - date1 year) >= 2.
]

{ #category : #tests }
MooseHismoImporterTest >> testEvery6Months [

	| date1 date2 selectedVersions |
	
	hismoImporter everyNMonths: 6.
	selectedVersions := hismoImporter selectedVersions.
	
	self assert: selectedVersions size = 22.
	
	"compare the date of the two first selections"
	date1 := self colllectDateInString: selectedVersions first.
	date2 := self colllectDateInString: selectedVersions second.
	
	self assert: date2 month >=  (date1 month next: 6).
	
	"compare the date of the two last selections"
	date1 := self colllectDateInString: (selectedVersions at: selectedVersions size - 1).
	date2 := self colllectDateInString: selectedVersions last.

	self assert: date2 month >=  (date1 month next: 6).
]

{ #category : #tests }
MooseHismoImporterTest >> testEveryDay [
	
	| date1 date2 selectedVersions |
	
	hismoImporter everyDay.
	selectedVersions := hismoImporter selectedVersions.
	
	self assert: selectedVersions size = 4000.
	
	"compare the date of the two first selections"
	date1 := self colllectDateInString: selectedVersions first.
	date2 := self colllectDateInString: selectedVersions second.
	
	self assert: (date2 - date1) days >= 1.
	
	"compare the date of the two last selections"
	date1 := self colllectDateInString: (selectedVersions at: selectedVersions size - 1).
	date2 := self colllectDateInString: selectedVersions last.

	self assert: (date2 - date1) days >= 1.
]

{ #category : #tests }
MooseHismoImporterTest >> testEveryMonth [

	| date1 date2 selectedVersions |
	
	hismoImporter everyMonth.
	selectedVersions := hismoImporter selectedVersions.
	
	self assert: selectedVersions size = 132.
	
	"compare the date of the two first selections"
	date1 := self colllectDateInString: selectedVersions first.
	date2 := self colllectDateInString: selectedVersions second.
	
	self assert: date2 month >=  (date1 month next: 1).
	
	"compare the date of the two last selections"
	date1 := self colllectDateInString: (selectedVersions at: selectedVersions size - 1).
	date2 := self colllectDateInString: selectedVersions last.

	self assert: date2 month >=  (date1 month next: 1).
]

{ #category : #tests }
MooseHismoImporterTest >> testEveryNDays [

	| date1 date2 selectedVersions |
	
	"N = 20"
	hismoImporter everyNDays: 20.
	selectedVersions := hismoImporter selectedVersions.
	
	self assert: selectedVersions size = 200.
	
	"compare the date of the two first selections"
	date1 := self colllectDateInString: selectedVersions first.
	date2 := self colllectDateInString: selectedVersions second.
	
	self assert: (date2 - date1) days >= 20.
	
	"compare the date of the two last selections"
	date1 := self colllectDateInString: (selectedVersions at: selectedVersions size - 1).
	date2 := self colllectDateInString: selectedVersions last.

	self assert: (date2 - date1) days >= 20.
]

{ #category : #tests }
MooseHismoImporterTest >> testEveryNMonths [

	| date1 date2 selectedVersions |
	
	"N = 18"
	hismoImporter everyNMonths: 18.
	selectedVersions := hismoImporter selectedVersions.

	self assert: selectedVersions size = 8.
	
	"compare the date of the two first selections"
	date1 := self colllectDateInString: selectedVersions first.
	date2 := self colllectDateInString: selectedVersions second.
	
	self assert: date2 month >=  (date1 month next: 18).
	
	"compare the date of the two last selections"
	date1 := self colllectDateInString: (selectedVersions at: selectedVersions size - 1).
	date2 := self colllectDateInString: selectedVersions last.

	self assert: date2 month >=  (date1 month next: 18).
]

{ #category : #tests }
MooseHismoImporterTest >> testEveryNYears [
	
	| date1 date2 selectedVersions |
	
	"N = 3"
	hismoImporter everyNYears: 3.
	selectedVersions := hismoImporter selectedVersions.
	
	self assert: selectedVersions size = 4.
	
	"compare the date of the two first selections"
	date1 := self colllectDateInString: selectedVersions first.
	date2 := self colllectDateInString: selectedVersions second.
	
	self assert: (date2 year - date1 year) >= 3.
	
	"compare the date of the two last selections"
	date1 := self colllectDateInString: (selectedVersions at: selectedVersions size - 1).
	date2 := self colllectDateInString: selectedVersions last.

	self assert: (date2 year - date1 year) >= 3.
]

{ #category : #tests }
MooseHismoImporterTest >> testEveryYear [
	
	| date1 date2 selectedVersions |
	
	hismoImporter everyYear.
	selectedVersions := hismoImporter selectedVersions.
	
	self assert: selectedVersions size = 11.
	
	"compare the date of the two first selections"
	date1 := self colllectDateInString: selectedVersions first.
	date2 := self colllectDateInString: selectedVersions second.
	
	self assert: (date2 year - date1 year) >= 1.
	
	"compare the date of the two last selections"
	date1 := self colllectDateInString: (selectedVersions at: selectedVersions size - 1).
	date2 := self colllectDateInString: selectedVersions last.

	self assert: (date2 year - date1 year) >= 1.
]
