Extension { #name : #FAMIXJavaSourceLanguage }

{ #category : #'*FamixCompatibility-PPExtensions' }
FAMIXJavaSourceLanguage >> format: aSourceString from: anEntity [
	^ PP2TextHighlighter new
		parser: self parser;
		color: 'keyword' with: Color red muchDarker;
		color: 'comment' with: Color gray;
"		bold: 'keyword';"
		highlight: aSourceString asText
]

{ #category : #'*FamixCompatibility-PPExtensions' }
FAMIXJavaSourceLanguage >> parser [
	^ self privateState attributeAt: #parser ifAbsentPut: [PPJavaLexicon new]
]
