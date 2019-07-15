Class {
	#name : #RTFixFontProblemPlugin,
	#superclass : #RTAbstractPlugin,
	#category : #'Roassal2-Plugins'
}

{ #category : #hooks }
RTFixFontProblemPlugin >> description [
	^ 'Time to time, fonts used in Roassal are abnormaly displayed. It happens on Windows.
When the problem happens, this plugin should fix it.'
]

{ #category : #testing }
RTFixFontProblemPlugin >> doesItLoadCode [
	^ false
]

{ #category : #hooks }
RTFixFontProblemPlugin >> execute [

	CairoGlyph class removeSelector: #byteAlignment.
	CairoGlyph rebuildFieldAccessors.
]

{ #category : #hooks }
RTFixFontProblemPlugin >> label [
	^ 'Fix font problem'
]
