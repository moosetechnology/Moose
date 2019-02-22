"
I am a builder to create calendars with Roassal
"
Class {
	#name : #RTCalendarBuilder,
	#superclass : #RTBuilder,
	#instVars : [
		'dates',
		'dateShape',
		'dateSelector',
		'monthShape',
		'yearShape',
		'dateLayout',
		'monthLayout',
		'yearLayout',
		'dayLabelShape',
		'dateInteraction',
		'monthInteraction',
		'yearInteraction'
	],
	#category : #'Roassal2-Builder-Calendar'
}

{ #category : #hooks }
RTCalendarBuilder >> createView [
	^ super createView @ RTDraggableView.
]

{ #category : #accessing }
RTCalendarBuilder >> dateInteraction [
	^ dateInteraction
]

{ #category : #accessing }
RTCalendarBuilder >> dateLayout [
	^ dateLayout
]

{ #category : #accessing }
RTCalendarBuilder >> dateSelector [
	^ dateSelector
]

{ #category : #accessing }
RTCalendarBuilder >> dateSelector: anObject [
	dateSelector := anObject
]

{ #category : #accessing }
RTCalendarBuilder >> dateShape [
	^ dateShape
]

{ #category : #accessing }
RTCalendarBuilder >> dateShape: aShapeBuilder [
	dateShape := aShapeBuilder
]

{ #category : #accessing }
RTCalendarBuilder >> dates [
	^ dates
]

{ #category : #accessing }
RTCalendarBuilder >> dates: anObject [
	dates := anObject
]

{ #category : #accessing }
RTCalendarBuilder >> dayLabelShape [
	^ dayLabelShape
]

{ #category : #'accessing - computed' }
RTCalendarBuilder >> daysIndex: aCollection [
	^ (aCollection collect: [ :d | d dayOfWeek ]) asSet asSortedCollection.
]

{ #category : #'accessing - computed' }
RTCalendarBuilder >> getDateStructure [
	| aDates firstDay currentMonth currentYear days months years |
	aDates := self getDays."All the dates"
	
	firstDay := aDates first.
	currentMonth := firstDay asMonth.
	currentYear := currentMonth asYear.
	
	years := OrderedCollection new.
	months := OrderedCollection new.
	days := OrderedCollection new.
	
	days add: firstDay.
	months add: currentMonth->days.
	years add: currentYear->months.
	aDates allButFirstDo: [ :date | | temp |
		temp := date asYear.
		temp = currentYear 
			ifFalse: [ 
				currentYear := temp.
				months := OrderedCollection new.
				years add: currentYear->months. ].
		temp := date asMonth.
		temp = currentMonth 
			ifTrue: [ days add: date ]
			ifFalse: [ 
				currentMonth := temp.
				days := OrderedCollection new.
				days add: date.
				months add: currentMonth->days ]
		].
	
	^ years
]

{ #category : #'accessing - computed' }
RTCalendarBuilder >> getDays [
	| timespan days current limit |
	timespan := self dateSelector rtValue: self dates.
	
	(timespan isKindOf: OrderedCollection) ifTrue: [ ^ timespan asSortedCollection ].
	
	days := OrderedCollection new.
	current := timespan start asDate.
	limit := timespan end asDate.
	
	[ current <= limit ] whileTrue: [ 
		days add: current.
		current := current next ].
	
	^ days
]

{ #category : #initialization }
RTCalendarBuilder >> initialize [
	super initialize.
	dateShape := RTShapeBuilder new.
	dateShape label text: [:date | date dayOfMonth ].
	
	dayLabelShape := RTShapeBuilder new.
	dayLabelShape rectangle size: 0.
	
	self dateSelector: #yourself.
	
	monthShape := RTShapeBuilder new.
	monthShape composite: [ :s | 
		s add: (RTLabel new text: [ :d | d name ]).
		s add: (RTBox new color: Color transparent; borderColor: Color lightGray) ].
	
	yearShape := RTShapeBuilder new.
	yearShape rectangle color: Color transparent.
	
	dateLayout := RTLayoutBuilder new.
	dateLayout date.
	monthLayout := RTLayoutBuilder new.
	monthLayout grid gapSize: 10.
	yearLayout := RTLayoutBuilder new.
	yearLayout grid gapSize: 10.
	
	dateInteraction := RTInteractionBuilder new.
	monthInteraction := RTInteractionBuilder new.
	yearInteraction := RTInteractionBuilder new.
	

]

{ #category : #accessing }
RTCalendarBuilder >> monthInteraction [
	^ monthInteraction
]

{ #category : #accessing }
RTCalendarBuilder >> monthLayout [
	^ monthLayout 
]

{ #category : #accessing }
RTCalendarBuilder >> monthShape [
	^ monthShape
]

{ #category : #public }
RTCalendarBuilder >> monthShapePath: cellSize [
	^ RTSVGPath new 
		borderColor: Color black;
		path: [ :e | | month d w0 d0 d1 w1 csize t1 t2 |
			csize := cellSize asPoint.
			month := e model."an instance of Month"
			t1 := month asDate.
			t2 := Date newDay: month daysInMonth month: month name year: month year.
			d0 := t1 dayOfWeek - 1.
			d1 := t2 dayOfWeek - 1.
			w0 := 0.
			w1 := month weeks size-1.
			d := 'M', (d0 * cellSize) asString , ',' , ((w0 + 1) * cellSize) asString
     			, 'V' , (w0 * cellSize) asString , 'H' , (7 * cellSize) asString 
				, 'V' , (w1 * cellSize) asString , 'H' , ((d1 + 1) * cellSize) asString
				, 'V' , ((w1 + 1) * cellSize) asString , 'H 0'
     			, 'V' , ((w0 + 1) * cellSize) asString , 'Z'.
			d. ].
]

{ #category : #hooks }
RTCalendarBuilder >> renderIn: aView [
	| dateStructure years |
	
	dateStructure := self getDateStructure.
	years := OrderedCollection new.
	dateStructure do: [ :asso1 | 
		| year months |
		year := yearShape elementOn: asso1 key.
		view add: year.
		years add: year.
		
		months := RTGroup new.
		asso1 value do: [ :asso2 | 
			| month days dayLabels | 
			month := monthShape elementOn: asso2 key.
			view add: month.
			months add: month.
			dayLabels := dayLabelShape elementsOn: (self daysIndex: asso2 value).
			days := dateShape elementsOn: asso2 value.
			view addAll: days.
			
			(dayLabels first extent = (0.0@0.0)) ifTrue: [ 
				dateLayout layout on: days.
				RTNest new on: month nest: days.
			] ifFalse: [ 
				view addAll: dayLabels.
				dateLayout layout on: dayLabels, days.
				RTNest new on: month nest: dayLabels,days. ].
			dateInteraction setUpElements: days.
			 ]. 
		monthLayout layout on: months.
		RTNest new on: year nest: months.
		monthInteraction setUpElements: months. ].
	yearLayout layout on: years.
	yearInteraction setUpElements: years.

	
	
]

{ #category : #public }
RTCalendarBuilder >> showDayNames [
	self dayLabelShape label text: [ :index | 
		| name i |
		i := Week dayNames indexOf: Week startDay.
		i := i+index - 1.
		i > 7 ifTrue: [ i := i -7 ].
		name := Week nameOfDay: i.
		name first asString, name second asString ].
]

{ #category : #accessing }
RTCalendarBuilder >> yearInteraction [
	^ yearInteraction
]

{ #category : #accessing }
RTCalendarBuilder >> yearLayout [
	^ yearLayout
]

{ #category : #accessing }
RTCalendarBuilder >> yearShape [
	^ yearShape
]

{ #category : #accessing }
RTCalendarBuilder >> yearShape: aShapeBuilder [
	yearShape := aShapeBuilder
]
