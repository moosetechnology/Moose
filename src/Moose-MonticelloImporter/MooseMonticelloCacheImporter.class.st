"
MooseMonticelloCacheImporter supports the loading of files from a folder

Instance Variables:
	directoryString	<ProtoObject | PseudoContext>
"
Class {
	#name : #MooseMonticelloCacheImporter,
	#superclass : #MooseMonticelloImporter,
	#instVars : [
		'directoryString'
	],
	#category : #'Moose-MonticelloImporter'
}

{ #category : #'hook - private' }
MooseMonticelloCacheImporter >> setRepository [
	repositoryCache := MCCacheRepository uniqueInstance
]
