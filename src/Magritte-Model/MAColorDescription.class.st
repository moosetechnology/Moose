"
I am a description of colors, possible values are instances of ==Color==. My visual representation could be a color-chooser.
"
Class {
	#name : #MAColorDescription,
	#superclass : #MAElementDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MAColorDescription class >> defaultKind [
	^ GRPlatform current magritteColorClass
]

{ #category : #testing }
MAColorDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MAColorDescription class >> label [
	^ 'Color'
]

{ #category : #visiting }
MAColorDescription >> acceptMagritte: aVisitor [
	aVisitor visitColorDescription: self
]
