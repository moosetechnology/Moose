Class {
	#name : #FamixCAAnalyzerTest,
	#superclass : #TestCase,
	#instVars : [
		'class'
	],
	#category : #'Famix-CommentAnalyzer-Tests'
}

{ #category : #running }
FamixCAAnalyzerTest >> commentsDetector [
	^ FamixCACommentedCodeDetector with: FamixTest1SourceLanguage new
]

{ #category : #running }
FamixCAAnalyzerTest >> setUp [
	super setUp.
	class := (FamixTest1Class named: 'class' model: (FamixTest1Model sourceLanguage: FamixTest1SourceLanguage new))
		addComment: (FamixTest1Comment new sourceAnchor: (FamixTest1IndexedFileAnchor fileName: 'toto' startPos: 1 endPos: 1));
		yourself
]

{ #category : #tests }
FamixCAAnalyzerTest >> testCommentedCode [
	self
		assert: (self commentsDetector isCommentedCodeLine: '//uint8 wrongPinMsg[]    = "  tarjeta bloque";		// message_pp[5][32]')
		description: 'It should not be a meaningful line because this is commented code'
]

{ #category : #tests }
FamixCAAnalyzerTest >> testCommentedCode2 [
	self
		assert: (self commentsDetector isCommentedCodeLine: '//DEBUG(("Buffer=%s", szDisplScrollBuff));')
		description: 'It should not be a meaningful line because this is commented code'
]

{ #category : #tests }
FamixCAAnalyzerTest >> testFalsePositiveComment [
	self
		deny: (self commentsDetector isCommentedCodeLine: '// The parameter funcId is only used in Telium because if cancelling the AID selection must send the message to)')
		description: 'It is not commented code'
]

{ #category : #tests }
FamixCAAnalyzerTest >> testLinesUsefulInComment [
	class comments first
		content:
			'// Cancels the AID selection or PIN entry
	// The parameter funcId is only used in Telium because if cancelling the AID selection must send the message to'.
	self assert: class numberOfUsefulCommentLines equals: 2
]

{ #category : #tests }
FamixCAAnalyzerTest >> testLinesUsefulInComment2 [
	class comments first
		content:
			'/*************************************************************************/
/*                                company name                               */
/*-----------------------------------------------------------------------*/
/*     FILE  fil_KEYLOAD.C                                               */
/*-----------------------------------------------------------------------*/
/*     INTRODUCTION                                                      */
/*     ============                                                      */
/*     Created :                                                         */
/*     Last modified :                                                   */
/*     Module :                                                          */
/*     Purpose :                                                         */
/*          TPV-PC EMV Servired  (08/04/2005)                            */
/*                                                                       */
/*     List of routines in file :                                        */
/*                                                                       */
/*                                                                       */
/*     File history :                                                    */
/*     2006-20-06            Creation                                    */
/*                                                                       */
/*************************************************************************/

/*+++******* INCLUDES ****************************************************---*/'.
	self assert: class numberOfUsefulCommentLines equals: 3
]
