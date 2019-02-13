Class {
	#name : #RTPDFExporterPlugin,
	#superclass : #RTAbstractPlugin,
	#category : #'Roassal2-Plugins'
}

{ #category : #hooks }
RTPDFExporterPlugin >> description [
	^ 'When you open a visualization, you can export it by clicking on the "..." icon. 
By loading this plugin, you will be able to export the visualization as a PDF file.'
]

{ #category : #hooks }
RTPDFExporterPlugin >> execute [
	Gofer new 
		smalltalkhubUser: 'azazael' project: 'RTPDFExporter';
		package: 'ConfigurationOfRTPDFExporter'; load.
	(Smalltalk at: #ConfigurationOfRTPDFExporter) loadDevelopment
]

{ #category : #testing }
RTPDFExporterPlugin >> isLoaded [
	^ RPackageOrganizer default includesPackageNamed: 'RTPDFExporter'
]

{ #category : #hooks }
RTPDFExporterPlugin >> label [
	^ 'Install PDF Exporter'
]
