"
RTGradualDSM build a Dependency Structural Matrix for a collection of objects and an arbitrary score function. The score is used to give a color to the cell.

For example, inspect the following:
[[[ 
	dsm := RTGradualDSM new.

	values := { 1->#(2 3 1 5 6) . 2 -> #(1 2 1 1 1 1 4) . 3 -> #(1 2 5 3 2) . 4 -> #(2 5 1) . 5 -> #() . 6 -> #(4) } asDictionary.
	dsm objects: (1 to: 6).
	dsm score: [ :assoc | (values at: assoc key) occurrencesOf: assoc value ].
	dsm.
]]]
"
Class {
	#name : #RTGradualDSM,
	#superclass : #RTAbstractDSM,
	#instVars : [
		'score'
	],
	#category : #'Roassal2-Builder-DSM'
}

{ #category : #examples }
RTGradualDSM class >> example01 [
	<script: 'self example01 inspect'>
	| dsm values |
	dsm := RTGradualDSM new.

	values := (Array 
		with: (1->#(2 3 1 5 6)) 
		with: (2 -> #(1 2 1 1 1 1 4))
		with: (3 -> #(1 2 5 3 2)) 
		with: (4 -> #(2 5 1)) 
		with: (5 -> #()) 
		with: (6 -> #(4)) ) asDictionary.
	dsm objects: (1 to: 6).
	dsm score: [ :assoc | (values at: assoc key) occurrencesOf: assoc value ].
	^ dsm
]

{ #category : #examples }
RTGradualDSM class >> example02Authorship [
	<script: 'self example02Authorship inspect'>
	| classes classesToAuthors authors authorsToClasses b |
	classes := RTShape withAllSubclasses.

	classesToAuthors := (classes collect: [ :cls | cls -> ((cls methods collect: #author) asSet sortedAs: #yourself) ]) asDictionary.
	authors := (classesToAuthors values flatCollect: #yourself) asSet sortedAs: #yourself.
	authorsToClasses := (authors collect: [ :anAuthor | anAuthor -> (classesToAuthors associations select: [ :as | as value includes: anAuthor ] thenCollect: #key) ]) asDictionary.

	b := RTGradualDSM new.
	b objectsX: classes.
	b objectsY: authors.
	b score: [ :assoc | (assoc value methods collect: #author) occurrencesOf: assoc key ].
	^ b
]

{ #category : #examples }
RTGradualDSM class >> example03AuthorshipByTime [
	<script: 'self example03AuthorshipByTime inspect'>
	| classes classesToAuthors authors authorsToClasses b intervalDays oldAge youngAge diff c |
	classes := RTShape withAllSubclasses.
	intervalDays := 100.
	oldAge := (classes collect: #ageInDaysRounded) max.
	youngAge := (classes collect: #ageInDaysRounded) min.
	
	diff := oldAge - youngAge.
	
	c := RTComposer new.
	youngAge to: oldAge by: intervalDays do: [ :t |  
		classesToAuthors := (classes collect: [ :cls | cls -> (((cls methods select: [ :m | (t to: t + intervalDays) rangeIncludes: m ageInDaysRounded ]) collect: #author) asSet sortedAs: #yourself) ]) asDictionary.
		authors := (classesToAuthors values flatCollect: #yourself) asSet sortedAs: #yourself.
		authorsToClasses := (authors collect: [ :anAuthor | anAuthor -> (classesToAuthors associations select: [ :as | as value includes: anAuthor ] thenCollect: #key) ]) asDictionary.

		b := RTGradualDSM new.
		b view: c view.
		b objectsX: classes.
		b objectsY: authors.
		b score: [ :assoc | (assoc value methods collect: #author) occurrencesOf: assoc key ].
		b build.
		c group: t asString asSymbol.
	].
	c layout: (RTGridLayout new gapSize: 30).
	youngAge to: oldAge by: intervalDays do: [ :t |  
		c nameGroup: t asString asSymbol as: 'Time ', t asString ].
	^ c view
]

{ #category : #initialization }
RTGradualDSM >> initialize [
	super initialize.
	score := [ :association | 0 ].
]

{ #category : #hooks }
RTGradualDSM >> renderIn: aView [
	super renderIn: aView.	
	
	1 to: objectsX size do: [:j | 
		RTMetricNormalizer new
			elements: ((self columnAt: j) select: [:e | selectElement rtValue: e]);
			normalizeColor: score using: (Array with: Color veryVeryLightGray with: (Color colorFrom: '#4d79ff') );
			alphaColor: self transparencyWhenNonHighlighted.
			].
	^ aView
]

{ #category : #accessing }
RTGradualDSM >> score [
	^ score
]

{ #category : #accessing }
RTGradualDSM >> score: oneArgBlock [
	"The argument is a one arg block that takes an association as parameter.
	The block has to return a numerical value. No predefined bounds is required"
	score := oneArgBlock
]

{ #category : #accessing }
RTGradualDSM >> selectElement [
	 ^ selectElement 
]

{ #category : #accessing }
RTGradualDSM >> selectElement: aBlock [
	selectElement := aBlock
]
