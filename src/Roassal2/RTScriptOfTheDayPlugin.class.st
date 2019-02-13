Class {
	#name : #RTScriptOfTheDayPlugin,
	#superclass : #RTAbstractPlugin,
	#category : #'Roassal2-Plugins'
}

{ #category : #hooks }
RTScriptOfTheDayPlugin >> description [
	^ '(ADMIN ONLY) Generate a script of the day'
]

{ #category : #testing }
RTScriptOfTheDayPlugin >> doesItLoadCode [
	^ true
]

{ #category : #hooks }
RTScriptOfTheDayPlugin >> execute [

	(Smalltalk includesKey: #DSWebhookClient) ifFalse: [ 
		Metacello new
		    baseline: #DiscordSt;
		    repository: 'github://JurajKubelka/DiscordSt/src';
		    load: #webhook ]. 
	
	Gofer new 
		smalltalkhubUser: 'ObjectProfile' project: 'Roassal2';
		package: 'Roassal2ScriptOfTheDay'; load.
	
	
]

{ #category : #testing }
RTScriptOfTheDayPlugin >> isLoaded [
	^ RPackageOrganizer default includesPackageNamed: 'Roassal2ScriptOfTheDay'
]

{ #category : #hooks }
RTScriptOfTheDayPlugin >> label [
	^ 'Script of the day generator'
]
