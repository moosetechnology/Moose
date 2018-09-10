Class {
	#name : #GLMGlobalBrowserTemplate,
	#superclass : #GLMBrowserTemplate,
	#category : #'Glamour-Tools'
}

{ #category : #opening }
GLMGlobalBrowserTemplate class >> open [
	^ self new
		open
]

{ #category : #opening }
GLMGlobalBrowserTemplate >> entity [
	^ self subclassResponsibility
]

{ #category : #opening }
GLMGlobalBrowserTemplate >> open [
	^ self openOn: self entity
]
