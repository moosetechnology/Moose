Class {
	#name : #FamixShouldNotUseSymbolsToAccessLocalEntities,
	#superclass : #Warning,
	#instVars : [
		'symbol',
		'generator'
	],
	#category : #'Famix-MetamodelBuilder-Core-Exception'
}

{ #category : #signalling }
FamixShouldNotUseSymbolsToAccessLocalEntities class >> signalFor: aSymbol [
	self new
		symbol: aSymbol;
		signal
]

{ #category : #signalling }
FamixShouldNotUseSymbolsToAccessLocalEntities class >> signalFor: aSymbol from: aGenerator [
	self new
		symbol: aSymbol;
		generator: aGenerator;
		signal
]

{ #category : #accessing }
FamixShouldNotUseSymbolsToAccessLocalEntities >> generator [
	^ generator
]

{ #category : #accessing }
FamixShouldNotUseSymbolsToAccessLocalEntities >> generator: anObject [
	generator := anObject
]

{ #category : #accessing }
FamixShouldNotUseSymbolsToAccessLocalEntities >> messageText [
	^ 'Should not use a symbol to access to local entity named: ' , symbol , ' in: ' , generator class name
		,
			'. In a Famix generator, local entities should be accessed via a direct reference and remote entity should be accessed via symbol, or via a direct reference in case of conflict in multiple sub metamodels.'
]

{ #category : #accessing }
FamixShouldNotUseSymbolsToAccessLocalEntities >> symbol [
	^ symbol
]

{ #category : #accessing }
FamixShouldNotUseSymbolsToAccessLocalEntities >> symbol: anObject [
	symbol := anObject
]
