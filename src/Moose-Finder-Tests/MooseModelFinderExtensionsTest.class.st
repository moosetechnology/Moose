Class {
	#name : #MooseModelFinderExtensionsTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Moose-Finder-Tests'
}

{ #category : #tests }
MooseModelFinderExtensionsTest >> getAllWindows [
	^ World submorphs select: #isSystemWindow

]

{ #category : #util }
MooseModelFinderExtensionsTest >> model [
	" to debug and avoid caching behavior: LANPackageTestResource reset."
	^ LANPackageTestResource current model 
]

{ #category : #running }
MooseModelFinderExtensionsTest >> setUp [
	super setUp.
	model := MooseModel new.
]

{ #category : #tests }
MooseModelFinderExtensionsTest >> testBrowseCodeWithPackages [
	| windows |
	windows := self getAllWindows.
	[self model browseCodeWithPackages] 
		ensure: [ (self getAllWindows copyWithoutAll: windows) do: #delete   ].
	
]

{ #category : #tests }
MooseModelFinderExtensionsTest >> testBrowseMeta [

	"MetaBrowser is to be fixed using Spec2"

	<expectedFailure>
	| windows |
	windows := self getAllWindows.
	[ MooseModel browseMeta ] ensure: [ 
		(self getAllWindows copyWithoutAll: windows) do: #delete ]
]

{ #category : #tests }
MooseModelFinderExtensionsTest >> testbrowseCodeWithDependencies [

	"MetaBrowser is to be fixed using Spec2"

	<expectedFailure>
	| windows |
	windows := self getAllWindows.
	[ self model browseCodeWithDependencies ] ensure: [ 
		(self getAllWindows copyWithoutAll: windows) do: #delete ]
]

{ #category : #tests }
MooseModelFinderExtensionsTest >> testbrowseCodeWithNamespaces [
	| windows |
	windows := self getAllWindows.
	[MooseModel new browseCodeWithNamespaces] 
		ensure: [ (self getAllWindows copyWithoutAll: windows) do: #delete   ].
	
]
