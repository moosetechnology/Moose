"
The command that can be triggered to setup a image right after the GToolkit configuration is loaded in a fresh Pharo image.

Example usage in a Jenkins:
./pharo $JOB_NAME.image gtimagesetup

To use from inside the image, run:
[ [ [ 
	self new activateWithoutSaving
] ] ]
"
Class {
	#name : #GTImageSetupCommandLineHandler,
	#superclass : #CommandLineHandler,
	#category : #'GT-Setup'
}

{ #category : #accessing }
GTImageSetupCommandLineHandler class >> commandName [
	^ 'gtimagesetup'
]

{ #category : #accessing }
GTImageSetupCommandLineHandler class >> description [
	^ 'Sets up the image with GToolkit specific tools and settings'
]

{ #category : #activation }
GTImageSetupCommandLineHandler >> activate [
	"self new activate"
	self activateWithoutSaving.
	Smalltalk snapshot: true andQuit: true
]

{ #category : #activation }
GTImageSetupCommandLineHandler >> activateWithoutSaving [
	self cleanupWorld.
"	self installGLMWhitespaceTheme."
	self installFonts.
	self installGTDebuggers.
	self flushMCCache.
	self setPreferredSettings
]

{ #category : #utilities }
GTImageSetupCommandLineHandler >> cleanupWorld [
	(World submorphs select: [ :each | each isSystemWindow ]) do: #delete.
]

{ #category : #utilities }
GTImageSetupCommandLineHandler >> flushMCCache [
	MCFileBasedRepository flushAllCaches 
]

{ #category : #utilities }
GTImageSetupCommandLineHandler >> installDemoFonts [
	StandardFonts 
		setAllStandardFontsTo: (LogicalFont familyName: 'Source Sans Pro' pointSize: 12);
		haloFont: (LogicalFont familyName: 'Source Sans Pro' pointSize: 12);
		windowTitleFont: (LogicalFont familyName: 'Source Sans Pro' pointSize: 18);
		balloonFont: (LogicalFont familyName: 'Source Sans Pro' pointSize: 12);
		codeFont: (LogicalFont familyName: 'Source Code Pro' pointSize: 14)
]

{ #category : #utilities }
GTImageSetupCommandLineHandler >> installFonts [
	StandardFonts 
		setAllStandardFontsTo: (LogicalFont familyName: 'Source Sans Pro' pointSize: 10);
		haloFont: (LogicalFont familyName: 'Source Sans Pro' pointSize: 10);
		windowTitleFont: (LogicalFont familyName: 'Source Sans Pro' pointSize: 14);
		balloonFont: (LogicalFont familyName: 'Source Sans Pro' pointSize: 10);
		codeFont: (LogicalFont familyName: 'Source Code Pro' pointSize: 10)
]

{ #category : #utilities }
GTImageSetupCommandLineHandler >> installGLMWhitespaceTheme [
	GLMWhitespaceTheme 
		defaultSettings: nil;
		beCurrent
]

{ #category : #utilities }
GTImageSetupCommandLineHandler >> installGTDebuggers [
	GTGenericStackDebugger registerToolsOn: Smalltalk tools.
	GTGenericStackDebugger registerExtraToolsOn: Smalltalk tools.
	GTGlamourDebugger registerToolsOn: Smalltalk tools.
	#GTPPDebugger asClassIfPresent: [ :ppDebugger | ppDebugger registerToolsOn: Smalltalk tools ].
	#ACGlamourDebugger asClassIfPresent: [ :acdDebugger | acdDebugger register ].
	#GTBytecodeDebugger asClassIfPresent: [ :bytecodeDebugger | bytecodeDebugger registerToolsOn: Smalltalk tools ].
	GTSUnitDebugger registerToolsOn: Smalltalk tools.
	GTMoldableDebugger enableDebuggerWindowDistinctColor: true
]

{ #category : #utilities }
GTImageSetupCommandLineHandler >> setPreferredSettings [
	NECPreferences 
		popupShowAutomatic: false;
		expandPrefixes: true;
		popupShowWithShortcut: Character tab asShortcut.
	GTGenericStackDebugger enableStackColoring: true.
	KMRepository reset.
	"ThemeIcons current: GLMThemeIcons new"
]
