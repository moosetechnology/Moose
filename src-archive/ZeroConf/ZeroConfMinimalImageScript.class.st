"
I generate a downloader script in bash for a Pharo-minimal image for the given pharo release
"
Class {
	#name : #ZeroConfMinimalImageScript,
	#superclass : #ZeroConfImageScript,
	#category : 'ZeroConf'
}

{ #category : #testing }
ZeroConfMinimalImageScript class >> canBeGenerated: versionNumber [
	"We started minimal production in Pharo 4.0"
	^ versionNumber >= 40
]

{ #category : #'instance creation' }
ZeroConfMinimalImageScript class >> minimal40 [
	^ self minimal: 40
]

{ #category : #'instance creation' }
ZeroConfMinimalImageScript class >> minimal50 [
	^ self minimal: 50
]

{ #category : #'instance creation' }
ZeroConfMinimalImageScript class >> minimal60 [
	^ self minimal: 60
]

{ #category : #'instance creation' }
ZeroConfMinimalImageScript class >> minimal70 [
	^ self minimal: 70
]

{ #category : #'instance creation' }
ZeroConfMinimalImageScript class >> minimal: releaseString [
	"Create a new zeroconf script exporter for the given release.
	A typical release string looks like '30' see also `SystemVersion current majorMinor: ''` "
	^ self new 
		release: releaseString;
		yourself
]

{ #category : #accessing }
ZeroConfMinimalImageScript >> defaultBasename [
	^ super defaultBasename, '-minimal'
]

{ #category : #accessing }
ZeroConfMinimalImageScript >> imageName [
	^ 'Pharo-minimal'
]

{ #category : #accessing }
ZeroConfMinimalImageScript >> imageZip [
	^ self version, '-minimal.zip'
]
