Class {
	#name : #RTUsefulScript,
	#superclass : #RTAbstractMenuEntry,
	#category : #'Roassal2-Plugins'
}

{ #category : #'as yet unclassified' }
RTUsefulScript class >> menuCommandOn: aBuilder [
	<worldMenu>
	((aBuilder
		item: self menuConfigurationSymbol;
		order: 10;
		parent: #Roassal) icon: RTIcon smallRoassal)
		with: [ self allSubclasses
						do: [ :cls | 
							(aBuilder item:
							self menuConfigurationEntryTitle , cls new label)
								order: 10;
								parent: self menuConfigurationSymbol;
								label: cls new label;
								help: cls new label;
								icon: RTIcon smallRoassal;
								action: [ cls new run ] ] ]
]

{ #category : #'as yet unclassified' }
RTUsefulScript class >> menuConfigurationEntryTitle [
	^ #'Script: '
]

{ #category : #'as yet unclassified' }
RTUsefulScript class >> menuConfigurationSymbol [
	^ #RoassalScript
]

{ #category : #public }
RTUsefulScript >> configurationMessage [
	^ 'Do you want to execute the script?'
]

{ #category : #accessing }
RTUsefulScript >> description [
	"description of the of the plugin"
	^ 'Need to be described'
]
