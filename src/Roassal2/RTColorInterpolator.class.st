"
I am the interpolator  for colors
"
Class {
	#name : #RTColorInterpolator,
	#superclass : #RTInterpolator,
	#category : #'Roassal2-Builder-Grapher-Scaling'
}

{ #category : #'color categories' }
RTColorInterpolator class >> category10 [
	^ self colorHex: #(2062260 16744206 2924588 14034728 9725885 9197131 14907330 8355711 12369186 1556175)
	
]

{ #category : #'color categories' }
RTColorInterpolator class >> category20 [
	^ self colorHex: #(2062260 11454440 16744206 16759672 2924588 10018698 14034728 16750742 9725885 12955861 9197131 12885140 14907330 16234194 8355711 13092807 12369186 14408589 1556175 10410725)
	
]

{ #category : #'color categories' }
RTColorInterpolator class >> category20b [
	^ self colorHex: #(3750777 5395619 7040719 10264286 6519097 9216594 11915115 13556636 9202993 12426809 15186514 15190932 8666169 11356490 14049643 15177372 8077683 10834324 13528509 14589654)
	
]

{ #category : #'color categories' }
RTColorInterpolator class >> category20c [
	^ self colorHex: #(3244733 7057110 10406625 13032431 15095053 16616764 16625259 16634018 3253076 7652470 10607003 13101504 7695281 10394312 12369372 14342891 6513507 9868950 12434877 14277081)
	
]

{ #category : #helpers }
RTColorInterpolator class >> colorHex: arr [
	^ arr collect: [ :value | Color colorFrom: (
		'#', (self hex: value >> 16),
		(self hex: value >> 8 & 255), 
		(self hex: value & 255))
		 ].
	
]

{ #category : #helpers }
RTColorInterpolator class >> hex: v [
	^ (v < 16 ifTrue: [ '0' ] ifFalse: [ '' ]), v printStringHex
]

{ #category : #accessing }
RTColorInterpolator >> interpolate: t [
	^ Color
		r: start red + ((stop red - start red) * t)
		g: start green + ((stop green - start green)  * t)
		b: start blue + ((stop blue - start blue) * t)
		alpha: start alpha + ((stop alpha - start alpha) * t)
]

{ #category : #'as yet unclassified' }
RTColorInterpolator >> start: anObject [
	start := Color colorFrom: anObject
]

{ #category : #'as yet unclassified' }
RTColorInterpolator >> stop: anObject [
	stop := Color colorFrom: anObject
]
