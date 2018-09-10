Class {
	#name : #MPOpenSettingsCommand,
	#superclass : #MoosePanelCommand,
	#category : #'Moose-Settings'
}

{ #category : #hooks }
MPOpenSettingsCommand >> execute [
 
	SettingBrowser browse: #('moosesettings')
]

{ #category : #hooks }
MPOpenSettingsCommand >> label [
	^ 'Moose settings'
]
