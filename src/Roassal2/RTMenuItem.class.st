Class {
	#name : #RTMenuItem,
	#superclass : #RTObject,
	#instVars : [
		'name',
		'callback',
		'selected',
		'after',
		'rawmenu',
		'color',
		'background'
	],
	#category : #'Roassal2-Builder-Menu'
}

{ #category : #accesing }
RTMenuItem >> after [
	^ after
]

{ #category : #accesing }
RTMenuItem >> after: ablock [
	after := ablock
]

{ #category : #accesing }
RTMenuItem >> callback [
	^ callback
	
]

{ #category : #accesing }
RTMenuItem >> callback: ablock [
	callback := ablock
	
]

{ #category : #accesing }
RTMenuItem >> color [
	^ color
]

{ #category : #accesing }
RTMenuItem >> color: aColor [
	color := aColor
]

{ #category : #public }
RTMenuItem >> execute: m [
	self callback value.
	self after ifNotNil: [self after value: m.]
]

{ #category : #'initialize-release' }
RTMenuItem >> initialize [
	super initialize.
	selected := false.
	name := ''.
	callback := [  ].
	after := nil.
]

{ #category : #accesing }
RTMenuItem >> label [
	^ (self selected ifTrue:['* '] ifFalse:['']), self name.
]

{ #category : #accesing }
RTMenuItem >> menu: menu [
	rawmenu := menu.
]

{ #category : #accesing }
RTMenuItem >> menuBackground [
	^ background 
]

{ #category : #accesing }
RTMenuItem >> menuBackground: aShape [

	background := aShape
]

{ #category : #accesing }
RTMenuItem >> name [
	^ name
]

{ #category : #accesing }
RTMenuItem >> name: aString [
	name := aString.
]

{ #category : #accesing }
RTMenuItem >> rawmenu [
	^ rawmenu
]

{ #category : #accesing }
RTMenuItem >> selected [
	^ selected
]

{ #category : #accesing }
RTMenuItem >> selected: abool [
	selected := abool
]

{ #category : #public }
RTMenuItem >> update [
	| width pos ext|
	width := self menuBackground width.
	ext := self rawmenu encompassingRectangle extent.
	pos := self menuBackground position + (( (ext x - width)/2 )@0).
	
	self menuBackground extent: ext.
	self menuBackground translateTo: pos.
	self rawmenu translateTo: pos.
]
