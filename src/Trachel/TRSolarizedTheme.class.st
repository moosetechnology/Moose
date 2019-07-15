Class {
	#name : #TRSolarizedTheme,
	#superclass : #TRTheme,
	#category : #'Trachel-Core-Theme'
}

{ #category : #hooks }
TRSolarizedTheme >> background [
	self subclassResponsibility
]

{ #category : #'solarized colors' }
TRSolarizedTheme >> base0 [
	^ Color fromRgb256Triplet: #(131 148 150)
]

{ #category : #'solarized colors' }
TRSolarizedTheme >> base00 [
	^ Color fromRgb256Triplet: #(101 123 131)
]

{ #category : #'solarized colors' }
TRSolarizedTheme >> base01 [
	^ Color fromRgb256Triplet: #(88 110 117)
]

{ #category : #'solarized colors' }
TRSolarizedTheme >> base02 [
	^ Color fromRgb256Triplet: #(7 54 66)
]

{ #category : #'solarized colors' }
TRSolarizedTheme >> base03 [
	^ Color fromRgb256Triplet: #(0 43 54)
]

{ #category : #'solarized colors' }
TRSolarizedTheme >> base1 [
	^ Color fromRgb256Triplet: #(147 161 161)
]

{ #category : #'solarized colors' }
TRSolarizedTheme >> base2 [
	^ Color fromRgb256Triplet: #(238 232 213)
]

{ #category : #'solarized colors' }
TRSolarizedTheme >> base3 [
	^ Color fromRgb256Triplet: #(253 246 227)
]

{ #category : #'solarized colors' }
TRSolarizedTheme >> blue [
	^ Color fromRgb256Triplet: #(38 139 210)
]

{ #category : #'solarized colors' }
TRSolarizedTheme >> cyan [
	^ Color fromRgb256Triplet: #(42 161 152)
]

{ #category : #'solarized colors' }
TRSolarizedTheme >> green [
	^ Color fromRgb256Triplet: #(133 153 0)
]

{ #category : #'solarized colors' }
TRSolarizedTheme >> magenta [
	^ Color fromRgb256Triplet: #(211 54 130)
]

{ #category : #'solarized colors' }
TRSolarizedTheme >> orange [
	^ Color fromRgb256Triplet: #(203 75 22)
]

{ #category : #'solarized colors' }
TRSolarizedTheme >> red [
	^ Color fromRgb256Triplet: #(220 50 47)
]

{ #category : #'solarized colors' }
TRSolarizedTheme >> violet [
	^ Color fromRgb256Triplet: #(108 113 196)
]

{ #category : #'solarized colors' }
TRSolarizedTheme >> yellow [
	^ Color fromRgb256Triplet: #(181 137 0)
]
