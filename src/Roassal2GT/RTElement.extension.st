Extension { #name : #RTElement }

{ #category : #'*Roassal2GT-Spotter' }
RTElement >> interestingToHave [

"
From Andrei Chis:

spotterPreviewIn: aComposite
	<spotterPreview: 10>
	RTBlink unhighlightElements: self view elements.
	RTBlink highlight: self.
	aComposite addBrickBack: self view setUpCanvas buildMorph

"
]

{ #category : #'*Roassal2GT-Spotter' }
RTElement >> spotterActDefault [
	"This method define the action when an element is selected in the spotter window"
	self view canvas camera translateTo: self position.
	RTBlink on: self.
]

{ #category : #'*Roassal2GT-Spotter' }
RTElement >> spotterPreviewIn: aComposite [
	<spotterPreview: 10>
	RTBlink unhighlightElements: self view elements.
	RTBlink highlight: self.
	aComposite addBrickBack: self view setUpCanvas buildMorph
]
