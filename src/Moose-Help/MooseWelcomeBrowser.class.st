"
A welcome browser for the Moose environment.
See superclass for more implementation details
"
Class {
	#name : #MooseWelcomeBrowser,
	#superclass : #StWelcomeBrowser,
	#category : #'Moose-Help'
}

{ #category : #'instance creation' }
MooseWelcomeBrowser class >> closePharoWelcomeThenOpen [

	self superclass allInstancesDo: [ :browser |
		browser withWindowDo: #close ].
	self openForRelease
]

{ #category : #accessing }
MooseWelcomeBrowser class >> logo [

	^ Form fromBinaryStream:
		  MooseConfiguration mooseLogoContents base64Decoded readStream
]

{ #category : #'instance creation' }
MooseWelcomeBrowser class >> open [

	<script>
	self new open
]

{ #category : #'instance creation' }
MooseWelcomeBrowser class >> openForRelease [
	<script>
	| window |
	
	window := self new open.
	"HACK: reset extent and position because it seems to not being taken 
	 into account before opening. Using directly the morphic widget, as we 
	 know we are still in morphic world."
	window withAdapterDo: [ :anAdapter | 
		anAdapter widget
			position: (((self environment classNamed: #OSWorldRenderer) defaultExtent - self windowExtent) / 2) asIntegerPoint;
			extent: self windowExtent ]
]

{ #category : #'accessing - labels' }
MooseWelcomeBrowser >> mainToolsContent [

	^ '# Main Moose tools

Some suggestions on what you can do with Moose.
				
### Starting

First, use the  model browser to create or load an internal model of a system: 
```pharoeval
MiModelRootBrowser open
```
You will need to ''Propagate'' this model to other tools.
Then, you can inspect the content of your model: 
```pharoeval
MiInspectorBrowser open
```
Keep an eye on opened tools with the Overview browser: 
```pharoeval
MiOverviewBrowser open
```

### Manipulating

You can select specific entities in a model with the Query browser: 
```pharoeval
MiQueriesBrowser open
```
You can also annotate entities with the Tag browser: 
```pharoeval
MiTagBrowser open
```

### Visualization

There are various visualizations available on different kind of entities:
Architectural browser: 
```pharoeval
MiArchitecturalMapBrowser open
```
CoUsage map browser: 
```pharoeval
MiCoUsageMapBrowser open
```'
]

{ #category : #'accessing - labels' }
MooseWelcomeBrowser >> mainToolsLabel [

	^ 'Main tools'
]

{ #category : #private }
MooseWelcomeBrowser >> topics [

	^ {
		  (self
			   newTopicTitle: self welcomeLabel
			   contents: self welcomeContent).
		  (self
			   newTopicTitle: self mainToolsLabel
			   contents: self mainToolsContent) }
]

{ #category : #'accessing - contents' }
MooseWelcomeBrowser >> welcomeContent [

	| version |
	version := MooseVersion current.

	^ '
# Welcome to Moose  {1}
 
![test](pharo:///MooseWelcomeBrowser/logo)	

Moose is a platform for software analysis.

It allows to represent software system in a model, to query, manipulate, transform, visualize this model.

Moose is based on Pharo and it''s open source under BSD/MIT.

For more information, please visit online documentation: [modularmoose.org](https://modularmoose.org/moose-wiki/).

Version {2}. Commit: [{3}](https://github.com/moosetechnology/Moose/commit/{4})'
		  format: {
				  version major.
				  version versionNumber.
				  (version commitHash first: 7).
				  version commitHash }
]

{ #category : #'accessing - labels' }
MooseWelcomeBrowser >> welcomeLabel [

	^ 'Welcome to Moose ' , MooseVersion current major
]
