"
Reference:
 	[1] An Extension of Wilkinson's Algorithm for positioning Tick Labels on Axes  (Justin Talbot, Sharon Lin, Pat Hanrahan)
"
Class {
	#name : #RTLabelGenerator,
	#superclass : #RTObject,
	#instVars : [
		'nice',
		'loose',
		'n',
		'w',
		'epsilon'
	],
	#category : #'Roassal2-Builder-Grapher-Labeling'
}

{ #category : #'instance creation' }
RTLabelGenerator class >> nice: aNiceGenerator [
	^ self new nice: aNiceGenerator
]

{ #category : #private }
RTLabelGenerator >> coverageMin: dmin max: dmax lmin: lmin lmax: lmax [
	| a b c|
	a := dmax - lmax.
	b := dmin - lmin.
	c := 0.1 * (dmax - dmin).
	^ 1 - ( 0.5 * (((a * a) + (b * b))/ (c * c)) )
	
]

{ #category : #private }
RTLabelGenerator >> coverageMin: dmin max: dmax span: span [
	| range r half|
	range := dmax - dmin.
	(span > range) ifTrue: [ 
		half := (span - range)/2.
		r := 0.1*range.
		^ 1 - (half * half / (r * r) )].
	^ 1.0
]

{ #category : #private }
RTLabelGenerator >> density: k m: m dmin: dmin dmax: dmax lmin: lmin lmax: lmax [
	"* k		number of labels
	 * m		number of desired labels
	 * dmin	data range minimum
	 * dmax	data range maximum
	 * lmin	label range minimum
	 * lmax	label range maximum
	 * ^	density
	  
	 k-1 number of intervals between labels
	 m-1 number of intervals between desired number of labels
	 r   label interval length/label range
	 rt  desired label interval length/actual range"
	| r rt |
	r := (k -1)/(lmax - lmin).
	rt := (m - 1)/((lmax max: dmax) - (lmin min: dmin) ).
	^ 2 - ( (r/rt) max: (rt/r) ).
]

{ #category : #private }
RTLabelGenerator >> densityMax: k m: m [
	(k >= m) ifTrue: [ ^ 2 - ((k-1)/(m-1)) ].
	^ 1
]

{ #category : #private }
RTLabelGenerator >> epsilon [
	" Compute the machine epsilon for the float type, the largest positive 
 	floating-point value that, when added to 1, results in a value equal to 1 due to 
 	roundoff."
	| temp |
	epsilon ifNotNil: [ ^ epsilon ].
	temp := 0.5.
	[ (1 + temp) > 1 ] whileTrue: [ temp := temp / 2 ].
	epsilon := temp.
	^ epsilon.
	
]

{ #category : #private }
RTLabelGenerator >> flooredMod: a n: num [
	^ a - (num * (a / num) floor).
]

{ #category : #initialization }
RTLabelGenerator >> initialize [
	super initialize.
	nice := nil.
	loose := false.
	w := #(0.25 0.2 0.5 0.05)
]

{ #category : #private }
RTLabelGenerator >> legibility: min max: max step: step [
	^ 1
]

{ #category : #public }
RTLabelGenerator >> nice: aNiceGenerator [
	nice := aNiceGenerator
]

{ #category : #public }
RTLabelGenerator >> searchMin: dmin max: dmax desired: desiredNumberOfTicks [
	| best sm dm cm delta bestScore k |
	best := RTGrapherLabel new.
	bestScore := -2.
	desiredNumberOfTicks <= 0 ifTrue: [ self error: 'The minimun value of desiredNumberOfTicks is 1' ].
	
	"In case of a particular situation"
	(dmin = 0 and: [ dmax = 0 ]) ifTrue: [ 
		best
			min: 0;
			max: 1;
			step: 1;
			score: bestScore.
		^ best ].
	
	[ :break |
		[ true ] whileTrue: [ 
			n := nice next.
			sm := self simplicityMax.
			((self w: sm c: 1 d: 1 l: 1) < bestScore)
				ifTrue: [ break value ].
			k := 2.
			[ :break2 |
				[ true ] whileTrue: [ | z |
					dm := [ self densityMax: k m: desiredNumberOfTicks ] on: ZeroDivide do: [ :ex | self error: 'Please increase the value of desiredNumberOfTicks/labels' ].
					((self w: sm c: 1 d: dm l: 1) < bestScore) 
						ifTrue: [ break2 value ].
					delta := (dmax - dmin)/(k+1)/ n j/ (nice qat: n i).
					z := (nice logB: delta) ceiling.
					[ :break3|
						[ true ] whileTrue: [ 
							[ :continue | | minStart maxStart step |
								step := n j * (nice qat: n i) * (nice base raisedTo: z).
								cm := self coverageMin: dmin max: dmax span: step * (k-1).
								((self w: sm c: cm d: dm l: 1) < bestScore) 
									ifTrue: [ break3 value ].
								minStart := ((dmax / step) floor - (k-1)) * n j.
								maxStart := (dmin / step) ceiling * n j.
								(minStart > maxStart) ifTrue: [ 
									z := z +1.
									continue value. ].
						
								(minStart to: maxStart) do: [ :start |
									| lmin lmax lstep c s d l score |
									lmin := start * step / n j. 
									lmax := lmin + (step * (k -1)).
									lstep := step.
									c := self coverageMin: dmin max: dmax lmin: lmin lmax: lmax.
									s := self simplicity: lmin max: lmax step: lstep.
									d := self density: k m: desiredNumberOfTicks dmin: dmin dmax: dmax lmin: lmin lmax: lmax.
									l := self legibility: lmin max: lmax step: lstep.
									score := self w: s c: c d: d l: l.
							
									((score > bestScore) and: 
									[ loose not or: [ (lmin <= dmin) and: 
														  [ lmax >= dmax ] ] ]) ifTrue: [
										best
											min: lmin;
											max: lmax;
											step: lstep;
											score: score.
											bestScore := score.
									 ].
								].
								z := z +1.
							] valueWithExit.
						].
					] valueWithExit. 
					k := k +1.
				].
			] valueWithExit.
		 ]
	] valueWithExit.
	
	nice reset.
	
	^ best.
]

{ #category : #public }
RTLabelGenerator >> setLooseFlag: aBool [
	"Configuration to 'loose' labelings.
	The extreme labels can be placement both inside(setLooseFlag: false) and outside (setLooseFlag: true) of the range of the data.
	
	Example
	.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=
	lg setLooseFlag: true.
	label := lg searchMin: -98.0 max: 18.0 desired: 3.
	self assert: label asString = '(Score: 0.14) -100.00	-60.00	-20.00	20.00	'.
	lg setLooseFlag: false.
	label := lg searchMin: -98.0 max: 18.0 desired: 3.
	self assert: label asString = '(Score: 0.62) -100.00	-50.00	0.00	'.
	.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=.=
	"
	loose := aBool.
	nice reset.
]

{ #category : #private }
RTLabelGenerator >> simplicity: min max: max step: step [
	(nice qvar size > 1) ifTrue: [ 
		^ 1 - (n i/ (nice qvar size - 1)) - n j + (self vMin: min max: max step: step) ].
	^ 1 - n j + (self vMin: min max: max step: step)
		
]

{ #category : #private }
RTLabelGenerator >> simplicityMax [
	(nice qvar size > 1) ifTrue: [ ^ 1 - ((n i )/(nice qvar size -1)) - n j + 1.0 ].
	 ^ 1 - n j + 1.0
]

{ #category : #private }
RTLabelGenerator >> vMin: min max: max step: step [
	^ ((self flooredMod: min n: step) < (self epsilon) 
	and: [ min <= 0 and: [ max >= 0 ] ]) ifTrue: [ 1 ] ifFalse: [ 0 ]
]

{ #category : #private }
RTLabelGenerator >> w: s c: c d: d l: l [
	^ (w first * s) + (w second * c) + (w third * d) + (w fourth * l)
]
