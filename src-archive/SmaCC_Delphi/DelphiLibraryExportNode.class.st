Class {
	#name : #DelphiLibraryExportNode,
	#superclass : #DelphiProgramNode,
	#instVars : [
		'exportsToken',
		'name',
		'semicolon'
	],
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiLibraryExportNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLibraryExport: self
]

{ #category : #generated }
DelphiLibraryExportNode >> exportsToken [
	^ exportsToken
]

{ #category : #generated }
DelphiLibraryExportNode >> exportsToken: aSmaCCToken [
	exportsToken := aSmaCCToken
]

{ #category : #generated }
DelphiLibraryExportNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
DelphiLibraryExportNode >> name [
	^ name
]

{ #category : #generated }
DelphiLibraryExportNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
DelphiLibraryExportNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
DelphiLibraryExportNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
DelphiLibraryExportNode >> tokenVariables [
	^ #(#exportsToken #name)
]
