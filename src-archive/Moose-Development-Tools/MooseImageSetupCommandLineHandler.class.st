"
The command that is triggered to setup a Moose image right after the configuration is loaded in a fresh Pharo image.
"
Class {
	#name : #MooseImageSetupCommandLineHandler,
	#superclass : #CommandLineHandler,
	#category : #'Moose-Development-Tools'
}

{ #category : #accessing }
MooseImageSetupCommandLineHandler class >> commandName [
	^ 'mooseimagesetup'
]

{ #category : #accessing }
MooseImageSetupCommandLineHandler class >> description [
	^ 'Sets up the image with Moose specific settings and logo'
]

{ #category : #activation }
MooseImageSetupCommandLineHandler >> activate [
	self activateWithoutSaving.
	Smalltalk snapshot: true andQuit: true
]

{ #category : #activation }
MooseImageSetupCommandLineHandler >> activateWithoutSaving [
	GTImageSetupCommandLineHandler new activateWithoutSaving.
	self installLogo.
	self installImageDescription.
	self flushMCCache.
	IceRepository reset
]

{ #category : #'moose utilities' }
MooseImageSetupCommandLineHandler >> flushMCCache [
	MCFileBasedRepository flushAllCaches 
]

{ #category : #'moose utilities' }
MooseImageSetupCommandLineHandler >> installImageDescription [
	MooseImage current timeStamp: DateAndTime now.
	(self hasOption: 'signature') ifTrue: [ 	
		MooseImage current signature: (self optionAt: 'signature') ]
]

{ #category : #'moose utilities' }
MooseImageSetupCommandLineHandler >> installLogo [	
	| file morph |
	file := ZnClient new
			systemPolicy;
			accept: ZnMimeType imagePng;
			get: 'http://www.moosetechnology.org/pictures/moose-icon-small.png'.
	morph := ImageMorph fromStream: file readStream binary.
	
	PolymorphSystemSettings setDesktopLogoWith: morph.
	morph top: 10; left: 10
]
