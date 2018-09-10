"
I generate a simple script which downloads a Pharo-minimal image from an url: 

http://files.pharo.org/get-files/VERSION 
"
Class {
	#name : #ZeroConfMinimalImageVersionScript,
	#superclass : #ZeroConfImageVersionScript,
	#category : 'ZeroConf-Unity'
}

{ #category : #testing }
ZeroConfMinimalImageVersionScript class >> canBeGenerated: version [
	^ version >= 40
]

{ #category : #testing }
ZeroConfMinimalImageVersionScript >> canBeCombined [
	^ false
]

{ #category : #accessing }
ZeroConfMinimalImageVersionScript >> defaultBasename [
	^ super defaultBasename, '-minimal'
]

{ #category : #accessing }
ZeroConfMinimalImageVersionScript >> imageFileName [
	^ 'pharo-minimal'
]
