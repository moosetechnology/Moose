"
Temporary script to overcome the migration form single dash ""-help"" options to double dash ""--help"" options in the pharo vm.
"
Class {
	#name : #ZeroConfVMLatestScript,
	#superclass : #ZeroConfVMScript,
	#category : 'ZeroConf'
}

{ #category : #accessing }
ZeroConfVMLatestScript >> initialize [
	super initialize.
	self release: 'latest'
]

{ #category : #accessing }
ZeroConfVMLatestScript >> optionDash [
	^ '--'
]

{ #category : #accessing }
ZeroConfVMLatestScript >> release [
	^ 'latest'
]
