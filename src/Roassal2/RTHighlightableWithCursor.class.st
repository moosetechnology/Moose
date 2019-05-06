"
Highlight to indicates that some interaction be can done. It changes the cursor aspect

E.g.,

-=-=-=
| b |
b := RTUMLClassBuilder new
   instanceVariables: #instVarNames;
   methodselector: #selector;
	methodsNames: #rtmethods;
	attributeselector: #yourself.
b attributeShape color: Color black.
b methodShape color: Color black.
b classNameShape color: Color black.
b lineShape color: Color black.
b boxShape borderColor: Color black.

b addObjects: (Collection withAllSubclasses ).
b layout tree.

b build.

b view elements @ RTHighlightableWithCursor.
^b view
-=-=-=

-=-=-=
b := RTMondrian new.
b shape circle size: 10.
b interaction showEdge 
	connectToAll: #subclasses.

b interaction showLabel 
	highlightObjects: #subclasses.
	

nodes := b nodes: (Collection withAllSubclasses).
nodes @ RTHighlightableWithCursor.
b edges moveBehind; connectFrom: #superclass.
b layout radial.
b
-=-=-=
"
Class {
	#name : #RTHighlightableWithCursor,
	#superclass : #RTAbstractHighlightable,
	#category : #'Roassal2-Interactions'
}

{ #category : #actions }
RTHighlightableWithCursor >> doHighlightElement: anElement [
	TRPlatform current showTemporaryCursor: Cursor webLink
]

{ #category : #actions }
RTHighlightableWithCursor >> doUnhighlightElement: anElement [
	TRPlatform current showTemporaryCursor: nil
]
