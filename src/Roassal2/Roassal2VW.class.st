"
A simple class to export Roassal and trachel packages to visualworks
"
Class {
	#name : #Roassal2VW,
	#superclass : #Object,
	#category : #'Roassal2-ExporterVW'
}

{ #category : #accesing }
Roassal2VW >> blacklist [
	^ { RTGeneralExample>>#combiningRoassalAndMorphic. 
	RTElementTest >> #testPlatformPopup. 
	RTRoassalExample >> #examplePlatformPoup.
	RTAbstractExample class >> #createIcon.
	FileReference >> #gtInspectorCsvIn:.
	RTTabTable >> #gtInspectorTableIn:.
	RTExploraBuilderExample >> #exampleCircularList.
	RTHTML5ExporterExample >> #exportAll.
	RTPopupTest >> #testPopupView.
	RTPopupTest >> #testPopupView02.
	RTBuilder >> #openWithToolbar.
	RTView >> #openWithToolbar.
	RTView >> #spotterShapesFor:.
	RTView >> #spotterShapesModelsFor:.
	RTGrapherTest >> #testError.
	RTMondrianTest >> #testSourceError.
	RTObject class >> #gtExamplesFactory.
	TRDarkTheme >> #trachelCanvasColor.
	TRTheme class >> #infer.
	RTMondrianTest >> #testNodesError.
	ClassDescription >> #rtmethods.
	ClassDescription >> #oldestMethod.
	ClassDescription >> #ageInDays.
	ClassDescription >> #gotMethodOnDay:.
	 }
]

{ #category : #importing }
Roassal2VW >> bundleOrder [
"


b := Registry bundleNamed: 'Roassal2'.
list := b containedItems.
arr := #('Roassal2' 'Roassal2-Core' 'Roassal2-Trachel-Core' 'Roassal2-Builder-Common' 'Roassal2-Builder-Menu' 'Roassal2-Interactions' 'Roassal2-Utility' 'Roassal2-Shapes' 'Roassal2-Builder-Grapher-Core' 'Roassal2-Trachel-Shapes' 'Roassal2-Trachel-Events' 'Roassal2-Animation' 'Roassal2-Selection' 'Roassal2-AttachPoint' 'Roassal2-Experimental' 'Roassal2-Pharo' 'Roassal2-Trachel-Viva' 'Roassal2-Builder-DSM' 'Roassal2-Trachel-Core-Theme' 'Roassal2-Extentions' 'Roassal2-Visualworks' 'Roassal2-Builder-StructureMatrix').

arr doWithIndex: [:n :i | | r |
	r := list select: [ :d | d name = n ].
	r size = 1 ifFalse: [ self halt].
	list remove: r first.
	list add: r first beforeIndex: i.
	].
b containedItems: list.

b := Registry bundleNamed: 'Roassal2-Tests'.
list := b containedItems.
arr2 := #('Roassal2-Core-Tests' 'Roassal2-Trachel-Tests' 'Roassal2-AttachPoint-Tests').
arr2 doWithIndex: [:n :i | | r |
	r := list select: [ :d | d name = n ].
	r size = 1 ifFalse: [ self halt].
	list remove: r first.
	list add: r first beforeIndex: i.
	].
b containedItems: list.

b := Registry bundleNamed: 'Roassal2-Examples'.
list := b containedItems.
r := list select: [:d | d name = 'Roassal2-Examples-Extentions'].
list remove: r first.
list add: r first.
b containedItems: list.

"
]

{ #category : #importing }
Roassal2VW >> codeForVisualWorks [
	"
	Transcript open.
	self new packages do: [ :pkg|
		Transcript show: 'm1 add: ''',pkg package name, '-',pkg name, '''.'; cr  ].
	"
	"
| map b btests bexamples classes p cat m1 currentB |
m1 := OrderedCollection new.

m1 add: 'Roassal2-Builder-Grapher-Decorators-Tests'.
m1 add: 'Roassal2-Builder-Kiviat'.
m1 add: 'Roassal2-Builder-Explora'.
m1 add: 'Roassal2-Builder-NameCloud'.
m1 add: 'Roassal2-Builder-UI-Slider'.
m1 add: 'Roassal2-Builder-ApplicationMatrix'.
m1 add: 'Roassal2-Builder-Spectrograph'.
m1 add: 'Roassal2-AttachPoint'.
m1 add: 'Roassal2-ColorNormalizerOBSOLETE'.
m1 add: 'Roassal2-Builder-CircularMap'.
m1 add: 'Roassal2-Builder-AnimatedScatterPlot'.
m1 add: 'Roassal2-Builder-Mondrian'.
m1 add: 'Roassal2-Builder-Sunburst'.
m1 add: 'Roassal2-Animation'.
m1 add: 'Roassal2-AttachPoint-Tests'.
m1 add: 'Roassal2-Shapes'.
m1 add: 'Roassal2-Builder-Timeline-Tests'.
m1 add: 'Roassal2-Scaling-Tests'.
m1 add: 'Roassal2-Builder-Legend'.
m1 add: 'Roassal2-Builder-UML'.
m1 add: 'Roassal2-Builder-Grapher-Core'.
m1 add: 'Roassal2-Exporter-SVG'.
m1 add: 'Roassal2-Builder-Grapher-Obsolete'.
m1 add: 'Roassal2-Builder-Map-Tests'.
m1 add: 'Roassal2-Sparkline'.
m1 add: 'Roassal2-ExampleBrowser'.
m1 add: 'Roassal2-Interactions-Resize'.
m1 add: 'Roassal2-Interactions'.
m1 add: 'Roassal2-Builder-SimilarityMatrix'.
m1 add: 'Roassal2-Builder-Map'.
m1 add: 'Roassal2-Builder-Grapher-Tests'.
m1 add: 'Roassal2-ColorNormalizer'.
m1 add: 'Roassal2-Tests'.
m1 add: 'Roassal2-Builder-Calendar'.
m1 add: 'Roassal2-Layouts'.
m1 add: 'Roassal2-Exporter-PNG'.
m1 add: 'Roassal2-Selection'.
m1 add: 'Roassal2-Core'.
m1 add: 'Roassal2-Utility'.
m1 add: 'Roassal2-Builder-DSM'.
m1 add: 'Roassal2-Layouts-Tests'.
m1 add: 'Roassal2-Table'.
m1 add: 'Roassal2-Builder-TextBuilder'.
m1 add: 'Roassal2-Exporter-HTML5'.
m1 add: 'Roassal2-Core-Tests'.
m1 add: 'Roassal2-Cachetor'.
m1 add: 'Roassal2-Builder-Composer'.
m1 add: 'Roassal2-Interactions-Resize-Tests'.
m1 add: 'Roassal2-Builder-TreeMap'.
m1 add: 'Roassal2-Builder-MondrianOLD'.
m1 add: 'Roassal2-Builder-BoxPlot'.
m1 add: 'Roassal2-Builder-Timeline'.
m1 add: 'Roassal2-Builder-PieChart'.
m1 add: 'Roassal2-Builder-Grapher-Decorators'.
m1 add: 'Roassal2-Builder-Grapher-Labeling'.
m1 add: 'Roassal2-Scaling'.
m1 add: 'Roassal2-Builder-Simon'.
m1 add: 'Roassal2-Builder-Menu'.
m1 add: 'Roassal2-Builder-AxisAdapted'.
m1 add: 'Roassal2-Builder-ScrollBar'.
m1 add: 'Roassal2-Experimental'.
m1 add: 'Roassal2-LineDecorations'.
m1 add: 'Roassal2-Builder-Common'.
m1 add: 'Roassal2-Builder-StackBarPlot'.
m1 add: 'Roassal2-Builder-ScatterplotMap'.
m1 add: 'Roassal2-Builder-StructureMatrix'.
m1 add: 'Trachel-Viva'.
m1 add: 'Trachel-Events'.
m1 add: 'Trachel-Tests'.
m1 add: 'Trachel-ShapesForArrow'.
m1 add: 'Trachel-Shapes'.
m1 add: 'Trachel-Core'.
m1 add: 'Trachel-Examples'.
m1 add: 'Trachel-Callbacks'.


b := Registry bundleNamed: 'Roassal2'.
btests := Registry bundleNamed: 'Roassal2-Tests'.
bexamples := Registry bundleNamed: 'Roassal2-Examples'.
map := Dictionary new.
classes := b allClasses.
currentB := nil.
classes do:[:cls | 
	cat := cls myClass category asString.
	(m1 includes: cat) ifTrue: [

		currentB := b.
		('*Test' match: cls myClass name) ifTrue: [ 
			currentB := btests.
			('*Tests' match: cat) 
				ifFalse: [ cat := cat , '-Tests'.] ]
			ifFalse: [
		(('*Example*' match: cls myClass name) or: [ '*Examples' match: cls myClass name]) 
			ifTrue: [ 
				currentB := bexamples.
				cat := cat , '-Examples' ] ].
		('Trachel*' match: cat) 
			ifTrue: [ cat := 'Roassal2-', cat ].
		p := map at: cat ifAbsent: [ 
			p := Registry packageNamedOrCreate: cat.
			currentB addItem: p.
			map at: cat put: p.
			p  ]. 
		XChangeSet current moveWholeClass: cls toPackage: p ]. ].

"
]

{ #category : #importing }
Roassal2VW >> codeToDeletePackages [
	"
| b arr list |
list := OrderedCollection new.
list 
	add: 'Roassal2-Extentions'; 
	add: 'Roassal2-Pharo';
	add: 'Roassal2-Visualworks'; 
	add: 'Roassal2-Tests-Extentions';
	add: 'Roassal2-Examples-Extentions'.
arr := Array with: 'Roassal2' with: 'Roassal2-Examples' with: 'Roassal2-Tests'.
arr do: [ :ar | 
	b := Registry bundleNamed: ar.
	b leafItems do: [ :pkg | 
		(list includes: pkg name) ifFalse: [
			pkg doUnloadFromImage.
		]. ]. ].


	"
			
			
]

{ #category : #exporting }
Roassal2VW >> exportPackages [
	<script: 'self new exportPackages'>
	self exporter export
]

{ #category : #accesing }
Roassal2VW >> exporter [
	| cls |
	cls := Smalltalk classOrTraitNamed: 'Pharo2VW'.
	cls ifNil: [ ^ nil ].
	^  cls exporter
		environment: 'Roassal2';
		methodsBlacklist: self blacklist;
		packages: {'Roassal2'. 'Trachel'} 
			without: {
				'Trachel-MorphSpecific'. 'Roassal2-OpenStreetMap'. 
				'Roassal2-MorphSpecific'. 'Roassal2-Plugins'.
				'Roassal2-ExporterVW'. 'Roassal2-MorphSpecific-Menu' };
		yourself
]

{ #category : #loadExporter }
Roassal2VW >> loadExporter [
	Gofer it
		smalltalkhubUser: 'ObjectProfile' project: 'Pharo2VW';
		package: 'Pharo2VW';
		load.

]
