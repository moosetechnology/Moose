"
Example about layouts

RTLayoutExample new installTitle: 'ConditionaLayoutInMondrian' 
		code:
		'
b := RTMondrian new.
b shape rectangle
	fillColor: Color white;
	borderColor: Color lightGray;
	withTextAbove: #name.
b nodes: Collection withAllSubclasses forEach: [ :cls |
	b nodes: cls methods.
	b edges connectToAll: #dependentMethods.
	b layout 
		ifElement: #isConnected then: RTTreeLayout new;
		else: RTGridLayout new.
 ].

b edges connectFrom: #superclass.
b layout tree.
b build.
^ b view'
	
"
Class {
	#name : #RTLayoutExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-ExampleBrowser'
}

{ #category : #sources }
RTLayoutExample >> exampleCircle [

| v es |
v := RTView new.

es := (RTEllipse new size: 12) elementsOn: (1 to: 20).
v addAll: es.

RTEdgeBuilder new
	view: v;
	elements: es;
	connectFrom: [ :value | value // 2 ].

RTCircleLayout new on: es.
^ v
]

{ #category : #sources }
RTLayoutExample >> exampleCircle02 [

| v es |
v := RTView new.

es := (RTEllipse new size: #yourself) elementsOn: (1 to: 130 by: 10).
v addAll: es.

RTEdgeBuilder new
	view: v;
	elements: es;
	connectFrom: [ :value | value // 2 ].

RTCircleLayout new on: es.
^ v
]

{ #category : #icons }
RTLayoutExample >> exampleCircle02Icon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEbElEQVR4XuWcV27DMBBEdf9D
uvfeu6lkDCsQFFkmKVbNAATykeLwicvdWVJJmvIrJCX8U8APhF/8QPiB8IsfCD8QfvED4QfC
L34g/ED4xQ+EX/xA+IHwix8IPxB+8QPhB8IvfiAaej6fYrvdivV6nWIcDgfBD8SDfidftFot
0W6307LR7XZFTHCCAoInfD6fY3JfEzwYDMRqtRK32+3fhF4ul7/vkxnD4VBA/EAktNlsvk5s
v9//A3M+n1NZEIUhENr4gVRoNBoJlUnFKtKE8RqdTocfiCkYpgbCIv4+QhhWJ5IAhMYsISgL
kY0HIhOmbA5s9t++B5BogPiEoTKQwf3uWaLRQHa7nYgFSDZcpc5egMxms+iAYJxOJxEtENQJ
ZRM/nU6V6gdDYcfY77Jdy1gBMh6Po1wBKhlaNEBQwDUVRjaiASJbV5gMIT4GkpLggby9pZRh
2KxPjAGZTCaNBpJf1QjL9/tdBA2EZXUUR6/Xe/VhaIHA8lgsFiGuRmGiTokKCJKGfO8kxBWD
OqsRQKqeeoSF4/H47x9FHEfjKTQoqMO8A6ljpaMzmP0eNJD2+/0rLsuaeqie0coFVHwOTAgy
IaSnvpIN3X3FGBA8wbofvuzpN6Xr9eptBT0eD+EUCELGO9QYWR225MvKwep0BuRtEtbOTFwd
PEDrNgabJfHVesXKcHkKBHuTDyjojFoFUre5hCrX5zkp1318VXc4cZHe+jw0UCYUcK5cadVT
LkpAMLGhmXF19T6YF8w+ogQEub7OB0LxFioQhM+YgWjvG6ECQa1gE4bqw5i4eJpQq6QByyYQ
PMTBbeqwQkIGYnODh1NgFYhGQRj8iXM8MLYseSeFoYpV4vLUX82wZRyKTmRIdD0smX/Apmlo
ozYxCUPXo6tlLi6XS/GpH6DjdPqWqU4kzgPr2kJJHbu96A3hIAAgpRHLgGkq6jgTWkC+NX3Q
4YsZiu4mb8IwtWYuhlydy7rDsofCESlMpfZW6xAcnksbILRjsb/kLvm8WsU2blspAUEKqwIk
9v3Eh6x6WS7as+xARFNc3kzYhPHghGLvJBoFoTVjzYey0zKhXJdW3tRV+tKhX9LPZ46hFLLK
QGQ3dts3jfj3EAXfp+75Vn4gmpth0ftBBd+U2iM6IFVFVP51Sfha9WwSPxBDqjrzlL9KwC8H
QGTua/CvFIdAZBpWCF/8U+4OiPc73p+K2ZjewdhoIChMYwuZTkOW6xMoRTM0hsZZYtJ+0Lnm
hX4C/CQbVxOK3lsM7QBvae/bghGmLktWuQqwceBUUxaG75WSn2hRfDdI1Xnab/UKNme0VvG0
q54KpAQio29XAD65xGU/5+KlYo0H8i0B+HSlOMbXvkYBBNmO6qv0qsIcPxDLNotKrRPy3ZNo
gECfXolRtSeU3U8J7f5itEAgVM7ZWSf0UmSypswKiSWNjQoIv/iB8APhFz8QfiD84gfCD4Rf
/ED4gfCLHwi/+IHwA+EXPxB+IPziB8IPhF/8QPiB8MuzfgBBCe/nMYeS2gAAAABJRU5ErkJg
gg=='
]

{ #category : #icons }
RTLayoutExample >> exampleCircleIcon [
	^ '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
gg=='
]

{ #category : #sources }
RTLayoutExample >> exampleCluster [

| v es |
v := RTView new.

es := (RTEllipse new size: 12) elementsOn: (1 to: 100).
v addAll: es.

RTEdgeBuilder new
	view: v;
	elements: es;
	connectFrom: [ :value | value // 3 ].

RTClusterLayout new on: es.
^ v
]

{ #category : #icons }
RTLayoutExample >> exampleClusterIcon [
	^ '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
TkSuQmCC'
]

{ #category : #sources }
RTLayoutExample >> exampleConditionaLayoutInMondrian [
| b |
b := RTMondrian new.
b shape rectangle
	fillColor: Color white;
	borderColor: Color lightGray;
	withTextAbove: #name.
b nodes: Collection withAllSubclasses forEach: [ :cls |
	b nodes: cls rtmethods.
	b edges connectToAll: #dependentMethods.
	b layout 
		ifElement: #isConnected then: RTTreeLayout new;
		else: RTGridLayout new.
 ].

b edges connectFrom: #superclass.
b layout tree.
b build.
^ b view
]

{ #category : #icons }
RTLayoutExample >> exampleConditionaLayoutInMondrianIcon [
	^ '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
YII='
]

{ #category : #sources }
RTLayoutExample >> exampleEquidistantCircle [

| v es |
v := RTView new.

es := (RTEllipse new size: #yourself) elementsOn: (1 to: 130 by: 10).
v addAll: es.

RTEdgeBuilder new
	view: v;
	elements: es;
	connectFrom: [ :value | value // 2 ].

RTEquidistantCircleLayout new on: es.
^ v
]

{ #category : #icons }
RTLayoutExample >> exampleEquidistantCircleIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAFXUlEQVR4XuWd6XLkIAyE/f4P
mfu+7zvMplOjLS/rsTkEiGlV8SOVzSTmM0JqCXZYrfjNkg38U8APhN/4gfAD4Td+IPxA+I0f
CD8QfuMHwg+E3/iB8Bs/EH4g7ez19dXd3t6uxuPh4cHxA6lo7scuLy/d7u7uam4cHx+79/d3
xw+koD0+Pi6C8MfZ2ZnjB1LAzs/Po2HIODo6cvxAFO3m5iYZxtiF8QMZuRpM6unpqTs5Ofnd
A/D119fX4iS9vb1lw5Dxs+k7aiBXV1eLk3lwcOAQLW36DHxfCwgGJRBENz8PHzWRFxcX/0H5
+PhQhYGBlUkFZA0jabLgzrT3Dn/s7e1xAYldGf64u7v7O2GYPG0gVtxWFSBwOxoThuRvDXfF
DyRvdagMBAMlgYREd90DQUip/Rbzr5BGmfQmt8W/hzTczP3x8vLiakVZSFzXOdM/vw+JLFa+
7Gm9AVEdmKTPz091IONs/fr62sWE5Ph7ugGi7V4gmeBzDw8P1femtRyT9Ln39/euCyAhMkmK
n89JNKdyHLjC3M+BKzMPJKVWMTP+eWBMZO5nwuVowpXQnCIPGWfrGkmnSO/agcecKGoCCPyr
9uoY2/Pzc/TnIxy3qItV07LwNpZ860Jr6uKiSkWBMp6enpwZIJDHEbH4cXpqZBT7cJhwv+tk
6jOU9zeVSuSgXE51m6IPeSvxhsYmgr1EgBqZfzYQuJKdnR0X0+mBn1laLUjOelMRmgNJid39
YhM2ZHEriKJqKq4lYWDAdVcDklNGtdITVRqIqApVgORKFxa6B0sD+f7+rgNEI7P1XVcLiw0w
zO4hMWqo5fqDdvFMIzkcWiq4rUumyJNKAUltvhta+t6SOUaoIUeyVH1sCiRHhNMyrFIrqyMZ
SK4u5bf1tDYl8VOlo35ouRlaMuRGGop07ks2tNoMa0gjNbUtrAyNFZ+cGOZ2I1o17GuxUaTm
cYYsLWt/f9/1Gl0tGeT6ub0S0EqcKxly4/hYKKmFm9YmNZ4UOaR6PSTEfQFcithm1UpFiIPm
HwgJ3TvZ9FtW7cFFWTH+mxwSDJcQQO3uopUUBSeEjxKpYMWgvKvZbtna5NnwrGaBYH9YChch
d1vJznPlllJXdagAiSzlOgsHY7Z2D0kpVlk5YJmyMsQLlCqwZQNJPS9uUTqJDe+1Ot7VgOSW
cnsz/zSYOSC5fbEpbTKts3XpQSt1cU0WkNwmAUt3jGzFpp7bCoTMvgfDi4NnRc2ktPyTBSSk
23xu9HDt3pQXKFl6HnLfnG0o4c6FuZtuKjKbh6TCgAuwvjrmDgKZBZLqtnqR4kOvjDIlnSAE
rHkwsqahoObXdUq62qHk5jeXocM/A8z4bAketmUojBNVojyMIypUCfF34fvmtSz/gTYdgsEq
ko73pYQSkGo30W16oUpI7NWAiGFJ40EQ1vp7RUy3Si0ovltqKfFUrRhigmP2GqyUFhpVyPn4
rQCSktnXmIyloKSmojC0DiFDrovVWJl+mQDheqhIWvO019A6642V6VGdnKrBbLrmFfvYXKFM
zMp15NWA5NxxJbbUe+uvppDfKZW/qauZWlxDbt5lSbk39D6T8SSGNk+PEz3UPBC+l+5QNAEk
5SicuKLQywnGvcOhFwNYam8damfCKYpw7Jl42bD5gShKLHK/In4mVuYXN5fisuiAhEIZNxDE
HjmTzT1mU6cGIu5r6iiDf5+ViHupLUYhYS8/kAnta+nfxJxD8btZlhJDfiAFdTCr/9nX1gGR
LL30Na38QCIN+4lfNoa8UbtuwQ+ExPiB8APhN34g/ED4jR8IPxB+4wfCD4Tf+IHwA+E3fiD8
xg+kF/sDDCKXPG3LMWwAAAAASUVORK5CYII='
]

{ #category : #sources }
RTLayoutExample >> exampleFlow [

| v es |
v := RTView new.

es := (RTEllipse new size: #yourself) elementsOn: (1 to: 100).
v addAll: es.

RTFlowLayout on: es.
^ v
]

{ #category : #icons }
RTLayoutExample >> exampleFlowIcon [
	^ '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'
]

{ #category : #sources }
RTLayoutExample >> exampleForce [

| v es |
v := RTView new.

es := (RTEllipse new size: 12) elementsOn: (1 to: 50).
v addAll: es.

RTEdgeBuilder new
	view: v;
	elements: es;
	connectFrom: [ :value | value // 2 ].

RTOptimizedForceBasedLayout new on: es.
^ v
]

{ #category : #icons }
RTLayoutExample >> exampleForceIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEzklEQVR4XuWbh04rMRRE8/8f
SSf03pt5nNVOZIy9DT3WyYwUJSSLgXt8q5fF56e/atLC3wT+QPzlD8QfiL/8gfgD8Zc/EH8g
/vIH4g/EX/5A/OUPxB+Iv/yB+APxlz8QfyD+8gfiD8Rf/kD85Q/EH4i//IH4A/GXPxB/IP7y
B+IPxF/+QPy1wUDOz8/D9vb25+PjY/AH8sc6PDxsjP/w8LAy/t7eXvPe1dWVv4f8tWT8u7u7
FRDgfMEI/iFrJn18fITn5+dvQPxzyB/o5eUlvL29FY19cnLSeMvT05M/kP+t9/f3xtg8StrZ
2dmI3LEWQMKXWiChC9rl5WWYur4/kIkaG5Jub2/Dzc1NkOHjfIOur68b2MvlMvgDGRiuCEPx
Lqa6Sg1YSuYKdSR/PIzXQNLnwOK9o6MjfyBjeo3T09OAUe/v71f55PX1NbDDldDPzs5+GBVw
rBGvlXqZYCpX6Xp/IBlhrNaI38JM7BEXFxdFIAhwPJe6d/Ux+lldxYN/DhkJr5RHpNxngMJr
KKtZo6u8tgOCYaaWrvKEXNgif6RA6G1q8YhqgchAU0tYxibp6ERrph7UltOhhpxRLRBAYCQS
7G+Axomb1+SdMSU0BQSeWvK6jQfCro7/+CmGwAMoXymL+/oVvIOQVfpcY/yDgwM/IMBIYznG
pcQd4BGhFI7UBKa5g+/Z2tr69h6l8+7ubgOSJM+D6+Y6V5kViJIrRsEz4vIz7axLIaoU4mj8
2O0yLBVUnFOosuINoa7eP4ckIlSow/5N6Glz0goAAkoaEgHGtYjr6E0YWM41Pa6yD8E4Q5J7
PArJdPnNY2zV1pbKxWbTtjEkj/R5CUAIS3H11OaA1Yhl7MEV30OVNbXa21ggCl25sjXNIzEU
hSFCj0LQOk0dFnP2HbGxSOJq7PAOhY7U2HE1pgFjn6ex4/u8zRpIPLnlNaFHX+duVFAoYpgI
xDEJ9/j4uFmb57TkTsMZldZcoWp2D6GRi3c/X5OESwM+VU00f2N+Dl5E76HQB0xNibUB+Iwx
f9/ppFUO6WvECGltJz4KRpxr4oZzf38/4DXaAKxfw4HVooYSd2iMH9LBUyWlO10FQq5v4T28
ZsjaFkAUKnjuuzbXTQOA0McOJ/7TP+RG6xi81P2zIeacX1UFROOSvn6h1FMIaGxMQlWanFXR
8YxXxB6p32HIprDtQ0o9RzowJNwAI85BuXykrp7raz2cWhsg7U0IYUgFhHfkoKns1ZCReZU/
kBHCcMR2drsGgn2JV7kgLY1Lp5F9E2V/IJnRSdqpdxlRc6x0MMga9CJpj9NWeKGm21CrAdIm
1qYTx7B4A0ZM8wGJtzROKUkJPdd05noUfyBf4tQuDSu5weCUhCyouWSPN9V0s0M1QChF01tH
c3MtvIPRx5B7qFiLjlwDSA0sa8wd1ecQGa90KkjlRPXV1eHjYbFH6Ry+a6TvD6Tcd/y4QboU
5rrOPPA6NZTAq/18pFogGC+N+fp/EZW1qsQ25d/Z1qpTj5u6WrtsOyDKHXPdVegPxFD+QPyB
+MsfiD8Qf/kD8QfiL38g/kD85Q/EH4i//IH4yx+IPxB/+QPxB+IvfyD+QPzlD8QfiL/8gfjL
H4g/EH/5A/EH4i9/IP5A/OUPxB+Iv+rQP4A1SZDsnBpJAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTLayoutExample >> exampleGrid01 [

| v es |
v := RTView new.

es := (RTEllipse new size: 12) elementsOn: (1 to: 100).
v addAll: es.

RTGridLayout on: es.
^ v
]

{ #category : #icons }
RTLayoutExample >> exampleGrid01Icon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAACSUlEQVR4XuXZiWrbQBRG4bz/
Q3rBeMV4xbstp//QCSEpoRuq6++A0Gy5QTr2nSv55X73eSRe/FvgC/HxhfhCfHwhvhAfX4gv
xMcX4gvx8YX4+EJ8IT6+EF+Ijy/EF+LjC/GF+PhCfHwhvhAfX4gvxMcX4gvx8YX4Qnx8IT6+
EF+Ijy/EF+LjC/GF+PhCfCFtcLvdmm6324zH4yb9nNPP+H6/T/u+2WzK3GAwaHKknbHMZU3b
MZ5ayHq9LhebI9R2xpfLZWn3+/3m/VzIWNpZ03aMp09Z3y64ORwO5WJzTv/d3P16vZb+drtt
cqR9uVzKjfrZGFn/t2L4QnwhfspiU5a/qftlr1/2fsXpdCqfvvqpzTn9jCfXpz2dTj+lm4yl
nTVtx3hqIbvdrubucrGdTuctjSwWi9IejUafbuZwOCxzWVNj5G9/JUbGaoyalj7GSOwaI/+T
SFnn87kJaeecfp07Ho9v7VRbteL6ONdmjKcXMpvNmrph5px+LUsnk0lK0bJuPp83Ob6XpffM
1VK0zRhPLWS1Wv2w3Mx4LTd7vd6ndJOxWrK2HcP/hvjfEH8PYfeQ362Q/CrLfw4xnkN8/HdZ
/rss/23vf5ay/N9DfCG+ED9l+Zu6v6n7+A+Gf/Rg6Av54tXJv/iByhfygC8XfSE+vhBfiI8v
xBfi4wvxhfj4Qnx8Ib4QH1+IL8THF+IL8fGF+EJ8fCE+vhBfiI8vxBfi4wvxhfj4QnwhPr4Q
H1+IL8THF+IL8fGF+EJ8fCG+EB9fiI8v5BF5BaOO+xyllGGcAAAAAElFTkSuQmCC'
]

{ #category : #sources }
RTLayoutExample >> exampleGrid02 [

| v es |
v := RTView new.

es := (RTEllipse new size: #yourself) elementsOn: (1 to: 100).
v addAll: es.

RTGridLayout on: es.
^ v
]

{ #category : #icons }
RTLayoutExample >> exampleGrid02Icon [
	^ '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'
]

{ #category : #sources }
RTLayoutExample >> exampleHorizontalTree [

| v es |
v := RTView new.

es := (RTEllipse new size: 12) elementsOn: (1 to: 100).
v addAll: es.

RTEdgeBuilder new
	view: v;
	elements: es;
	connectFrom: [ :value | value // 3 ].

RTHorizontalTreeLayout new on: es.
^ v
]

{ #category : #icons }
RTLayoutExample >> exampleHorizontalTreeIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAD6UlEQVR4XuWdbU8yMRBF+f9/
Eg0RIxJEVFCQ5fFu0qTPZl9att3O5txkI1HYDx3mzpx2hMXtZlff39/V2Hu8v79X0uVyqY7H
Y/3Y3TvF/VNrYTget8PhUKV4jq/r9VoH5uHhob74AYnQ7+/v4IKdz+e7FnW5XNYXPyCBksWk
yqIuO+RbVoQ+Pz+zLhbfsiL19fVVpXju29vbf9n28fFRyeb4lhWpn5+fauxzFQwtujJBgeBb
1p1SJzS2G5Pl/QWkzgT9XVmioKjDUiD4lhVRzJ+fn6MWSousxXf2FZJdfMsK1OPjY/2ult3E
trD7/b7id1kZYFCLezqdghdLGfX3mtqSZFXKEBG6Hute2+22us1Ei7kSepcUSAeUrqivVit+
QMa2vM2uKJbwXYa5vSx+QEZICzgmIE673Y5vWSmDMvYefMtKKLWyKbKEb1mJ5LqksUHlW1ZC
QBz7zn55ean4lpWw09LPe2xLr+V3WZlYJMS21ut1nQkKhH9gxbeshHIbjCEbjW7rRBalzHDX
6+sr37JyaMi2lEUuk5Ql/vkI37ISyu3a9h1AdQVLduX2xfiWlUhu97bLtoY2IPlgmClDujIh
ZEeYb1kJ5Z9XyIJi6gq/y8poWZI/oxV6VrLZbPhdVko1h+CUFQrM0ACdMoMPhhNspejd/vT0
VPHBsKBcNig7HAD68KfL/V4WxQfDzJLltAFgM3t8MPQbAL5lJVazu5JCztz5YJixdtwDhXww
nKD1jQ2Iez3fshKqb+GH4JDfZRkLGB8MM6nPctpA0QdDvmVl0NCpoWCRD4YTaqhW8MGwEK33
tcYuaE0w5FtWgQzhg6GxGsIHQ0NdFh8MZyR+l1UIAPlgWEAx/z/IB8MJ1PdRG/wTw0L1gA+G
huSfHLa1xXwwNELr/FHSGXVefDDMrOacVkgrzLesiVpf/iipAblZX/4oqRFpGj52lJRvWRnB
kD9Kakj8UVKjQekaJeWDYUHxR0lnCIV8MDQYEL5lFagpfDCcUabwwbCA+KOkBsUfJTUmPhga
3Fbhg6Fx8cHQoPhgaFB8yzJmW3zLMiQ+GBrKDD4YFhT/xJAPhvyA9ElQyAdDQ8Hgg6ER8UdJ
ZxYQvmUZsCo+GBrNDD4YTqSQUVK/0+JbViaFjpL6n4bNt6zMNYM/SmpMsp+2Yu6fGGrU1P82
Bb5lZZQbIQ0ZJVVQ9I+ifMsy1GnxwTCjmlPv/FHSwmr7jnT+KKmB+hFjXXwwzKgu22kDRT4Y
Zpb/TTtt8kdJ+WA4gfo+eEbig2EBSh/aVuGD4YQa2kzkg6HxYPDBsKBd8cHQWEHng6GxlrdP
fDCcCAZDCvpcwfAfVog6NLjaUcUAAAAASUVORK5CYII='
]

{ #category : #sources }
RTLayoutExample >> exampleRadial [

| v es |
v := RTView new.

es := (RTEllipse new size: 12) elementsOn: (1 to: 50).
v addAll: es.

RTEdgeBuilder new
	view: v;
	elements: es;
	connectFrom: [ :value | value // 2 ].

RTRadialTreeLayout new on: es.
^ v
]

{ #category : #icons }
RTLayoutExample >> exampleRadialIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAEyUlEQVR4XuWbiVIqMRBF+f+P
dEVQQMF9JciZol/FqfQs4DMZ7q2ixNnQPun0kjDabPRVkkb6JtAHoi99IPpA9KUPRB+IvvSB
6APRlz4QfSD60geiL30g+kD0pQ9EH4i+9IHoA9GXPhB9IPrSB6IvfSD6QPSlD0QfiL70gegD
0Zc+EH0g+tIHoq8jBjIej8N8Pg+8f3x8DJ+fn0EfyB/o9PQ0YPz4GAC2xzn3470+kP+k29vb
MJ1Oq1HvGXu5XP7zDM5PJhN9D9lXz8/P4fLyMnx8fATHK6rXw8NDwOivr6/J6zjvTVVXV1cV
KD5LH0iLTk5OKmMxylN6enoKeMnb21ujMe/u7gLXps5dXFxUn3F/f190fCkCCCMeYzLCm65b
r9dhC626tn4OQzfFjvf398oD7To8Uh9IB2FwDLZarRqnLwxbh0XAJ9ak7jPvwtNKjjHFAVks
FpXBbm5ukgabzWaB6Qd53lY/dn5+XmVmXuzRB7IVNcP19bUbnBnx+zy3HkOYpoaUBo8y1hPV
yxu13vE2UNv7qiIRMGRUiPcvLy9BH0iDiAHM514aChDiScp7mp5r2RTP1q9DerQ5zs7OQpyu
YsR4FDPvc4yYARyyJAvITRkSdQpxSL91ssd0RSaFFwDIArkFazN+DAlvsgyp7lnc11an6ANx
hJHj4LurLzZe5uQJAJaV8XNzBBp8t9eAWKdXH0gBqheJ+kAyq+9Upw8kknVdfzMLIsgP4ZlF
AokzLNJZAjw9qEPaGvHi1CEA6Bwgap3feOYggHx9ff1IWakpDi3kGMWpIrKrdo3JH+0VnvnX
MLIAIRsyDwEMBR8pL0bhd3pPeEtbRZ5KpfsAtG5y9DcEWysxr42L16MFYkWgtxgVT0EYqmvq
i6d1De4Ye7sotkmtq1iSkKshmSXLapsKCPyMTkYvxZ8FVkZ17AkYjlGNcXmxFhIvA3PevM8+
lxexAmM3Vfacy1H5j0pMYVOZjfW7bHEqNjzgYo8zULRiuJ6+WMp7SuwAFwfE8x4Mitf0Wenb
xYKNt87ubaqQBMI0EnuCrXW37Qrpmx63PS+1zytnpzj7ApVlNlYwtqW/3mjfNwW3v4P3eKet
p/TN8o4BSPWP29zuLUgdMs10ydIAzMsCeO79W1ljCAZjAapPc5BA3aVgw+vIurqmwgDBO3MU
g8UAsSyoa6BOVdSe+nYAbPEr92aIrECYppgivEC9S2dDPLUQgLmnq4Ft6ykes5sW3XuoT3Iv
dBXdfrcRW5/Pu2RaqRrDnndI30sWCEYnBqQ2NJARdYkJqRYLyUSuDGpwQAjwttPEM6oViTQp
vfNMS57R7R6A81ls9NYH0jCHYyTaJBjOMyoG57pUN9b2BjcFZ2JRnwRBesqy4NtkLM5b8zGV
idG78jY92PYi4HNtacu/RcYQ+xaUtyGu7TuExBjOp4xtq4Glbhsa1CYHC8oGwxvd1l4hRS71
eyBHASROW631Ug/sdpwugF0/pB2NgwISF3bEkJSx7ThA8JSSa47BA1GQPhB9IPrSB6IPRF/6
QPSB6EsfiD4QfekD0QeiL30g+tIHog9EX/pA9IHoSx+IPhB96QPRB6IvfSD60geiD0Rf+kD0
gehLH4g+EH3pA9EHoi99IPpK6BtiI0rnb2P9YgAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTLayoutExample >> exampleRectanglePack [

| v es |
v := RTView new.

es := (RTEllipse new size: #yourself) elementsOn: (1 to: 50).
v addAll: es.

RTRectanglePackLayout on: es.
^ v
]

{ #category : #icons }
RTLayoutExample >> exampleRectanglePackIcon [
	^ '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
fwG1s65SxN0mrAAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTLayoutExample >> exampleReversedHorizontalTreeLayout [

"The mondrian version is:
| b |
b := RTMondrian new.
b shape box size: 20; color: Color red trans.
b nodes: (1 to: 128).
b edges connectFrom: [ :v | v // 2 ].
b layout horizontalReversedTree.
b 
"
	| v es eb |
	v := RTView new.
	es := RTBox new size: 10; elementsOn: (1 to: 100).
	v addAll: es.

	eb := RTEdgeBuilder new.
	eb view: v.
	eb objects: (1 to: 100).
	eb connectFrom: [ :value | value // 2 ].

	RTHorizontalTreeLayout new horizontallyReverse; on: es.
	^ v
]

{ #category : #icons }
RTLayoutExample >> exampleReversedHorizontalTreeLayoutIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAFf0lEQVR4XuVd2W7cMAzM/3/k
5i15y30fdjuLZUG4kixK8nq4JGCgaB2l0JgckhpJV/O8n93f3x+fGnt/f5+ur69nPPhz6d2v
r69pdmpXe/5ymeAaME6AHJ+19z8+PuID0gMIJvDz83N6fn4+TuTd3d2EByZ/Z7Hv7+/4gLTY
29vbhEdPpA5NAKl17JeXlyk+II0eAlD0BP7llQlPz9jxAWmw29vbCc/WgCP0xQekwm5ubiY8
W4z9+/v7L/Q9Pj7GB8QaskDe8iVb0uESP3kk+V0BkXR2GcZq641aQOJ7iNFDQMCY/J+fn/88
BBNr/cI1GBK+4gMysDDEhL6+vk6WQjI1RnxABrZOnp6eqkk6NflewhZNpa7D0nQy+dqXIajU
HsnVH16IncpDMMl4BCh4RckLUpV8DpD4HmIs3DCR0rc6HA4THitXlLwgvocMJPWSAURpRq6l
yR4qdqrmYoshVRZgJW0ugRcfkMpKvXUMcI54yNq7Pd3jEIDoXhZIWnikNpRZidpDB5gGEMmw
sPyq10NyvNCyKtjTiokfspShSocHSZoM0Dy1Qy6S1PGeLiR7fmd8QDrTXsR+2Oi2fHxACoCA
zBHjUcBpTxgd99l5hKp1AlAsWVaLsWdaNOsh56yidfMyPiAFDzn3h7BW2ccn9TOZNC8ZO8BU
ykWJ77WtkBbTul/GDjC1cnELAtZeEd9DCpW6nnztIaNTX+0hjCp5N0K5Uekw+8qhC0CQDVn2
h5Rs2QNjq9zplYv4t1QjsbTeXgI25XnxAcmQOsyiXLR6SipcsWVa9MrFNYK2FHepyWfjFPeF
oZYNtXgIW7XuvnViqVsYWyW0lXpOuVgyvKN5pETQpfGYOsDUysU1lUgqZc0VeyWuwBJxfEDm
vHJxuXCV+tlc2pvLvEpVOZM8yNU+9RqFYi6NLdUtTJmWG5GDJu+1HlSKE0pewKRgoZcBIZxJ
jK/NylpImmUFkVq5KKKHlrH1V18DUEsr5qIBSSkXe+sTS4uFRY3iXmxdmmAJcTVpbXxA5jHb
EWoAr0lrWbq+FytyANDiIbVVf3xAVpSLvYBYfwZKlL3PRqFWLgKg1nXvltoiPCA1ykVpq1jG
9bB1zYWHbFmpxwdkIKmrMxdXl3ZbC0mWtRJK5aLOjnJfey4stdYTLF7l+szFVMHXmgQ8PDzE
B6Rw5mIVtyxXDHu+8viV+jzmiL9RWmCWFrx7QCyqk9GF5EWHrJYzF626rPgcYiR12JbKxfge
YqjUtXJRb0fQf79lNR6fQ2bbmYv4gmUrmocjMi6+dbLldmmmHbmUysVU20QmbovJY/I4auXi
ubq2LBkWjYeUlIvnsPjaXiOpb21MqviLFjnUWnxtb6JS3/P/EV/be7LeMxdHGdOSr9szF0ca
08ZPV2cubnkGSnxA5vbtCPFbJzunvfAQWE3T0XO4ogJEKxelibh28Myy6eid0OlaJy1nLupQ
1pK+xj84IOEhS+WidVu0ft96pi/befCuDw5IJQS5i148tE1oSb0mZJVivyULY5OdUgOSUzTW
TDgAq9kfwtR63x2Q2vpkqWisVSfK+6UtbWx3r1MC0qtolNpF3m89AyU+ICcbIaBbFnzxL5bc
EZBUiPJy+yd9yNKKxprmIt5NpbIpQBivrnBB6rBaRWOJwJdjsmVY9B5SUjRicpeeAO8ohaEl
IPE9pLM+SXEAPEKai2snNiwzqvgcskFLxdqM1Gk047oKPannek36FmmLolEDEp9DGj1kuQu3
9yglFrWLOw/ZQtGIMfX48QEZSOotxn7KAyUgWvEeHxAyUh89Nvud6vS9LGRZ4BEQeW8oi3+f
eqOhTYIHfx6paIx/W/TGIQuec7pF+visjct4K5sLQLa4RZr9UmKxP57mDHmPaisXAAAAAElF
TkSuQmCC'
]

{ #category : #sources }
RTLayoutExample >> exampleTree [

| v es |
v := RTView new.

es := (RTEllipse new size: 12) elementsOn: (1 to: 100).
v addAll: es.

RTEdgeBuilder new
	view: v;
	elements: es;
	connectFrom: [ :value | value // 3 ].

RTTreeLayout new on: es.
^ v
]

{ #category : #icons }
RTLayoutExample >> exampleTreeIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAADN0lEQVR4XuWaiY7iMBBE/f8f
ySEECIS478PZrUi98jKOEwEOMK8khIFO7PSzu9uecUXB1yfJ8V3AB8IXHwgfCF98IHwgfPGB
8IHwxQfCB8IXHwhffCB8IHzxgfCB8MUHwgfCFx8IHwhffCB88YHwgfDFB8IHwhcfCB8IX3wg
fCB88YHwxQfCB8IXHwgfCF98IHwgfH0IkMvl4vv9vl+v157vrjcDuV6vfjwe+263W+i12Wy8
XhLfdS0AOZ/Pfrvdli+17fvFYlHs9/vys1aKQTkcDn61WnmtIv2utiDy3foEEDlVTn7EkbpO
8G63249rBXS5XPrj8ehPp1PZ1jvf5dXSJH9ZUhec3W7XCKwAmr1Wl1aWrUCS9OyKNvKDTdYs
VZY6kYMfWXWaJRqgrVqtQN0vtgq/TYpGdREpe9lrcDQbwlnx6P0UAhX+FBLDHJaagW3O9vtn
18zXGJsWQq3uQzTAsGLL4RQ9vEDJETn7upf1pcnyzBbBtR0zh8Nh6SiFopx9KSRYX7mBhH09
+1yuzfhpcdMSeC5HfXNfrq1QFX4OKypLdPy+WgBSNahYifvs0cxv6cvZRapa9P6qY5HUQKr2
HHrIqoqJ0perurHKS9u8KVnpTKvuZk0Sm9lUDTBMkKmHaJKwR6PRS/qy+7TRV23I+nuOZeWj
b1r6pQbOt0nbNMohqq2blHNaTZPJxNfZTKdTrE2df1wTJ1tFUVc1KA8p3Nk1MWnDxrfZPb5C
lEvM2TpPqop/1kmqQ75NvY1rsjrC6sIAVVUY9h7rlG9Tb+MSybxM6CEcfSfN5/N/7TB2hm2d
Kb3DRg9l34ftb7Fx+iEGwyqC+wpB9uFB2qe0O53O19nE2i62EVSe6PV6/51azmYzPxgMyo0j
v52v7aqStO3eC75alUuVYLmPyPmKANEyuf/zqIFIweIrE5DYoZiFKv5/ibwBiPYVSuDK8qk2
31V8INyQxRcfCF98IHwgfPGB8IHwxQfCB8IXHwgfCF98IHzxgfCB8MUHwgfCFx8IHwhffCB8
IHzxgfDFB8IHwhcfCB8IX3wgfCB88YHwgfDFB8IXHwgfCF98IHwgfPGB8IHwxQeC0x8XSjit
yN/MVAAAAABJRU5ErkJggg=='
]

{ #category : #sources }
RTLayoutExample >> exampleWeightedCircle [

| v es |
v := RTView new.

es := (RTEllipse new size: #yourself) elementsOn: (1 to: 130 by: 10).
v addAll: es.

RTEdgeBuilder new
	view: v;
	elements: es;
	connectFrom: [ :value | value // 2 ].

RTWeightedCircleLayout new on: es.
^ v
]

{ #category : #icons }
RTLayoutExample >> exampleWeightedCircleIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAFgklEQVR4XuWdCY/rKgyF8/9/
5Oz7vu9D75yqSHl5pICxE6fHErq6I7Wd8sVgHxumW634zZN1/FPAD4Tf+IHwA+E3fiD8QPiN
Hwg/EH7jB8IPhN/4gfAbPxB+INNb+LOHh4dwe3sbzs7O1uPm5ibc39+Hn5+fwA9kIvv4+Agn
Jydhf39/tW0cHh6Gt7e3wA/E0C4vL7MghgOeww/EwDCxtTDiODo6CvxAFO38/FwMIw4sc/xA
FOz19bUZRhx3d3eBH0ij/U2kGhAMaiDf39/rsDQxqeuf58LTl5cXVRgYCIvpgPz+/obT09Oi
ycT+AEu9z9XVlToQhMNUQN7f36sncW9vLyC/SCxXJoMGCCa1ZaK+vr4CPxBHG/DBwQE/EC3b
bN7NkwV9ih+IjneoT5h2yEsDBCKe5oTFcFjL6/oD0d/Y93h6egpIHiHTILPHv/g/fr4oIH+x
vUmugE1eG8hwcgG/VLREiI7cyj0Q7ScZgKMdHx9rvvd/JhNPv+R9rq+vg2sgKAxZAdH0kn59
pEU91pL1l7Rk/W9tb31PLEua6rEGFDMgz8/Pqh7y+fkZEtDFn3FxcRE04fYHlmuasDcVzUFm
qXkvPCzx9dDMLMJoaQ3fFIiWEFjyxG28JeTeZyhaWoTRw+XQDRCtp6/2M7EEYc/BQJa/7Wm1
yvylyaa5ltWaIEIptvrdAMoSiKTDZRL5XVpUsm7ZaQkKJJGhqwIVnnQot6UdIamoyntorhFt
ddrLE74kst24hg9lBUQ4Y5k2NCV401QPiTUQSfbeTSGTwDPQKbJyZtZAJB0tTUBQJ0c9uvQX
RDbsCcjj4+Pu7CGbkHbRbZxWSWEcEhVYDKS0gyRXAZzbSgMN13mIRuegF9PWsVo7IkVANOoR
nprTtL0E2tqk4qLGL+2p0bm1VUkzoe3m3Ag9mVaLaqvnVwNB5LCLQDT2Ro1ghd9DBgbJBtJN
bTOflgg62x6yrfXGyxKWC14Arl/smg1IyQHLJeUiJZs+9oao01mq0N0cNQ6vy1XtXuoGCKyl
ZQYa0pJhxDYkC22uScuSJFSejyTXbPxW36VrFedqsvZ+682SLdZ9oHa7AhING3QuGvF+g4JU
+xo7ejcrkL4rx0rhZgSLp2hOG9Z/tDU5/tuAKm3Ys6wdbXWWGx9Ku72NP6BxTjuRmsPieRGL
ZVgdSOHx52DZb2XsHWsYqRPCLveQmhDYY+PDmKX0LQsoqkAkNfYp+q9abUwFtgjj1YCgB2mX
rknq21iHo8UNEJ2id6ie/fBk2BenuklIBYjk6ozW/qW5E0Kr8kGn5NJNHuJRUoHXbs63BIiI
2EdgEEYtPdoFEG+C41h9XXoIx52WZXkmT9tyJWrr/Kmb4kssqT6SOzOC5NA9kLHEaYnVw9zy
a90wrgZEGmkNQ0es3321eOobqXOtQNYRYWeg9Yg2821LBZoqtFVVhLH9iicivXhZ2rYjFtr1
D3NxsfSukL7rl9bntTbUbeInPASJYGIJNhMUTYHEGH5skvFF+6Ji7VXhrQWvkrPz0RvhMfDc
KZVp8wIVvhwApJ4uybHkVBIJSAktLaR6v6a82cclEI3lbVtUlusRQxNGXPdrygOUQGrOJ6bE
yNLG73j0oSYSpAQizVtiGbjmWF18jXcpZ1Yg0pNLcT+SHBAqiejmbFmaFYj0Jp4YAUlet6lt
BK9Ht2cFIpnUuJxIgUTtLXWDnAdNbfa+rNqr9fpSSs3rEG2lPh8eY519LwoIrPS8yXBtrzmn
YnXP7k4CyWXQ2PxTiWVpXjHmHfxAMoalA1IFNvvN3x/M6le5xBC5jqclaVFApIZ9BZKK978v
RQNkl4wfCD8QfuMHwg+E3/iB8APhN34g/ED4jR8IPxB+4wfCb/xAlmL/ANDxmACJVISBAAAA
AElFTkSuQmCC'
]

{ #category : #accessing }
RTLayoutExample >> label [
	^ 'Layout'
]
