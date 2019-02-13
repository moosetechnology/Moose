Class {
	#name : #RTSmallMultipleStatisticScript,
	#superclass : #RTUsefulScript,
	#category : #'Roassal2-Plugins'
}

{ #category : #accessing }
RTSmallMultipleStatisticScript >> description [
	^ 
'Gives the statistic of a TSV file (like a CSV file but with tabulation instead of comma).
The file should have 4 columns: time<TAB>n1<TAB>n2<TAB>weight.
time is an integer value. It could represent a time period.
n1 and n2 are string values. 
weight is a float value.

A textual description is provided.'
]

{ #category : #hooks }
RTSmallMultipleStatisticScript >> execute [
	<script: 'RTSmallMultipleManyScript new execute'>

	| times n1 n2 weights nbDataPoints c tab |
	times := Set new.
	n1 := Set new.
	n2 := Set new.
	weights := Set new.
	nbDataPoints := 0.
	
	tab := RTTabTable openTSVfile.
	tab ifNil: [ ^ self ].
	tab values do: [ :line |
		nbDataPoints := nbDataPoints + 1.
		times add: line first.
		n1 add: line second.
		n2 add: line third.
		weights add: line fourth ].
	c := (WriteStream on: String new)
			nextPutAll: 'Number of data points ';
			nextPutAll: nbDataPoints asString; cr;
			
			nextPutAll: 'Number of n1 elements ';
			nextPutAll: n1 size asString; cr;
			
			nextPutAll: 'Number of times ';
			nextPutAll: times size asString; cr;
			
			nextPutAll: 'Number of n2 elements ';
			nextPutAll: n2 size asString; cr;

			nextPutAll: 'Number of weight elements ';
			nextPutAll: weights size asString; cr;

			contents.
	c inspect
]

{ #category : #hooks }
RTSmallMultipleStatisticScript >> label [
	^ 'CSV Statistics'
]
