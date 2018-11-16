Class {
	#name : #SmaCCRewriteServerCommandLineHandler,
	#superclass : #CommandLineHandler,
	#instVars : [
		'port'
	],
	#category : #'SmaCC_Rewrite_Server'
}

{ #category : #accessing }
SmaCCRewriteServerCommandLineHandler class >> commandName [
	^ 'SmaCCServer'
]

{ #category : #activation }
SmaCCRewriteServerCommandLineHandler >> activate [
	[ self startServer ] fork
]

{ #category : #activation }
SmaCCRewriteServerCommandLineHandler >> port [
	port isNil
		ifTrue: [ port := (self portArgument ifNil: [ 36rSM ]) asInteger ].
	^ port
]

{ #category : #activation }
SmaCCRewriteServerCommandLineHandler >> portArgument [
	^ self optionAt: 'port' ifAbsent: [ nil ]
]

{ #category : #activation }
SmaCCRewriteServerCommandLineHandler >> portFile [
	^ self optionAt: 'port-file' ifAbsent: [ nil ]
]

{ #category : #activation }
SmaCCRewriteServerCommandLineHandler >> startServer [
	[ | server |
	server := SmaCCServer startOn: self port.
	self writePortNumber: server port.
	[ server run ]
		ensure: [ server close ] ]
		on: Error
		do: [ :ex | self stderr nextPutAll: ex messageText ]
]

{ #category : #activation }
SmaCCRewriteServerCommandLineHandler >> writePortNumber: anInteger [
	| filename |
	filename := self portFile.
	filename isNil
		ifTrue: [ ^ self ].
	filename asFileReference writeStreamDo: [ :stream | stream print: anInteger ]
]
