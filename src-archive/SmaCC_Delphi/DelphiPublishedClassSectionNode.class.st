Class {
	#name : #DelphiPublishedClassSectionNode,
	#superclass : #DelphiClassSectionNode,
	#instVars : [
		'publishedToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiPublishedClassSectionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitPublishedClassSection: self
]

{ #category : #generated }
DelphiPublishedClassSectionNode >> publishedToken [
	^ publishedToken
]

{ #category : #generated }
DelphiPublishedClassSectionNode >> publishedToken: aSmaCCToken [
	publishedToken := aSmaCCToken
]

{ #category : #generated }
DelphiPublishedClassSectionNode >> tokenVariables [
	^ #(#publishedToken)
]
