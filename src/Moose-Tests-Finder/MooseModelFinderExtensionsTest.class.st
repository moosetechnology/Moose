Class {
	#name : #MooseModelFinderExtensionsTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Moose-Tests-Finder'
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
	| windows |
	windows := self getAllWindows.
	[MooseModel browseMeta] 
		ensure: [ (self getAllWindows copyWithoutAll: windows) do: #delete   ].
	
]

{ #category : #tests }
MooseModelFinderExtensionsTest >> testMenuBrowseMetaOn [
	| builder |
	builder := PragmaMenuBuilder new.
	self assert: builder itemList isNil.
	MooseModel menuBrowseMetaOn: builder.
	self assert: builder itemList isCollection.
	self assert: builder itemList notEmpty.

]

{ #category : #tests }
MooseModelFinderExtensionsTest >> testMooseInterestingEntity [
	| storage state |
	model := MooseModel new.
	state := model privateState.
	storage := model entityStorage.
	
	model mooseInterestingEntity.

	self assert: model privateState == state.
	self assert: model entityStorage == storage.


]

{ #category : #tests }
MooseModelFinderExtensionsTest >> testbrowseCodeWithDependencies [
	| windows |
	windows := self getAllWindows.
	[self model browseCodeWithDependencies] 
		ensure: [ (self getAllWindows copyWithoutAll: windows) do: #delete   ].
	
]

{ #category : #tests }
MooseModelFinderExtensionsTest >> testbrowseCodeWithNamespaces [
	| windows |
	windows := self getAllWindows.
	[MooseModel new browseCodeWithNamespaces] 
		ensure: [ (self getAllWindows copyWithoutAll: windows) do: #delete   ].
	
]
