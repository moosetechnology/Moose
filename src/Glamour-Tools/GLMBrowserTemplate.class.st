Class {
	#name : #GLMBrowserTemplate,
	#superclass : #Object,
	#instVars : [
		'browser'
	],
	#category : #'Glamour-Tools'
}

{ #category : #opening }
GLMBrowserTemplate class >> openOn: anEntity [
	^ self new openOn: anEntity
]

{ #category : #opening }
GLMBrowserTemplate class >> startOn: anEntity [
	^ self new startOn: anEntity
]

{ #category : #accessing }
GLMBrowserTemplate >> browser [
	^ browser ifNil: [self buildBrowser. browser]
]

{ #category : #building }
GLMBrowserTemplate >> buildBrowser [
	^ self subclassResponsibility
]

{ #category : #opening }
GLMBrowserTemplate >> openOn: anEntity [
	^ self browser openOn: anEntity
]

{ #category : #opening }
GLMBrowserTemplate >> startOn: anEntity [
	^ self browser startOn: anEntity
]
