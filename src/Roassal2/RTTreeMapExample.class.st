"
RTTreeMapExample new installTitle: 'FileSystem' 
		code:
		'
| b color |
b := RTTreeMapBuilder new.
color := RTScale linear 
	domain: { 0. 12000.};
	range: { Color gray. Color red }.
b shape
	color: Color transparent;
	borderColor: Color black;
	if: [ :f | f isFile ] color: [ :f | color scale: f size sqrt ].
b 
	leafWeight: [:f | f size sqrt ]; 
	explore: FileSystem disk workingDirectory
	nesting: #directories
	leaves: #files.
b build.
^ b view'
	
"
Class {
	#name : #RTTreeMapExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Builder-TreeMap'
}

{ #category : #sources }
RTTreeMapExample >> example08 [

	| b |
	b := RTTreeMapBuilder new.
	b shape fillColor: Color random.
	
	b from: (1 to: 5) using: [#()].
	b weight: #yourself.
	^ b 
]

{ #category : #icons }
RTTreeMapExample >> example08Icon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAABP0lEQVR4XuXToQ2AMBRFUeZg
BwxLdN5KBsCgqhCdgCn4TToCAkqOuP4lJ2+q1xzVr5e3dH+9wQfxQXwQH8QH8UF8EB/EB/FB
fBAfxAfxQXwIH8QH8UF+A3KcS4yc/xD/IT6ID+KD+CA+iA/ig/ggPogP4oP4ID6ID+KD+CA+
iA/ig/ggPogP4oP4ID6ID+KD+CA+iA/ig/ggPogP4oP4ID6ID+KD+CA+iA/ig/ggPogP4oP4
ID6ID/IcZC9rjJz/EP8hPogP4oP4ID6ID+KD+CA+iA/ig/ggPogP4oP4ID6ID+KD+CA+iA/i
g/ggPogP4oP4ID6ID+KD+CA+iA/ig/ggPogP4oP4ID6ID+KD+CA+iA/ig/ggPogP4oP4ID6I
D+KD+CA+iA/iQ/ggPogP4oP4ID6ID+KD+CA+iA/ybg2rSMm5jrJ+mgAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTTreeMapExample >> exampleCollectionSubclasses [

| b  |
b := RTTreeMapBuilder new.
	
b shape
	color: Color transparent;
	borderColor: Color black;
	if: [ :obj | obj isClass ] color: [ :cls | 
		(Smalltalk includesKey: (cls name, 'Test') asSymbol) ifTrue: [ Color green ]
		ifFalse: [ Color gray ] ].
b
	leafWeight: #numberOfLinesOfCode;
	explore: Collection
	using: #subclasses.
^ b
]

{ #category : #icons }
RTTreeMapExample >> exampleCollectionSubclassesIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAHpklEQVR4XuWda0wURxzAZ++I
hgT5YFMlEhBJEMmhB2KDCmmGe9ggylsQ7zgBlbdAoIQYpBBFa1VASxqtj6KN6cv6bKO12g/V
fjBV65e2pml89EObNDFN+vzQpJnu7B7Hcbd3NzfHsXv3z+SX5eb2OT9mZnfncWj9+vWkoaEB
PhoB1dfXE+QMXV1dxOFwwMeJvdZOah21XviKZ8FmtynGt7S2EMmFp5DG1kaChzEbfZjZPL1A
5v1qgLr2OoIeiqlyx4PrItdELih8x8JJRJRC8kSyspANlRtIwqcJBPdjL1a2rpz2GX2DyNDQ
EBPd3d0EfSge5aZG2eNciomdciaFmHeaZSGe4bxTyHnlhA0YeIQYLxkVE3X79u3TPgctZJTz
ImYjvO1c/oMIPoLhC4EvBL4Q+ELgC4EvBL4Q+ELCICTjgwzS2dnpk5qaGmkJX4jKOWSSpqYm
8DkkuTeZGC8aJdAVMe4xIgnHE1xx7qSdS5taF76Q8AgprymfKrr3yd+ZzCbFa9+xY8fUuvCF
wBcCTggLaEjc7jlnHZJ4OpEUlhb6JA/nSUv4QoIU8hWHkKKKIoJ+RmzcgC8kKCG/c+YQ5ouA
fNv7MeN+n8tpRJsfuOsQ+ELgC9GsEP1+/TR0zTr4QtQU4nkd5mYzVx0S0m0vfCGBhWRmZRLr
OmvQwBcS6TmkuLyY5N3MYyLrWBZ8IeEWUlpayrzzySd2+ELgC4EvBL4Q+ELgC4EvBL4Q+ELg
C4EvBL4Q+ELgC4laIZZ1lmmkvZQGX4iq7SGD0xFGBPn1+5D3d0zAFzLDDVRhCknvJKkg5JmG
B+x8MvW38J0QuUJiR2LDQnFxMdegSamc/o1zuNkkTxAxt0eokLkjc0ljYyMXOTtzCLqPvPka
SUJ4Ks1du3ZJRWPcgziSeCZRIv7NeIL+UE4IpX3gMRy5QmKPxnIlnHThB7BcQbqHs3I/WSpk
06ZNQTM4OCgJWf3ZatdxCqwF8IWEKkQ4KfBfHnwh8IXAFxJAiPBIIPpLegndDR18IWoL8RcM
5w2K50PrH3qzob6Q/UgCuhD6rLR582YNCBETAD2IHiHCYYHgM9gnRf1FGhdyS4ya0JYQdEDk
KR/6Q3q/x21ra4MvhCuHHEHB8180CPlcjHpLW0LSG9L9Fjv+AJ1DYkZjuKdASjmY4vdJnVc0
Ouz/XZVhRLlSb21tJYJdiGwh6EQIp3EXEVPv9IGSFocldCGcd1nNzc1E+EgLQuikXOPwhfT0
9JD5TfOnhLSJaw/PDotqF8HNITGXY8i80Xk+mTM+B36RNZtC0PcBvn+I4AuBLwS+EPhC4AuZ
DSFjzh4bPPT5iBfv+jIMGcRsNnMhPbH7O+5ggO8nNCSETpRCb/9YkNrFr+aEhZLSEtLS0sLF
TBzf1mXThpCNGzfCx4mpzETMVeZZodxW7i2ElunM85z44tQM7EMNXnAuh93ifkRSSUD/UemS
ppV7CbHWspbrWIuPLpa294zHu7GHkCehZz3hokBQJIYXnctxZwL9IPKn3MQ7MDAgLdvb20lR
kdyW0tfXR3CR+E7uAvZbz9KeMO6f7Q47SX031TUhjetFqygD7wmDkLjxOII7cMThJWRvlAhJ
OJZAlg0uI7rLOj626fi35aTgaEF0C0l/L52gq0h5Jh1/4bGzd/ljpNyj8b7c1IweKWz7BuMZ
/uK9Hb6m1RzS7TyREFhYs3BmhPgK70MSoqUcEiFCUsdSidVq9Ykxyzjtc3ZOtkpCGsRPBz3Y
qhDnzkQE5pCLyjlkchtP1MshVzi2Zs0h95w9U4LlsrykT/N0Zu78/Hyy5uU18IWEpchiCffk
7kV0yAJNBDp/lekVE3wh8IXAFwJfCHwh8IXAFxLVQp4qCyksLJTe/tI+XPCFzKYQ4juH2Gw2
Vw5ZcWoFsdvtzJgsJvhCZlpIb29vwCLLF6rlkPjWeLLg+AImzFvM8kmdxtoQ8kye0SGqhFTb
q5lPsqqqataExAzHsOWQL30LoU/68IW4C6F9kc9xwCrkmbOnvIIQOmRhctYIKgT9FPxMES4h
v7rFiy2U8HOImxDafYj3J7kDUVJSIvUz8wedrN+7kwNwIbr9urCQlpZGTCaTX1atWgVfiLuQ
pK1JJPd6rqoUdxXDF+KqQ/ap3/MF74Vfh7iE0GLFYrEwsXTpUuZ1M5dnEovVwkR5RbmGhZz1
QUtoQnR7dIpCDAYDqaioYKKsrIx53erqauaneDrgNGxCDIcMUgKzYHhdXjflixRZyP0ALX93
OVsMb8vL/BP50vFSB1LJkgNLXJU6b2/7mcKrUs/tyeUeUTtJ7pZcUrWtipgdZi5MFSbubXmp
76jXphDazhzqTnEz5vvvVZmoFVLQURCRfXvhC9Fa2I3kyTNVBL/mcdtbWVkpWQqFbEd2ZArZ
J8+TEsy8KvQGRLoJ4ZmTxZNbSs8hY5wv7dwQdguRK+Tv4LahzzTYJCbiXyHmjtu+hEAeHxKK
kH9DPHY4hdDnELUrR66Ru9EshA4GjSQZ/f398IXAFwJfCJuQICbw19fpiTHbGPoPAYx6CvkW
yb8OMENC6D55JtJXi46ODlnIHRW55iYE92OZV/HU35xYt1ml5shIA28N/dpDpa6zjvwPlq2y
zWoI7KMAAAAASUVORK5CYII='
]

{ #category : #sources }
RTTreeMapExample >> exampleFileSystem [
<noTest>
| b color |
b := RTTreeMapBuilder new.
color := RTScale linear 
	domain: #(0 12000);
	range: (Array with: Color gray with: Color red).
b 
	color: Color transparent;
	borderColor: Color black;
	leafColor: [ :f | color scale: f size sqrt ];
	leafWeight: [:f | f size sqrt ]; 
	explore: TRPlatform current workingDirectory
	nesting: #directories
	leaves: #files.
^ b
]

{ #category : #icons }
RTTreeMapExample >> exampleFileSystemIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAENElEQVR4XuXd3UtacRzH8ah/
oesuumjBIoICKyp7cpWsUGdPxrIlY0W1FZF6Vqmpg25alhrUpHIjGkTuoue6iOhmt9Hf0t34
/nbOYR489jCt0+bpc/HmHM+j+uJwjkqdrFAoROfn5/hlSFlnZ2d0dXVFR0dHaXVwcJD2On9r
Z2fnxum7u7vXpl1cXNDGxgYdHx+L68XXPTw8FId7e3vSsvFp8emJ85Lb398XS/U5JW5bKBaL
SdOE5+b3+8njdjOh1tZWmuGHtxWNRpkIcnJyIq70keOYb3o6pawWS8rLplq9VstmXK5rmU0m
Sp7msNtFkEgkQp/n5igQCFBse5vW19fFYTAYFIfitLU1aXx5eZm+rKxIj5MLh8O0tLQkPfZ6
vdL4981NaXwhaX/xOI6jr9GoOC48NygQQ0UFWYqK0qo6L4/82dn/LF8affN41A0yZTDQltnM
0mm8vJz9ysnJyM7wQfBB8EFSAuGvBm56I/r7+qQTTmNDg+yEZOJPUL6pKZZqzrEx2Qmss71d
ti/O4ZDmtSWd/OInxYmJCWkcHwQfBB8EHwQfBB8EH+QGEOGrAn1LC7XX1sp6VVND7XV1Yoaq
KmlcyCg8Tlr+rsxarWx9U3X1rfONwryEZeOZhWX/jL/mr7ye9GWvi7/sDA0PqybvyAg+CD4I
Pgg+CD4IPgg+CD4IPgg+CD6IykEe643TazQsyA+VbgYfBB8EHwQfBB8EHwQfBB8EHwQfBB8E
HwQfBB8EHwQfBB8EHwQfBB8EHwQfBB8EHyQNEOFv4biuLvYYGSorH2W74zYb/hFyn0aNRvxf
DPFB8EHwQfBB8EHwQfBB8EHwQfBB8EHwQfBB8EHwQfBB8EHwQfBB8EHwQfBB8EGeBMiszXav
9RYGB1lwZCTt8H/CxQfBB8EHwQfBB8EHwQfBB8EHwQfBB8EHwQfBB8EHwQfBB1ETiL2jg9as
VpZOPv7Lzp8azX/vR0kJ2y4uplOtlkXz82khN5fW1Q4y2tNDoaEhpsb6e3tZr8Ui/u/jF/X1
9KyggNxuNz4IPgg+CD4IPgg+CD4IPgg+CD4IPkiGg/iam+lYp2Nq7E4Q4TaibRUVD+qtXk/4
IAqB4B8h+CD4IPggYCAe/srBk3ADL6GX/Bvm53eoZF6XS0y4KRg+CD4IPgg+yD17b7Gwzo4O
WZqyMurjd6pk+CAPOUKamsg/OcmUDB8EH0S9IIm3S53BB8k8kOeFhdTS2Kho+CD4R4g6Qd6Z
TCTcUToxfBD8IwQf5C4QvU5HboeDKRk+CP4Rok6QqYEB5rTbZeGDZNgHQ01pKVm7u5mS4YPg
f1JXJ8gHfuNdnZ2y8EHwj5CnAXJ5eUlzHPegvE4n+bxeWW+sVvrk8Sian9+u0OLi4tMFEe6O
oMZWAwHamp9namwpHGbhUIhWIxG2wL+O2dlZdnp6yn4Dc30v7BmzzPIAAAAASUVORK5CYII='
]

{ #category : #sources }
RTTreeMapExample >> exampleNumber [

	| b |
	b := RTTreeMapBuilder new.
	b shape 
		if: #even fillColor: Color lightGray;
		if: #odd fillColor: Color purple.
	b
		extent: 400@400;
		explore: 1
		using: [ :n | n< 8 ifTrue: [ Array with: n + 1 with:  n + 2 ] ifFalse: [ #() ] ];
		weight: [ :n | n ].
	^ b
]

{ #category : #icons }
RTTreeMapExample >> exampleNumberIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAFi0lEQVR4XuXd62/bVBgG8Aox
xEWANmkSnygb+8BAExLbYBoglSGmaWhiH4aQNiEhBm3TJl2TtFopo3Rb2uZiO46d2E56+8eY
2N/RD3vx68ojiU8S24kdt8+RHlWesuPL79gnsU9OJojwS5LKBP4hwAfBL/gg+CD4BR8EHwS/
4IPgg+AXfBB8EF9l8bJC6fd1/ITMs3+evRgpSHpSp729PTIMY6xpNBpj34YgaTab9OeNejQg
hmHSwtm6vYJG4Cxdqo+kpeWnJKpvtaiYMUYSaU0ny7IiCTce0zSjBeHKtzJ1Wr2u+87jaYWe
3tmm9ftVKuUaoTP9iuWAOHX9NlxdbpamZJJXrED74zeMEQvI6vU6aZrmaRELH9WErTr3tewc
xKqsUvqMJnzNwx8qfVubqqo08+r/IP3q4jz6UR3Ygnd2dhyQjXtNqhSUga+vlCX/Z7O9bbGC
8Ir4AGXOapQ61SBl0/77jkH7+/sdmTlhdYDwcvdrOEtTivDf3YhAeFn0WqNhOJfJfvVx2kGU
ojbw9bzO6Ymmr4wFJHPmcCc2fm7igyQBhFfKK2cIfJAEgKTeNSj7heKcKfggCQDZ3d19Ge7k
GWTudKMjIpDs54onYUFEdS3fLGOCtG+srusOSPeGiUBEOxAWRFQXv9HAB8EHwQfBB+kC4R1y
4/Yhqbc7gw8SE0jZ/mTLO9Ge7FWZFi9WPWkHmTtdp9TJhifLNyTa3t7uGRFIr7o4j25rfevj
HBuQyqpOWzOm7xTyhwdxY61M8hMtdNpBNtdKQ9XlhkFK2Yb99r068sQGwitZvlmh3JWqr3Dr
5oOY+9Jujb9YtCnI+j2tZ2vnZD7sBOlXF+evO7W+9XFmTpgOCJ8pg86OMIkVhJe7N4AvTaJO
vR2En6mINl7X9L6XAP6/3SC96uLIhdrAy8rsWwY+CD4IPgg+CD7ImEDWb7U64nS8r5sd4ad8
+CAxgEiSRDW15iv4IDGAdN86GfQpGx8EHwQfBB8EHwQfBB8EHwQfxA/IoFvb3bfO3YPY82bf
qQE3Al+zPCB9bx4OqI9z+BzmiIM8/LZGWlUPnMe/1ujBp+rQYZDivEHZi+pI8sfdkvO0M4oo
ihItSKvVorXvrbGmMF8LdHaOOzwENTKQ/FcKfkLkwQU1GhAeEJeUljeof0hKFs6rzrGLDKS4
YNh/9XDX7EvVofsQHnzHnXDuapUssxmqPxMlij7EHW4bOQg/gy6mjZ6PT4W5b5FStjvl82bo
/iP/iUnZy8pLkI27LVq5pg/dL/Fd6ajeZcUGwsvyU2/y1yRhy561d5pBCj+1Qu9gwQboBlFK
taEPXOqkcTxARBvBz0SEH8LwQfBB8EHwQfBB8EHwQZILInp7mzknHjGIDxIxiFSWSZVrvlOV
VAdk8eM6rXynhUr2gu4BeTIn09bv1lA5FiBBnodw+GtvDOIMDfI5gtxz2XvT+8GQ52AJW58b
fBB8EHwQfBB8EHwQfBB8EHwQfBB8kKMBwkN7goZB0pOaM4QnTNIfaF6Qz6pDz1I3+8YRfkBV
WuTbINZY44LUK82RzCrHiWK+xVhAeCW6Xne+sx04ihrqzGqPO2EBTzKT9JlInZlc4wDhiQP+
vm06IwiDhO8ED3sZ4BkjHBB7Z9dvNUd2eeFveg3bF3kmD5jU4wMJ2qm7t+bxQfBB8EHwQfBB
8EHwQfBB8EHwQfBB8EHwQY4JSP4byfkiSpDgg0QIwstBNxAfBB8EHwQfBB8EHwQfBB8EHwQf
BB8EHwQfBB8EHyQykBCjMPBBIgBJwm/RuiD8OyFJTvaKHC0IzzNS4pGLCchR+ZXozLkoz5CE
t8ikZv69CObLev7v8xf4CZ+Dg4PRguCXeAo+CD4IfsEHwQfBL/gg+CD4BR8EHwS/xF3+A8ir
+VLeOJwSAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTTreeMapExample >> exampleSimple [
	| b labels |
	b := RTTreeMapBuilder new.
	labels := #('uno' 'dos' 'tres' 'cuatro' 'cinco' 'cent mille').
	b shape fillColor: Color veryLightGray.
	b from: labels using: [ #() ].
	b weight: [ :n | n size ].
	b build.
	b view elements
		@
			(RTLabeled new
				color: Color black;
				setAsShouldBeInTheFront;
				center).
	^ b view
]

{ #category : #icons }
RTTreeMapExample >> exampleSimpleIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACoklEQVR4XuXdyWoCQRCA4bya
D+ADeFMPnrwr4i6CuC8oihviqAiiIoiC26NVqAZzkhxMYo/5D2VPe7Cb+ehpmKkpPxzHke12
ay3m87nV8R/FeDy2NvaHftxuN2ux2+2sjv8olsultbH5IHwQPggfhA/CB+GD8EH4IHwQPggf
hA/CB+GD8EH4IHwQBMh6vZZWqyWdTkf2+z0fxCbI9XqVXC4n5XJZ/H6/5PN5PohNkOPx+HV8
Op34lyz+HsIH4YPwQfggfBA+CB+ED8IH4YPwQfgg9kHa7bY1kF6vxwYJBoOm1Vs3ejIymYyE
w2GJRCISCAQkm82+DETnkkgkJJVKSa1WM/1n5/C2IOfzWZLJpIRCIVmtVuZkdLtdGQ6Hcrlc
JJ1OvwykUqlIsViUyWQis9nM9PU3npkDfw/h7yF8kG9BHMvZ7/pMhQ/CXyF8ED4IH4QPwgfh
g/BB+CB8ED4IH4QPwgfhg/BB+CB8ED4IH8QWSCwWM22hUDBP7DabDR/EFsj9JN6z3huNhnl0
yQdxQfb74XDgZ7/z9xA+CB+ED8IH4YPwQfggrgPRJDdFcVMsFgtrY/NXiMuCD8IH4YPwQfgg
fBA+CB+ED3LjZ7/zVwh/hfBB+CB8ED4IH4QPwgfhg/BB+CB8ED4IH4QPwgfhg/BB+CB8ED4I
H+QNQB7d/vf5fKYgGR/kRWN5vV6Jx+PmuNlsmlYB9PUKDY/HY/para7f7/NB/jK0/F61WjXV
37SvlekUZTQaSb1eN++5lEolk704nU7Nd3wQ/h7CB/kXIPc/ddHqm88ubT7IL4Fo5U1to9Go
DAYD854hH4R/yeKD8EH4IHwQPggfhB98ED4IH4QPwgfhg/BB+CB8ED4IH4QPwgfhBx+ED8IH
4YPwQfggP4lPMH/VCMYIisUAAAAASUVORK5CYII='
]

{ #category : #sources }
RTTreeMapExample >> exampleWithLabelsInside [
| b label shape |
b := RTTreeMapBuilder new.
b
    extent: 800@800;
    leafWeight: #linesOfCode;
    explore: SequenceableCollection
        using: [:cls | | subclasses  |
            subclasses := cls subclasses sorted: [ :x :y| 
                x linesOfCode < y linesOfCode ].
            subclasses .
            ];
    depthShadedBorder.

shape := RTLabel new.


b build.
b elements 
    select: [ :el | (el attributes at: #elements) isEmpty ]
    thenDo: [ :el | 
        label := shape elementOn: el model.
        label trachelShape scaleBy: el extent x /label extent x.
        
        (RTConstraint movable: label fix: el)
                inner; stick.
            b view add: label ].
^ b view
]

{ #category : #icons }
RTTreeMapExample >> exampleWithLabelsInsideIcon [
	^ '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
AElFTkSuQmCC'
]

{ #category : #accessing }
RTTreeMapExample >> label [
	^ 'Tree map'
]
