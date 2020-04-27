"
GLMScriptingEditorTemplate offers a simple template for building scripting editors.

It offers basically three panes:
- one for the script
- one for the set of input variables
- one for the preview once you accept the script

A typical case is provided by the GLMMondrianEasel.

To open any of the subclasses, you need to provide an array of associations whose values represent the names of a variables and the values are the objects referred by these variables. These variables can then be used in the code of the script.
"
Class {
	#name : #GLMScriptingEditorTemplate,
	#superclass : #GLMBrowserTemplate,
	#category : #'Glamour-Tools'
}

{ #category : #'instance creation' }
GLMScriptingEditorTemplate class >> open [
	^ self openOn: {}
]

{ #category : #building }
GLMScriptingEditorTemplate >> buildBrowser [
	browser := GLMTabulator new.
	self setTitleOf: browser.
	browser
		row: #result span: 2;
		row: [ :r | 
					r
						column: #script span: 3;
						column: #variables span: 2 ].
	browser transmit
		to: #script;
		andShow: [ :a | self scriptIn: a ].
	browser transmit
		to: #variables;
		andShow: [ :a | self variablesIn: a ].
	browser transmit
		to: #result;
		fromOutsidePort: #entity;
		from: #script;
		andShow: [ :a | self resultIn: a ].
	^ browser
]

{ #category : #building }
GLMScriptingEditorTemplate >> defaultScriptBindings [
	"Override this method if you want to provide more bindings for your editor.
	Typically these bindings are related to the Facade that offers the entry point to the scripting API"
	^ {}
]

{ #category : #building }
GLMScriptingEditorTemplate >> defaultScriptDisplayIn: aPresentation [
	^ ''
]

{ #category : #building }
GLMScriptingEditorTemplate >> defaultTitle [
	^ 'Editor'
]

{ #category : #building }
GLMScriptingEditorTemplate >> resultIn: a [
	"Override this method to describe the presentation that should show the result
	of evaluating the script"
	self subclassResponsibility 
]

{ #category : #building }
GLMScriptingEditorTemplate >> scriptIn: a [
	^ a pharoScript
		title: 'Script';
		variableBindings: [ :bindings | 
					| col |
					col := OrderedCollection withAll: bindings.
					col addAll: self defaultScriptBindings.
					col ];
		with: [:p | self defaultScriptDisplayIn: p ];
		populate: #selection
			icon: GLMUIThemeExtraIcons glamorousPlay
			on: $s
			entitled: 'Generate'
			with: [ :text | text text ]
	";	act: [:text | text text ] icon: GLMUIThemeExtraIcons glamorousAccept entitled: 'Install'"
]

{ #category : #building }
GLMScriptingEditorTemplate >> setTitleOf:  b [
	b title: self defaultTitle
]

{ #category : #building }
GLMScriptingEditorTemplate >> variablesIn: a [
	^ a table
		selectionAct: [:t | t selection value inspect ] on: $i entitled: 'Inspect';
		selectionAct: [:t | t selection value explore ] on: $I entitled: 'Explore';		
		column: 'Variable' evaluated: [ :each | each key asString ];
		column: 'Value' evaluated: [ :each | each value asString contractTo: 20 ]
]
