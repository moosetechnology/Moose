Class {
	#name : #RTVisualIDPlugin,
	#superclass : #RTAbstractPlugin,
	#category : #'Roassal2-Plugins'
}

{ #category : #hooks }
RTVisualIDPlugin >> description [
	^ 'VisualID is a glyph-based object identification technique. It generates a unique glyph for each
 object that is inputed. Similarities may exist between two glyphs depending on how similar their
respective objects are.'
]

{ #category : #hooks }
RTVisualIDPlugin >> execute [
	Gofer new
		smalltalkhubUser: 'abergel' project: 'VisualIDGlyph';
		package: 'VisualIDGlyph';
		load.
		
"	Metacello new
	  baseline: 'VisualID';
	  repository: 'github://bergel/VisualID:master';
	  load. "

	"Gofer new
		smalltalkhubUser: 'IgnacioFernandez' project: 'VisualiDs';
		configurationOf: 'VisualID';
		loadBleedingEdge.
		"
		
"	Gofer new
		smalltalkhubUser: 'IgnacioFernandez' project: 'VisualiDs';
		package: 'VisualID';
		package: 'VisualID-Clustering';
		package: 'VisualID-Random';
		package: 'VisualID-Roassal';
		package: 'VisualID-Canvas';
		package: 'VisualID-Test';
		load"
]

{ #category : #testing }
RTVisualIDPlugin >> isLoaded [
	^ RPackageOrganizer default includesPackageNamed: 'VisualIDGlyph'
 
]

{ #category : #hooks }
RTVisualIDPlugin >> label [
	^ 'VisualID shapes'
]
