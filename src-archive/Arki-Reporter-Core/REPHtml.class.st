Class {
	#name : #REPHtml,
	#superclass : #REPReporter,
	#category : #'Arki-Reporter-Core'
}

{ #category : #private }
REPHtml >> end [
	stream 
		nextPutAll: '</body>';
		nextPutAll: '</html>';
		close
]

{ #category : #private }
REPHtml >> printConcern: aConcern [
	stream 
		nextPutAll: '<h3>';
		nextPutAll: (self encode: aConcern label);
		nextPutAll: '</h3>';
		lf;
		nextPutAll: '<pre>';
		nextPutAll: (aConcern class methodNamed: #'computeResult') sourceCode;
		nextPutAll: '</pre>';
		lf.
	aConcern status isNeutralStatus ifTrue: [
		stream
			nextPutAll: '<ul>';
			nextPutAll: '<li>';
			nextPutAll: (('</li> <li>') join: (aConcern result asOrderedCollection collect: #gtDisplayString));
			nextPutAll: '</li>';
"				nextPutAll: (self encode: aConcern stringResult);
				nextPutAll: '</li';
"			nextPutAll: '</ul>';
			lf
		].

]

{ #category : #private }
REPHtml >> start [
	stream := StandardFileStream forceNewFileNamed: spec root label, '.html'.
	stream ascii.
	stream nextPutAll: '<html>'; lf.
	stream nextPutAll: '<head>
<style>
body { font-family:"Arial" }
pre {color: gray; font-size: 8pt;}
h3 { margin-top: 40px; }
ul { list-style: none; margin-top: 20px; }
li { margin-top: 5px; }

</style>
</head>'.
	stream 
		nextPutAll: '<body>'; 
			nextPutAll: '<h1>';
			nextPutAll: (self encode: spec root label); 
			nextPutAll: '</h1>';
			lf
]
