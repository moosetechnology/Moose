"
I generate a simple script which downloads a Pharo image.
"
Class {
	#name : #ZeroConfPharoImageScript,
	#superclass : #ZeroConfImageScript,
	#category : 'ZeroConf'
}

{ #category : #'instance creation' }
ZeroConfPharoImageScript class >> pharo11 [
	^ self pharo: '11'
]

{ #category : #'instance creation' }
ZeroConfPharoImageScript class >> pharo12 [
	^ self pharo: '12'
]

{ #category : #'instance creation' }
ZeroConfPharoImageScript class >> pharo13 [
	^ self pharo: '13'
]

{ #category : #'instance creation' }
ZeroConfPharoImageScript class >> pharo14 [
	^ self pharo: '14'
]

{ #category : #'instance creation' }
ZeroConfPharoImageScript class >> pharo20 [
	^ self pharo: '20'
]

{ #category : #'instance creation' }
ZeroConfPharoImageScript class >> pharo30 [
	^ self pharo: '30'
]

{ #category : #'instance creation' }
ZeroConfPharoImageScript class >> pharo40 [
	^ self pharo: '40'
]

{ #category : #'instance creation' }
ZeroConfPharoImageScript class >> pharo50 [
	^ self pharo: '50'
]

{ #category : #'instance creation' }
ZeroConfPharoImageScript class >> pharo60 [
	^ self pharo: '60'
]

{ #category : #'instance creation' }
ZeroConfPharoImageScript class >> pharo70 [
	^ self pharo: '70'
]

{ #category : #'instance creation' }
ZeroConfPharoImageScript class >> pharo: releaseString [
	"Create a new zeroconf script exporter for the given release.
	A typical release string looks like '30' see also `SystemVersion current majorMinor: ''` "
	^ self new 
		release: releaseString;
		yourself
]
