"
This baseline claims the xmlwriting. 



"
Class {
	#name : #BaselineOfMooseXMLParser,
	#superclass : #BaselineOf,
	#category : #BaselineOfMooseXMLParser
}

{ #category : #baselines }
BaselineOfMooseXMLParser >> baseline: spec [
	<baseline>
	spec
		package: 'XML-Parser'
			with: [ spec
				requires:
					#('Collections-OrderPreservingDictionary' 'Collections-Tests-OrderPreservingDictionary') ];
		package: 'XML-Parser-GTExtensions'
			with: [ spec requires: 'XML-Tests-Parser' ];
		package: 'XML-Tests-Parser' with: [ spec requires: 'XML-Parser' ];
		package: 'XML-Writer-Core'
			with: [ spec
				requires:
					#('Collections-OrderPreservingDictionary' 'Collections-Tests-OrderPreservingDictionary') ];
		package: 'XML-Writer-Tests'
			with: [ spec requires: 'XML-Writer-Core' ];
		package: 'Collections-OrderPreservingDictionary';
		package: 'Collections-Tests-OrderPreservingDictionary'
			with: [ spec requires: #('Collections-OrderPreservingDictionary') ].
	spec
		group: 'Core'
			with:
			#('XML-Parser' 'XML-Tests-Parser' 'XML-Writer-Core' 'XML-Writer-Tests');
		group: 'CoreUI' with: #(Core 'XML-Parser-GTExtensions')
]
