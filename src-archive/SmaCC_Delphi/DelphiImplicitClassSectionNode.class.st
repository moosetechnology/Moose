Class {
	#name : #DelphiImplicitClassSectionNode,
	#superclass : #DelphiClassSectionNode,
	#category : #'SmaCC_Delphi'
}

{ #category : #generated }
DelphiImplicitClassSectionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitImplicitClassSection: self
]
