Class {
	#name : #RTPackageLife,
	#superclass : #RTUsefulScript,
	#category : #'Roassal2-Plugins'
}

{ #category : #accessing }
RTPackageLife >> description [
	^ 
'Let you select one or more packages and see their evolution. 
The produced curve indicate the amount of methods modified during a week period time.'
]

{ #category : #hooks }
RTPackageLife >> execute [
	| packageNamePattern packages methods oldestMethod byWeeks b ds lb |
	packageNamePattern := UIManager default
			request: 'Enter a pattern of a package (e.g., Roassal2 or Roassal2*)'
			initialAnswer: 'Roassal2'
			title: 'Enter the name of a package to measure the coverage'.

	packages := RPackageOrganizer default packages select: [ :pak | packageNamePattern match: pak packageName ].

	methods := packages flatCollect: #methods.
	oldestMethod := methods minFor: #date.
	byWeeks := (methods groupedBy: [ :m | m date asWeek ]) associations.

	b := RTGrapher new.

	ds := RTData new.
	ds dotShape circle size: 5; color: (Color blue alpha: 0.1).
	ds interaction popupText: [ :assoc | assoc key asString, ' -> ', assoc value size asString, ' modified methods ' ].
	ds points: byWeeks.
	ds y: [ :assoc | assoc value size ].
	ds x: [ :assoc | assoc key start julianDayNumber - oldestMethod date julianDayNumber ].
	b add: ds.

	b axisY title: 'Number of modified methods'; noDecimal.

	b axisX
		title: '';
		labelRotation: -30;
		numberOfTicks: 10;
		numberOfLabels: 10;
		labelConversion: [ :v | (Date julianDayNumber: v + oldestMethod date julianDayNumber) ].
	b build.

	lb := RTLegendBuilder new.
	lb view: b view.
	lb addText: 'Amount of modified methods along time'.
	lb build.

	b view inspect
]

{ #category : #hooks }
RTPackageLife >> label [
	^ 'Package evolution'
]
