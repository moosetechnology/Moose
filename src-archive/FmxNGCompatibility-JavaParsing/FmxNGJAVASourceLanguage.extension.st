Extension { #name : #FamixJAVASourceLanguage }

{ #category : #'*FamixCompatibility-JavaParsing' }
FamixJAVASourceLanguage >> format: aSourceString from: anEntity [
	^ PP2TextHighlighter new
		parser: self parser;
		color: 'keyword' with: Color red muchDarker;
		color: 'comment' with: Color gray;
"		bold: 'keyword';"
		highlight: aSourceString asText
]

{ #category : #'*FamixCompatibility-JavaParsing' }
FamixJAVASourceLanguage >> parser [
	^ self privateState attributeAt: #parser ifAbsentPut: [PPJavaLexicon new]
]
