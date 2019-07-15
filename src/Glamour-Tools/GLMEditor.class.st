"
This is an Glamour-based editor for Glamour browsers.

Example:
self openOn: {#variable->'value'}

This will open the editor with a variable named #variable whose value will be 'value'.
"
Class {
	#name : #GLMEditor,
	#superclass : #GLMScriptingEditorTemplate,
	#category : #'Glamour-Tools'
}

{ #category : #private }
GLMEditor >> createResultBrowserWithBindings: bindings andScript: script [
	| context resultBrowser scriptedBrowser composer |
	composer := GLMCompositePresentation new.
	context := GLMDoItContext with: #composer -> composer withAll: bindings.
	[ (Smalltalk compiler requestor: self) evaluate: script in: context to: context ]
		on: Error
		do: [ :e | 
			self inform: e class name , ': ' , e messageText halt. 
			^ GLMWrapper new show: #text; startOn: e class name , ': ' , e messageText ].
	scriptedBrowser := composer first.
	resultBrowser := GLMTabulator new.
	resultBrowser column: #theOuterPane.
	resultBrowser transmit
		fromOutsideEntityPort;
		to: #theOuterPane;
		andShow: [ :a | a custom: scriptedBrowser ].	"this is a bit of a hack.
	we take the entity as specified in the script by taking it directly
	from the evaluated script browser.
	this is needed because right now the input entity is specified 
	in the same script with the browser"
	^ resultBrowser startOn: composer entity
]

{ #category : #building }
GLMEditor >> defaultScriptBindings [
	^ {#composer -> GLMCompositePresentation new}
]

{ #category : #building }
GLMEditor >> defaultScriptDisplayIn: aTextPresentation [
	^ aTextPresentation 
		display: 'composer';
		morphicAct: [:text | GLMBasicExamples open ] icon: GLMUIThemeExtraIcons glamorousExample entitled: 'Browse basic examples'
]

{ #category : #building }
GLMEditor >> defaultTitle [
	^ 'Glamour Editor'
]

{ #category : #building }
GLMEditor >> resultIn: composite [
	composite dynamic
		title: 'Preview';
		display: [ :bindings :script | self createResultBrowserWithBindings: bindings andScript: script ];
		act: [ :dynamic | 
				dynamic cachedPresentation presentations first panes first presentations first openTree ] 
			entitled: 'View browser tree';
		act: [:dynamic | dynamic cachedPresentation presentations first panes first presentations first explore ]
			icon: GLMUIThemeExtraIcons glamorousInspect
			entitled: 'Explore';
		act: [ :dynamic | 
				dynamic cachedPresentation presentations first panes first presentations first open ] 
			icon: GLMUIThemeExtraIcons glamorousSpawn
			entitled: 'Spawn browser'
]
