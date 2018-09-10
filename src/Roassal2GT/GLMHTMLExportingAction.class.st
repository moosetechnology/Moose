Class {
	#name : #GLMHTMLExportingAction,
	#superclass : #GLMRoassal2Action,
	#category : #'Roassal2GT-Glamour-Actions'
}

{ #category : #accessing }
GLMHTMLExportingAction >> category [
	^ 'Export as...'
]

{ #category : #hooks }
GLMHTMLExportingAction >> execute [
	| fileName |
	fileName := (RTHTML5Exporter new export: self roassalView) asUrl.
	"self openIfPossible: fileName."
]

{ #category : #hooks }
GLMHTMLExportingAction >> openIfPossible: fileName [
	"
	By Sean
	
	Gofer it
	smalltalkhubUser: 'SeanDeNigris' project: 'SeansPlayground';
	package: 'NewExternalWebBrowser';
	load.

	'http://google.com' asUrl open.
	"
	
	#NewExternalWebBrowser asClassIfPresent: [ :cls | fileName asUrl open ].
	#NewExternalWebBrowser asClassIfAbsent: [ 
		self inform: 'Try to load NewExternalWebBrowser to fast open of this file' ].
]

{ #category : #hooks }
GLMHTMLExportingAction >> title [
	^ 'Export to HTML'
]
