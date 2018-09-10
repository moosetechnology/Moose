Class {
	#name : #TRWhiteTheme,
	#superclass : #TRPlainColorTheme,
	#classInstVars : [
		'default'
	],
	#category : #'Trachel-Core-Theme'
}

{ #category : #accessing }
TRWhiteTheme class >> default [
	"Return the default theme"
	default ifNil: [ default := self new ].
	^ default
]

{ #category : #accessing }
TRWhiteTheme >> trachelCanvasColor [
	^ Color white
]
