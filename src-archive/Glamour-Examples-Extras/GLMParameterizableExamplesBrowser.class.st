"
This is an abstract class that provides the infrastructure for an example browser. It is meant to work with classes that hold examples in methods.
"
Class {
	#name : #GLMParameterizableExamplesBrowser,
	#superclass : #GLMBrowserTemplate,
	#category : #'Glamour-Examples-Extras'
}

{ #category : #building }
GLMParameterizableExamplesBrowser >> buildBrowser [
	browser := GLMTabulator new.
	self installTitle.
	browser
		column: #titles;
		column: #example span: 4.
	browser transmit
		to: #titles;
		andShow: [ :a | self exampleListIn: a ].
	browser transmit
		to: #example;
		fromOutsidePort: #entity;
		from: #titles;
		andShow: [ :a | self exampleIn: a ].
	^ browser
]

{ #category : #building }
GLMParameterizableExamplesBrowser >> compose [
	self tabulator with: [ :browser | 
		browser
			column: #titles;
			column: #example span: 4.
		browser transmit
			to: #titles;
			andShow: [ :a | self exampleListIn: a ].
		browser transmit
			to: #example;
			fromOutsidePort: #entity;
			from: #titles;
			andShow: [ :a | self exampleIn: a ] ]
]

{ #category : #building }
GLMParameterizableExamplesBrowser >> exampleIn: composer [
	self renderedExampleIn: composer.
	composer pharoMethod
		title: 'Source code';
		act: [ :text :exampleClass :exampleSelector | Smalltalk tools browser openOnClass: exampleClass selector: exampleSelector ]
			icon: GLMUIThemeExtraIcons glamorousBrowse
			entitled: 'Browse';
		smalltalkClass: [ :exampleClass | exampleClass ];
		doItReceiver: [ :exampleClass | exampleClass ];
		display: [ :exampleClass :exampleSelector | exampleClass sourceCodeAt: exampleSelector ]
]

{ #category : #building }
GLMParameterizableExamplesBrowser >> exampleListIn: a [
	^ a list
		title: 'Examples';
		display: [ :exampleClass | self exampleSelectorsFromClass: exampleClass ];
		sorted: [ :x :y | x < y ];
		format: [ :selector | ' ' join: ((selector piecesCutWhereCamelCase reject: [:each | each endsWith: ':']) collect: #capitalized) ]
]

{ #category : #hooks }
GLMParameterizableExamplesBrowser >> exampleSelectorsFromClass: exampleClass [
	self subclassResponsibility
]

{ #category : #building }
GLMParameterizableExamplesBrowser >> installTitle [
	"Override this method for specific title"
]

{ #category : #hooks }
GLMParameterizableExamplesBrowser >> renderedExampleIn: composer [
	self subclassResponsibility
]
