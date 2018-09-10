Class {
	#name : #DelphiFinalizationSectionNode,
	#superclass : #DelphiCodeSectionNode,
	#instVars : [
		'finalizationToken'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiFinalizationSectionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFinalizationSection: self
]

{ #category : #generated }
DelphiFinalizationSectionNode >> finalizationToken [
	^ finalizationToken
]

{ #category : #generated }
DelphiFinalizationSectionNode >> finalizationToken: aSmaCCToken [
	finalizationToken := aSmaCCToken
]

{ #category : #generated }
DelphiFinalizationSectionNode >> tokenVariables [
	^ #(#finalizationToken)
]
