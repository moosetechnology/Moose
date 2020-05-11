Extension { #name : #FamixTest1SourceLanguage }

{ #category : #'*Famix-CommentAnalyzer-Tests' }
FamixTest1SourceLanguage >> commentMarkers [
	^ #('//')
]

{ #category : #'*Famix-CommentAnalyzer-Tests' }
FamixTest1SourceLanguage >> languageKeywords [
	^ #(auto 'break' 'case' 'char' 'const' 'continue' 'default' 'do' 'double' 'else' 'enum' 'extern' 'float' 'for' 'goto' 'if' 'int' 'long' 'register' 'return' 'short' 'signed' 'sizeof' 'static' 'struct' 'switch' 'typedef' 'union' 'unsigned' 'void' 'volatile' 'while' '#debug' '#define' '#endif' 'int16' 'int8' 'true' 'false' 'uint8' memset)
]
