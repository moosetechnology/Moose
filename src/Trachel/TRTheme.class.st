Class {
	#name : #TRTheme,
	#superclass : #TRObject,
	#classVars : [
		'Current'
	],
	#category : #'Trachel-Core-Theme'
}

{ #category : #'base color' }
TRTheme class >> blue [
	^ self current blue
]

{ #category : #accessing }
TRTheme class >> current [
	Current ifNotNil: [ ^ Current ].
	Current := self infer.
	^ Current
]

{ #category : #'base color' }
TRTheme class >> cyan [
	^ self current cyan
]

{ #category : #generic }
TRTheme class >> emphasisColor [
	^ self red
]

{ #category : #'base color' }
TRTheme class >> green [
	^ self current green
]

{ #category : #accessing }
TRTheme class >> infer [
	^ ('*Dark*' match: UITheme current class name)
			ifTrue: [ TRDarkSolarizedTheme new ]
			ifFalse: [ TRWhiteSolarizedTheme new ]
]

{ #category : #'base color' }
TRTheme class >> magenta [
	^ self current magenta
]

{ #category : #'base color' }
TRTheme class >> orange [
	^ self current orange
]

{ #category : #generic }
TRTheme class >> primaryColor [
	^ self blue
]

{ #category : #'base color' }
TRTheme class >> red [
	^ self current red
]

{ #category : #generic }
TRTheme class >> secondaryEmphasisColor [
	^ self green
]

{ #category : #'base color' }
TRTheme class >> violet [
	^ self current violet
]

{ #category : #'base color' }
TRTheme class >> white [
	^ self current white
]

{ #category : #'base color' }
TRTheme class >> yellow [
	^ self current yellow
]

{ #category : #accessing }
TRTheme >> trachelCanvasColor [
	^ self subclassResponsibility 
]

{ #category : #accessing }
TRTheme >> transformColor: aColor [
	"Per default, there is no color transformation"
	^ aColor
]
