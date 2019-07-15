"
I combine several ZeroConf scripts for Moose.
"
Class {
	#name : #MooseZeroConfCombinedScript,
	#superclass : #ZeroConfCombinedScript,
	#instVars : [
		'title'
	],
	#category : #'Moose-Development-Tools'
}

{ #category : #accessing }
MooseZeroConfCombinedScript class >> baseUrl [
	^ 'http://get.moosetechnology.org' asZnUrl
]

{ #category : #accessing }
MooseZeroConfCombinedScript >> defaultCombiningScript [
	^ self class
]

{ #category : #accessing }
MooseZeroConfCombinedScript >> htmlTitle [
	^ self scripts first htmlTitle
]
