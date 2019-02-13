Class {
	#name : #RTGrapherScatterplotExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Builder-Grapher-Examples'
}

{ #category : #sources }
RTGrapherScatterplotExample >> exampleAgeOfRoassalAndTrachel [
 
| methodsRoassal methodsTrachel greatestAge b ds |
methodsRoassal := RTObject withAllSubclasses flatCollect: #rtmethods.
methodsTrachel := TRObject withAllSubclasses flatCollect: #rtmethods.

methodsRoassal := methodsRoassal select: [ :m | m numberOfLinesOfCode < 300 ].
methodsTrachel := methodsTrachel select: [ :m | m numberOfLinesOfCode < 300 ].

greatestAge := (methodsTrachel , methodsRoassal collect: [ :m | m date asUnixTime ]) min.

b := RTGrapher new.
b extent: 300 @ 300.

ds := RTData new.
ds interaction popup.
ds dotShape circle color: (Color blue alpha: 0.3); size: 5.
ds points: methodsRoassal.
ds x: [ :m | ((m date asUnixTime - greatestAge) / 3600) asFloat ] .
ds y: #numberOfLinesOfCode.
b add: ds.

ds := RTData new.
ds dotShape circle color: (Color red alpha: 0.3); size: 5.
ds points: methodsTrachel.
ds x: [ :m | ((m date asUnixTime - greatestAge) / 3600) asFloat ] .
ds y: #numberOfLinesOfCode.
b add: ds.

b axisX numberOfTicks: 4.
b axisY numberOfTicks: 4.
b build.
^ b view
]

{ #category : #icons }
RTGrapherScatterplotExample >> exampleAgeOfRoassalAndTrachelIcon [
	^ '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'
]

{ #category : #sources }
RTGrapherScatterplotExample >> exampleCrosses [
	| b ds |
	b := RTGrapher new.
	b extent: 300 @ 300.
	ds := RTData new.
	ds dotShape cross color: (Color red alpha: 0.3).
	ds points: (RTShape withAllSubclasses flatCollect: #rtmethods).
	ds x: #numberOfLinesOfCode.
	ds y: [ :m | m sourceCode size ].
	b add: ds.
	^ b
]

{ #category : #icons }
RTGrapherScatterplotExample >> exampleCrossesIcon [
	^ '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'
]

{ #category : #sources }
RTGrapherScatterplotExample >> exampleDateOnXAxis [
 	| methods oldestMethod b ds |
	methods := RTObject withAllSubclasses flatCollect: #rtmethods.
	methods := methods reject: [ :m | m numberOfLinesOfCode > 150 ].
	oldestMethod := methods minFor: #date.

	b := RTGrapher new.
	b extent: 300 @ 200.

	ds := RTData new.
	ds dotShape circle size: 5; color: (Color blue alpha: 0.1).
	ds interaction popup.
	ds points: methods.
	ds y: #numberOfLinesOfCode.
	ds x: [ :m | m date julianDayNumber - oldestMethod date julianDayNumber ].
	b add: ds. 

	b axisY 
		noDecimal;
		title: 'LOC'.
	
	b axisX 
		title: '';
		labelRotation: -30;
		labelConversion: [ :v | (Date julianDayNumber: v + oldestMethod date julianDayNumber) ].

	^ b
]

{ #category : #sources }
RTGrapherScatterplotExample >> exampleDateOnXAxis2 [
	| dates minDate b ds |
	dates := Array with: Date today with: Date yesterday with: Date yesterday previous.
	minDate := dates min.
	b := RTGrapher new.
	b extent: 300 @ 200.
	ds := RTData new.
	ds interaction popup.
	ds dotShape rectangle color: Color blue.
	ds points: dates.
	ds x: [ :aDate | aDate julianDayNumber - minDate julianDayNumber ].
	ds y: [ :d | d dayOfWeek \\ 7 ].
	b add: ds.
	b axisX
		labelRotation: -30;
		labelConversion: [ :v | Date julianDayNumber: v + minDate julianDayNumber ].
	b build.
	^ b view
]

{ #category : #icons }
RTGrapherScatterplotExample >> exampleDateOnXAxis2Icon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADKklEQVR4XuXczUtqQRzGcf+5
/pkWLjNpYS4KdRFtglAUCSNcCBYVGpEpJb6BIkobXZmGIYovkBL8jDmXe7lw48qxPCN9H4ha
9NB4Puo4M3Rs8zk/6xQb/xLwQfjhg/BB+OGD8EH44YPwQfjhg/BB+OGD8MMH4YPwwwfhg/DD
B+GD8MMH4YPwwwfhxzqQdrstf3/nRyOI1+uVi4sLA2IwGEi/3/8HZTgcSrVanfd6PQyYzaYJ
JJPJyPb2tuRyOXG5XKLy2e/VajX+q2ed5hA+CB+ED8IH4YPwQfggfBBLPn7yQfhZHcjb25tx
sZ+fn4UPohmk2WxKvV43LvbW1tanF12t1FOpFGqlrg1kNBpJPp83Vuput1tmsxl/pc6fQ/gg
prO52eWD8EH4IPy3LD4IH4QPwgfhg5jK7wXf/87U+SAWghweHi48U+ev1C0CeXp6ErVlwj9T
588hfBA+CB+ED8IH4YPwQfggfBA+iJUg4/GYf6a+TiA+n49/pr4uIOVyWTY2Nvhn6vw5hA/C
B+GD8EH4IHwQPggfhA/CB7EUpNvtLjxTL5VK8tWdgJ/Y/XaQ3d1dY0Gofl50pv7w8CCVSsX0
1+3t7XyZns5uoVDQ8wq5u7uTvb29hWfqr6+vSz/bfnKXf68T/qT+a/NxMpkIv6sZRM0dDodD
AoGAOJ1O4Xc1gZyensrBwYHc398bg4rFYsLvagJRH33f39+NwV1dXQm/qwmkWCzK+fm5tFot
Y1DX19fC72oAUWuLo6MjsdvtEo/H/wyQ39UAcnx8LOr9c39/X8w+Q2jdlYJks1k5OTkRtR1i
9rZ+tO5KQdTkpf4nfWdnRxqNhqTTaeF3NYCovZnLy0tjYMFgUPhdjSDqJpdnZ2cSCoWM908r
uureKTq6X328KwNRG2NqQJFIxBhQIpGQ6XQqVnRvbm6ML6u7Ho9HHh8fTXctAel0OpJMJsXv
94vaDjDzB76jGw6HTV+M7+hGo1F5eXmRtdxcXOaBUbtrsw7hhw/CB+GHD8IH4YcPwg8fhA/C
Dx+ED8IPH4QPwg8fhA/CDx+EHz4IH4QfPggfhB8+CB+En1XlA+KfYhAltsKuAAAAAElFTkSu
QmCC'
]

{ #category : #icons }
RTGrapherScatterplotExample >> exampleDateOnXAxisIcon [
	^ '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
0U/6AdFM/wHYRxAyEaJaiwAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTGrapherScatterplotExample >> exampleSeismDepthAndMag [
	<noTest>
	|tab ds b |
	tab := RTTabTable new 
		input: (TRPlatform current downloadContent: 
	 'http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_month.csv')
		usingDelimiter: $,.
	tab removeFirstRow.
	tab replaceEmptyValuesWith: '0' inColumns: #(4 5).
	tab convertColumnsAsFloat: #(4 5).


	b := RTGrapher new.
	ds := RTData new.
	ds interaction popup.
	ds points: tab values.
	ds dotShape color: (Color blue alpha: 0.3).
	ds x: [ :row | row at: 4 ].
	ds y: [ :row | row at: 5 ].
	b add: ds.

	b maxY: 8.
	b maxX: 700.

	b axisX title: 'depth'.
	b axisY title: 'magnitude'.
	^ b
]

{ #category : #icons }
RTGrapherScatterplotExample >> exampleSeismDepthAndMagIcon [
	^ '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
H3lF1g9+YtrbAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTGrapherScatterplotExample >> examplescatterPlots [
	| methodsRoassal methodsTrachel greatestAge b ds |
	methodsRoassal := RTObject withAllSubclasses flatCollect: #rtmethods.
	methodsTrachel := TRObject withAllSubclasses flatCollect: #rtmethods.
	methodsRoassal := methodsRoassal select: [ :m | m numberOfLinesOfCode < 300 ].
	methodsTrachel := methodsTrachel select: [ :m | m numberOfLinesOfCode < 300 ].
	greatestAge := (methodsTrachel , methodsRoassal collect: [ :m | m date asUnixTime ]) min.
	b := RTGrapher new.
	b extent: 300 @ 300.
	ds := RTData new.
	ds dotShape circle
		color: (Color blue alpha: 0.3);
		size: 5.
	ds
		points: methodsRoassal;
		x: [ :m | (m date asUnixTime - greatestAge) / 3600 ];
		y: #numberOfLinesOfCode.
	ds interaction popup.
	b add: ds.
	ds := RTData new.
	ds dotShape circle
		color: (Color red alpha: 0.3);
		size: 5.
	ds
		points: methodsTrachel;
		x: [ :m | (m date asUnixTime - greatestAge) / 3600 ];
		y: #numberOfLinesOfCode.
	ds interaction popup.
	b add: ds.
	b axisX
		noDecimal;
		noLabel;
		title: 'Time'.
	b axisY
		noDecimal;
		title: 'Number of lines of code'.
	^ b
]

{ #category : #icons }
RTGrapherScatterplotExample >> examplescatterPlotsIcon [
	^ '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'
]

{ #category : #accessing }
RTGrapherScatterplotExample >> label [
	^ 'Grapher - Scatterplots'
]
