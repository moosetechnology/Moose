"
RTUMLExample new installTitle: 'BlackColor' 
		code:
		'

| b |
b := RTUMLClassBuilder new
   instanceVariables: #instVarNames;
   methodselector: #selector;
	methodsNames: #methods;
	attributeselector: #yourself.
b attributeShape color: Color black.
b methodShape color: Color black.
b classNameShape color: Color black.
b lineShape color: Color black.
b boxShape borderColor: Color black.

b addObjects: (TRAbstractArrowHeadShape withAllSubclasses ).
b layout tree.

b build.
^b view'
"
Class {
	#name : #RTUMLExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Builder-UML'
}

{ #category : #sources }
RTUMLExample >> exampleArrowed [
| b |
b := RTUMLClassBuilder new.
   b instanceVariables: #instVarNames.
   b methodselector: #selector.
	b methodsNames: #rtmethods.
   b attributeselector: #yourself.

b lineShape arrowedLine.

b addObjects: (TREvent withAllSubclasses ).
b layout tree.

b build.
^b view
]

{ #category : #icons }
RTUMLExample >> exampleArrowedIcon [
	^ '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'
]

{ #category : #sources }
RTUMLExample >> exampleBlackColor [


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

b addObjects: (TRAbstractArrowHeadShape withAllSubclasses ).
b layout tree.

b build.
^b view
]

{ #category : #icons }
RTUMLExample >> exampleBlackColorIcon [
	^ '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
l78AbpUHhczSvmoAAAAASUVORK5CYII='
]

{ #category : #sources }
RTUMLExample >> exampleColoredProtocols [
	| someClasses allMethodCategories b n |
	someClasses := RTShape withAllSubclasses.
	allMethodCategories := (someClasses flatCollect: #protocols) asSet asArray.

	b := RTUMLClassBuilder new.
	n := RTMultiLinearColorForIdentity new objects: allMethodCategories.

	b methodShape
		color: [ :m | n rtValue: m protocol ].

	b methodsNames: [ :cls | (cls rtmethods sortedAs: #protocol) ].
	b addObjects: someClasses.
	b treeLayout.
	b build.
	^ b view	

]

{ #category : #icons }
RTUMLExample >> exampleColoredProtocolsIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEn0lEQVR4XuXd3U/bVhgGcP+b
0W4mVUJccDGpH7dMahHtKipQgUlctaga6kUvqCY2aVrajnWwSDBWBAkhpfkgteN82I6Jk9jx
+84+XVC1LVRNnOUkzyMdJTaBOP7pnNfxSYzCPNrs7+9TeNtolFiG1Go1GuXzKywJSKtl4IOE
IETP6eqmiw3c2QmWnl/dXr0i6hdElowc5PXrb+jRo68+CfL48S7NzcV7Yqyvq/ggUYBsbc2K
HZ9KfUv37n0p7j99eosSiQU6PFy+BFle3qJr1x7QzZsbdOPGd7SwkKD793doZmaNrl9/Qnfv
/jIQiO2W2fFM9snj7rLnt9loF7julthyVbG+4Rnc9huTCzI7G6N4fI7W1mYExu3bX9Dx8Spp
2jrp+pNLkGfP0hSLzQqEWOxrAbG6mhQQDx++oTt3fu4bpNzMiPvhbd3VL29DCNsrC4C27wgc
gBqi09WtLTbQMIIl/eoWvJa+e4hPHSbyxbrgScXyx/l4mYjwj7KGfZSFX0MkAdE0jXK53MAt
m81G8ndomN1vHECiihGMqZPwOhTbtmkSWggyCW1iesikRAnGTe637e7uEv4uHDx/1z+xTwfq
IWdnZ/ggEYFEUtTxQYYAsrKywtPT07yxsYEPIgPI3t4ex+NxTiaT+CD4QxZ+8EEkBsnn8/gg
MoEsLi7ig+APWfjpCbK9vY0PIhPI1NQUPohMIEtLS4Ody8IHGUINUav25Q+02gV+DxkhyObm
ZtBDNJPfV2w+PCtxKl/hk0KFC7qFDzICkPn5+Q81pFZ3+Lxc57LZ4KrlsGk3OVcy8UHwD3vx
QZSLpivuNNsePogMR1mZ8yqHdSSrGp+Ngg8SLUir1WIlrBlhGkFP6fg+Pgh+DcFPF8QsWvgg
MoEcf5/EB5EJhHzCB8GvIfjpCVJX6/ggMoFoRxo+iEwgtm7jg+DXEPz0fqdut/BBpKshvyeL
/PIgy0Zwyj08/Z4uVDlTrHGxUuc/TlU+yup8EsyTiHeSwWOSubJ4PD7IkGpIMZgH2U+rYmdn
ilUB0z3huHNUYOuixWbQ/nyriQmscCIrfDw+yJBqiNfxOfxWne9/WOd6nX/9wj/Xdb+Fhw+C
X9QnGiTzIoMPIhPI+zcqPgj+kIUffJBxAcGfoJIMBH+CSjIQ/Akq/BqCH3yQcSrqBRMfRCYQ
7biED4I/ZOEHH2RcQMqnFXwQmUAqb6v4IPhDFn7wQcYFpJYz8EFkAkn9eIIPgj9k4acnSHgN
Z3wQiUDwP9srGQj+p9/xawh+8EHGCCT7WxYfBL+G4Ad/yMIHwQ8+yCSApH5IsTLI/6DFB4kW
pJatseI4ZXwQ/CELP/8FYuTx50OkAnn36zt8EJlAzHP8Ty7i1xD89AbBnw+RDAT/5KJkIOmf
0vgg+DUEP/gg4wJi4X8LVy6QfKLAiuWq7HgG267Ont/GBxn1kKU1U9zuXLDZLgYwJj4Ifg3B
D/6VHCQFwb+Sg2Qg+FdywK8h+PkkSC6Xo37bwcEBPkiEIJ55OlgPwU+0IK6WCN4YWhb1arZt
S9PC7Wk2m1I113Xpf6shjuNINRzJtj1RblMXxG8Z/Bd88sFNlxjeZgAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTUMLExample >> exampleExternalEdges [

| b |
b := RTUMLClassBuilder new.
b
    instanceVariables: #instVarNames;
    methodselector: #selector;
    methodsNames: #();
    attributeselector: #yourself.

b attributeShape color: Color black.
b methodShape color: Color black.
b classNameShape color: Color black.
b lineShape color: Color black.
b boxShape borderColor: Color black.

b
    addObjects: (Array with: RTView with: TRCanvas);
    treeLayout.

b shape arrowedLine
        color: Color black;
        withHorizontalAttachPoint.

b edgesDo: [ :edges|
	edges connectFrom: 'trCanvas' to: TRCanvas. ].        
^ b
]

{ #category : #icons }
RTUMLExample >> exampleExternalEdgesIcon [
	^ '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
AElFTkSuQmCC'
]

{ #category : #sources }
RTUMLExample >> exampleNoInstVar [

	| b |
	b := RTUMLClassBuilder new.
	   b instanceVariables: #instVarNames.
	   b methodselector: #selector.
		b methodsNames: [ :cls | cls rtmethods sortedAs: #selector ].
	   b attributeselector: ''.


	b addObjects: (RTShape withAllSubclasses).
	b layout tree.
	b build.
	^ b view.
]

{ #category : #icons }
RTUMLExample >> exampleNoInstVarIcon [
	^ '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
La6t/QsKQ1/eU5eplQAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTUMLExample >> exampleSimple [
| b classes classNode classNumber |
classes := OrderedCollection new.

classNode := #('Node' nil #()).
classNumber := #('Number' 'Node' #('value: Float') ).
classes add: classNode; add: classNumber.

b := RTUMLClassBuilder new.
b forSelfMadeClasses.
b addObjects: classes.
b classname: #first.
b attributeselector: #yourself.
b instanceVariables: #third.
b superclass: [ :c | classes detect: [ :cc | cc first = c second ] ifNone: [ nil ] ].

b layout tree.
b build.
^ b view

]

{ #category : #icons }
RTUMLExample >> exampleSimpleIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACQElEQVR4XuXYy2oiURRA0fz/
bzj0B8SJBB2oKMQHKGriK4iSxAeIiqK3+xYEGiQRmo5Krw1CqOikFrcOdR5C8LunHvxb4IP4
+SA+iJ8P4oP4+SA+iJ8P4oP4+SB+PogP4ueD+CB+PogP4ueD+CB+PoifD+KD+PkgPoifD+KD
+PkgPoifD+Lng/ggfj6ID+Lng/ggfj6ID+Lng/j5ID7IP69QKJzy+fzFjw9ypV5eXk7+Cbkz
kI+Pj7Prk8nEB7kVSLfbDc1mMzw9PYVyuRwajUaoVCohk8mEUqnkg9zihKzX6/D+/h46nU54
fX0No9EoOSXb7dYHuTbIcrkMw+Hwy48PcsXm8/nZUN/v9yd/qN9Rm83GB/FBfBAf5F5aLBbf
/v+7GXLptz7IX9Tv92/yWx/kwk39/Wj68jtvb28+yLVB4ht6fBGs1WrJG/rz83Pyd7yWzWaT
d5BqtRra7XZYrVY+yDVAxuNxcuPT6XRotVphNpslpyOuTQaDQXh8fEyu+yfEnyEuyOFwOPtO
fHz9uTY5Ho8+yE+CxIXidDoNqVQqWSDudrtQLBaTre/nwI+PrXgtl8slM+Z0OvkgP3lC4la3
Xq8nMyOu3OM8iYvGz+K2t9frJYM9boPjSfJB/Bnir07+l3wQH8TPB/FB/HwQH8TPB/FB/HwQ
H8TPB/HzQXwQPx/EB/HzQXwQPx/EB/HzQfx8EB/EzwfxQfx8EB/EzwfxQfx8ED8fxAfx80F8
ED8fxAfx80F8ED8fxM8HufN+Ab7cfG3xZnGjAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTUMLExample >> exampleWithNonClasses [

| objects b |
	"objects :=  {
		{ 'MyClass' . { #iv1 . #iv2 } . { #method1 . #method2 . #method3 }}  .
		{ 'MyClass2' . { #iv2 . #iv2 } . { #method1 . #method2 . #method4 }}  }."
	objects := Array
		with: (Array with: 'MyClass' with: (Array with: #iv1 with: #iv2) 
			with: (Array with: #method1 with: #method2 with: #method3 ) )
		with: (Array with: 'MyClass2' with: (Array with: #iv3 with: #iv4) 
			with: (Array with: #method4 with: #method5 with: #method6 ) ).

	b := RTUMLClassBuilder new.
	b attributeShape label if: [ :a | a = #iv1 ] color: Color red.
	b
		addObjects: objects;
		classname: #first;
		instanceVariables: #second;
		methodsNames: #third;
		methodselector: #yourself;
		attributeselector: #yourself;
		superclass: nil.
b build.
^ b view
]

{ #category : #icons }
RTUMLExample >> exampleWithNonClassesIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEFElEQVR4XuXZR0skaxTG8fl6
LvwObty4UBDduFFRMSxEUcSMATMGRBAMqBgwx4VgzmGhjoqKC/vceg5478xgO109XO6d+T9Q
tF3dbwv1qzpvvae+mPHzf8oX/iHgg/DDB+GD8MMH4YPwwwfhg/DDB+GD8MMH4YcPwgfhhw/C
B+GHD8IH4YcPwgfhhw/CDx+ED8IPH4QPwg8fhA/CDx+ED8IPH4QfPggfhB8+CB+EHz4IH4Qf
Pggf5L/O3t5eJOx2dHQU0diHh4dIPOO13dzcRPggH+Tw8DD0mImJie9e40kkCB8kJMjd3V3c
ILe3t3yQeEGamppsdnbWtra27OzszKqrq/2z/v5+W1lZsenpabu6urKDg4MPQfLy8iwhIcGm
pqZsbm7OgnJkHR0dtru7a4uLi/4b+j+jo6M2PDzMB/kZSFdXl3V3d9vl5aUVFhZaaWmp7e/v
W29vr9XU1PiBbW5utszMzA9BSkpKLCsry0ZGRnSgbXNz08rLy62zs9P3NTY22sXFhWVkZNj4
+DgfJNaS9fLyYjMzM3HPIQMDA/w5hD+p/4kgwRwR1Cizr18tqDOhQdrb232e0Lyxvr7OB/ll
kOBAWn29WVub2dJSaJCCggKbnJz0GwP+FcIvWXwQPsi/DLK8vOx/Pz8/W19fX2iQtbU1f9Ut
bazAfJBPQDQZ9/T0BNNIva8fwoIkJSX5/LGxsWGPj498kF8F0Qo9aBTa9fW1ZWdnhwbZ3t52
DI2NtYzxQT4B0ao81k09qm9B9D7M+Pff4IN8AqLe08nJibc91Mva2dnxV23K8fGxt1GiXSH6
3vn5uZ2envp8kp6e7vvVnFTLRB0A/hUSAkT9K9X+nJwcbyxqcad9lZWVlpaW5t/Jzc2NCiKI
uro673e9j83Pz/dSqKbk09MTH4R/2/sHgby9vX33Xme4ylYsIBqrdv23Udnig4QsWbW1tb6l
pKTY2NiYpaamWllZmd8Ga32xuroaFUSlTS37xMTEoPvSZsnJyd7fGhwc9FtpIf2Iwgf5BERn
9OvrqzcIh4aGHED79EBJk/XCwoLPCdFA7u/vfWxFRYW37zVW4/SwSnOS1jhLP/TI+CD8OeT3
ukL0GFfzhM50lSw9QVQHV+sGXTGtra1RQVpaWvy7DQ0Nf5csPe5VS0Yla35+ng8Sz21vUVGR
lxc9etU+vde8ogNfVVX109ve4uJifw6vsfod9cVUsrSG0UqeD8IvWb8fSHDmRoJSFWoLJm4/
mMHCL/TY9y1YxfNB+OGD8EH44YPwQfjhg/BB+OGD8EH44YPwwwfhg/DDB+GD8MMH4YPwwwfh
g/DDB+GHD8IH4YcPwgfhhw/CB+GHD8IH4YcPwg8fhA/CDx+ED8IPH4QPwg8fhA/CDx+En3/y
F6uitrt8gybeAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTUMLExample >> examplecolored [
| b |
b := RTUMLClassBuilder new.
b methodShape
	if: [ :method | method selector beginsWith: 'init' ] color: Color green;
	if: [ :method | method selector beginsWith: 'with' ] color: Color red.
			
b attributeShape label
	if: [ :attribute | attribute beginsWith: 'a' ] color: Color blue.
b addObjects: RTShape withAllSubclasses.
b treeLayout.

b view setDefaultMenu.
b build.
^ b view
]

{ #category : #icons }
RTUMLExample >> examplecoloredIcon [
	^ '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'
]

{ #category : #accessing }
RTUMLExample >> label [
	^ 'UML builder'
]
