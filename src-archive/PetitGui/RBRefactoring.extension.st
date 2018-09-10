Extension { #name : #RBRefactoring }

{ #category : #'*petitgui-utilities' }
RBRefactoring >> checkCompositeParser: aClass [
	^ (RBCondition isMetaclass: aClass) not
	"&  RBCondition isSubclass: class of: self compositeParserClass"
	& (RBCondition new
		type: (Array with: #subclass with: self compositeParserClass with: aClass)
		block: [ aClass includesClass: self compositeParserClass ]
		errorString: aClass printString , ' is <1?:not >a subclass of ' , self compositeParserClass printString)
]

{ #category : #'*petitgui-utilities' }
RBRefactoring >> compositeParserClass [
	^ self classObjectFor: #PPCompositeParser
]
