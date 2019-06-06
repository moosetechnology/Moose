Class {
	#name : #BaselineOfMooseXMLWriter,
	#superclass : #BaselineOf,
	#category : #BaselineOfMoose
}

{ #category : #baselines }
BaselineOfMooseXMLWriter >> baseline: spec [
	<baseline>
	spec
		package: 'XML-Writer-Core';
		package: 'XML-Writer-Tests';
		package: 'Collections-Tests-OrderPreservingDictionary';
		package: 'XML-Tests-Parser';
		package: 'XML-Parser-GTExtensions'
]
