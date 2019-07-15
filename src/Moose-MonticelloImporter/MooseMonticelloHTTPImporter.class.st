"
MooseMonticelloHTTPImporter supports the handling of package via HTTP.

Instance Variables:
	httpUrl	<ProtoObject | PseudoContext>
"
Class {
	#name : #MooseMonticelloHTTPImporter,
	#superclass : #MooseMonticelloImporter,
	#instVars : [
		'httpUrl'
	],
	#category : #'Moose-MonticelloImporter'
}

{ #category : #'as yet unclassified' }
MooseMonticelloHTTPImporter class >> onURL: anHTTPURL [
	"
	(self onURL: 'http://www.squeaksource.com/PersonalSetting')  
	"
	^ self new onURL: anHTTPURL; import
]

{ #category : #accessing }
MooseMonticelloHTTPImporter >> onURL: url [
	httpUrl := url
]

{ #category : #'hook - private' }
MooseMonticelloHTTPImporter >> setRepository [
	repositoryCache := MCHttpRepository 
		location: httpUrl
		user: ''
		password: ''
]

{ #category : #'hook - private' }
MooseMonticelloHTTPImporter >> setRepositoryCache: aCache. [
	repositoryCache := aCache
]
