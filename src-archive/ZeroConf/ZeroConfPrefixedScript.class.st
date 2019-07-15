"
I combine several ZeroConf scripts which are treated as prefix for code generation.
The final script name is not altered by the prefix.

Example:
========
	prefiexedScript := scriptA / scriptB.

Then the output script is in `scriptA basename / scriptB basename, '.sh'` and the final script will have both the contents of `scriptA` and `scriptB`
"
Class {
	#name : #ZeroConfPrefixedScript,
	#superclass : #ZeroConfCombinedScript,
	#instVars : [
		'prefixScripts',
		'inlinePrefixScripts'
	],
	#category : 'ZeroConf'
}

{ #category : #'instance creation' }
ZeroConfPrefixedScript class >> withPrefix: aScript [
	^ self new
		addPrefix: aScript;
		yourself
]

{ #category : #'instance creation' }
ZeroConfPrefixedScript class >> withPrefix: aScript with: anotherScript [
	^ self new
		addPrefix: aScript;
		addPrefix: anotherScript;
		yourself
]

{ #category : #combining }
ZeroConfPrefixedScript >> / otherZeroConf [
	^ otherZeroConf prefixedWithAll: self
]

{ #category : #accessing }
ZeroConfPrefixedScript >> addAllPrefix: moreScripts [
	^ prefixScripts addAll: moreScripts
]

{ #category : #accessing }
ZeroConfPrefixedScript >> addPrefix: script [
	^ prefixScripts add: script
]

{ #category : #accessing }
ZeroConfPrefixedScript >> defaultDirectory [
	| fileReference |
	fileReference := FileLocator workingDirectory.
	self prefixScripts do: [ :script |
		fileReference := fileReference / script basename ].
	^ fileReference
]

{ #category : #'script generation' }
ZeroConfPrefixedScript >> generateBody [
	self inlinePrefixScripts 
		ifTrue: [ self generatePrefixScripts ].
	super generateBody
]

{ #category : #'script generation' }
ZeroConfPrefixedScript >> generatePrefixScripts [

	self prefixScripts do: [ :script |
		script generateBodyOn: self outputStream.
		self cr. ].
]

{ #category : #'script generation' }
ZeroConfPrefixedScript >> generateScripts [

	self inlinePrefixScripts 
		ifTrue: [ ^ self scripts ].
		
	^ self prefixScripts, self scripts
]

{ #category : #'initialize-release' }
ZeroConfPrefixedScript >> initialize [
	prefixScripts := OrderedCollection new.
	inlinePrefixScripts := false.
	^ super initialize
]

{ #category : #testing }
ZeroConfPrefixedScript >> inlinePrefixScripts [
	^ inlinePrefixScripts
]

{ #category : #accessing }
ZeroConfPrefixedScript >> prefixScripts [
	^ prefixScripts
]
