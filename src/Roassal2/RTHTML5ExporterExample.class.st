"
Examples of HTML exporter
"
Class {
	#name : #RTHTML5ExporterExample,
	#superclass : #RTObject,
	#category : #'Roassal2-Exporter-HTML5'
}

{ #category : #private }
RTHTML5ExporterExample >> createIndexFor: aCollection [
	| index stream text |
	index := TRPlatform current workingDirectory / 'index.html'.
	index exists ifTrue: [ index delete ].
	stream := index writeStream.
	[ stream nextPutAll: 
'<!DOCTYPE html>
<html>
	<head>
		<title>Roassal Examples</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript" src="http://objectprofile.com/bjqs.js"></script>
		<link type="text/css" rel="Stylesheet" href="https://raw.githubusercontent.com/jcobb/basic-jquery-slider/master/bjqs.css" />
		<link type="text/css" rel="Stylesheet" href="http://basic-slider.com/css/main.css" />
		
		<style type="text/css">
			body{
				margin: 0 auto
			}
			h1{
				text-align: center
			}
			iframe{
				border: 1px solid lightblue
			}
			img{
				position: absolute;
				top: 50%;
				left: 50%;
				margin-left: -100px;
				width: 200px;
				margin-top: -100px;
				display: none
			}
		</style>
	</head>
	<body><center>
		<div id="my-slideshow">
			<ul class="bjqs">'.
	
	(aCollection sorted: [ :a :b| a selector <= b selector ]) do: [ :met |
		text := met methodClass name,'-', met selector asString.
		stream nextPutAll: '
	<li>
	<h1>',text,'</h1>'.
		stream nextPutAll: '
	<iframe width="800" height="800" ref="',met methodClass name, '-',met selector,'.html"></iframe>
	</li>'.
		].
	stream nextPutAll: 
'			</ul>
		</div>
		<img src="http://bradsknutson.com/wp-content/uploads/2013/04/page-loader.gif" style="display: none;">
	<script type="text/javascript">
		$(document).ready( function(){
			$("#my-slideshow").bjqs({
				height: 900,
				width: 1000,
				responsive: true,
				visiblemarkers: 15,
				animspeed: 8000
			});
		});
	</script>
	</center></body>
</html>'. ] ensure: [ stream close ].
	^ index.


]

{ #category : #examples }
RTHTML5ExporterExample >> example01 [
	"
	self new example01
	"

	| e view |
	e := RTHTML5Exporter new.
	view := RTView new.
	view canvas color: Color gray.
	RTShape withAllSubclasses
		do:
			[ :cls | view add: (RTBox elementOn: cls) @ RTPopup @ RTDraggable ].
	view @ RTDraggableView.
	RTEdgeBuilder new
		view: view;
		objects: RTShape withAllSubclasses;
		connectFrom: #superclass to: #yourself.
	RTTreeLayout on: view elements.
	e export: view.
	^ view
]

{ #category : #examples }
RTHTML5ExporterExample >> exportAll [
	"
	self new exportAll
	"
	| examples index stream views name exporter st blacklist v view |
	(self confirm: 'Are you sure to run this example? Warning: Several files are created') ifFalse: [ ^ self ].
blacklist := OrderedCollection new
	add: RTOpenStreetMapExample;
	add: RTAnimatedScatterPlotExample;
	add: RTAnimationExample;
	add: RTConstraintExample;
	add: RTExploraBuilderExample;
	add: RTLineDecorationExample;
	add: RTDynamicStackerGrapherExample.
examples := ((RTAbstractExample subclasses select: [ :cls | (blacklist includes: cls) not ] )collect: #new) sortedAs: #label.
index := TRPlatform current workingDirectory / 'index.html'.
index exists ifTrue: [ index delete ].
stream := index writeStream.
views := Dictionary new.
examples doWithIndex: [ :ex :i | | link |
	v := RTView new.
	v @ RTDraggableView @ RTZoomableView .
	ex gtOpenOn: v.
	name := views size printStringHex.
	views at: ex put: name.
	
	v elements copy do: [ :e| |n |
		n := views size printStringHex.
		views at: e model put: n.
		(e model method = (RTSpectrographExample >> #exampleRoassalVisualization)) ifTrue: [ 
			v canvas removeShape: (e attributes at: #RTLabelledLabel).
			v removeElement: e. ]
		ifFalse: [ 
			view := e model returnValue.
			[ (view isKindOf: RTBuilder) ifTrue: [ view build. view := view view ].
			view @ RTDraggableView @ RTZoomableView.
			exporter := RTHTML5Exporter new 
				fileName: n, '.html';
				shouldCreateJS: false.
			exporter createStream.
			st := exporter stream.
			exporter export: view toStream: st ] on: Error do: [
				st close.
				v canvas removeShape: (e attributes at: #RTLabelledLabel).
				v removeElement: e ].
		].
	].
	
	RTGridLayout new
		gapSize: 50;
		on: v elements.
	link := RTLinkView new name: [:e | views at: e ].
	v elements @ link.
	
	RTHTML5Exporter new 
		fileName: name, '.html';
		shouldCreateJS: i = 1;
		export: v.
	].

[
	stream 
		nextPutAll: '
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Example Browser</title>
        <meta name="description" content="simple example browser">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/demo.css">
        <link rel="stylesheet" href="css/default.css">
        <!-- Pushy CSS -->
        <link rel="stylesheet" href="css/pushy.css">
        
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="js/highlight.pack.js"></script>
    </head>
    <body class="pushy-open-left">
        <header class="site-header push">
            <div class="menu-btn">&#9776; Menu</div><div id="title">Simple example</div>
            <div class="objectprofile"><a href="http://objectprofile.com"><img src="../img/opsmall.png"/>Object Profile</a></div></header>
        <nav class="pushy pushy-left">
            <ul>'.
		examples do: [ :ex |
			stream 
				nextPutAll: '
                <li id="';
				nextPutAll: (views at: ex);
				nextPutAll: '"></li>.'
			 ].
		stream nextPutAll: '
            </ul>
        </nav>
        <div id="container">
            <iframe id="frame"></iframe>
            <pre><code class="html" id="source"></code></pre>
        </div>
        <script>
            var titles = [];'.
		examples do: [ :ex | 
			stream 
				nextPutAll: '
            titles[''';
				nextPutAll: (views at: ex);
				nextPutAll: '''] = ''';
				nextPutAll: ex label;
				nextPutAll: ''';'. ].
		stream nextPutAll: '
				var sources = [];'.
		examples do: [ :ex | 
			ex gtExamples do: [ :examp| 
				stream 
					nextPutAll: '
				sources[''';
				 	nextPutAll: (views at: examp);
					nextPutAll: '''] = ''';
					nextPutAll: (TRPlatform current mimeEncode: examp method asString readStream multiLine: false);
					nextPutAll: ''';'. ] ].
		stream nextPutAll: '
        </script>
        <script src="js/pushy.js"></script>
        <script src="js/examples.js"></script>
    </body>
</html>
'
	] ensure: [ stream close ].
views
]

{ #category : #examples }
RTHTML5ExporterExample >> exportExampleCircleLayoutAndEdges [
	| e view|
	e := RTHTML5Exporter new.
	view := RTRoassalExample new perform: #exampleCircleLayoutAndEdges.
	
	e export: view.
]

{ #category : #examples }
RTHTML5ExporterExample >> exportExampleClusterLayout [
	| e view|
	e := RTHTML5Exporter new.
	view := RTRoassalExample new perform: #exampleClusterLayout.
	
	e export: view.
]

{ #category : #examples }
RTHTML5ExporterExample >> exportExampleColoredAndInteractionLabel [
	| e view|
	e := RTHTML5Exporter new.
	view := RTGrapherExample new perform: #exampleColoredAndInteractionLabel.
	
	e export: view.
]

{ #category : #examples }
RTHTML5ExporterExample >> exportExampleHappyNewYear [
	| e view|
	e := RTHTML5Exporter new.
	view := RTAnimationExample new perform: #exampleHappy2014.
	
	e export: view.
]

{ #category : #examples }
RTHTML5ExporterExample >> exportExampleLabels [
	| e view|
	e := RTHTML5Exporter new.
	view := RTRoassalExample new perform: #exampleLabels.
	
	e export: view.
]

{ #category : #examples }
RTHTML5ExporterExample >> exportExampleLazyFormLoading [
	| e view|
	e := RTHTML5Exporter new.
	view := RTRoassalExample new perform: #exampleLazyFormLoading.
	
	e export: view.
]
