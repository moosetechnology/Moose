"
RTDynamicStackerGrapherExample new installTitle: 'Basic' 
		code:
		'
| b |
b := RTDynamicStackedGrapher new.
b numberOfBars: 10.
b minY: -200; maxY: 200.

b y: #yourself.
 
b barShape color: (Color red alpha: 0.3).
b view addMenu: ''+ 1'' callback: [ b add: 400 atRandom - 200 ].
^ b view'
	
"
Class {
	#name : #RTDynamicStackerGrapherExample,
	#superclass : #RTAbstractExample,
	#category : #'Roassal2-Builder-Grapher-Examples'
}

{ #category : #sources }
RTDynamicStackerGrapherExample >> exampleBasic [

| b |
b := RTDynamicStackedGrapher new.
b numberOfBars: 10.
b minY: -200; maxY: 200.

b y: #yourself.
 
b barShape color: (Color red alpha: 0.3).
b build.
b view addMenu: '+ 1' callback: [ b add: 400 atRandom - 200 ].
^ b view
]

{ #category : #icons }
RTDynamicStackerGrapherExample >> exampleBasicIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABeCAYAAADVA7GfAAACn0lEQVR4XuXcS8t5URTH8ecl
ehWmXgIGMmJg5h0YKhkwcB+4RYRCiKIMRC4RWZ7WKvJ/Jv+Jy6nvr05n785sf9p25+xt/dxu
/DgpP/wh4IPw8z+Q2Wwmp9NJer2e8IfEASCZTMYgqtUqH8QJILvdTs7nswyHQz4Ifw3hhw/C
B+GHD8IH4YcPwgfhhw/CB+GHD8IPH4QPwg8fhA/CDx+ED8IPH4QPwg8fhJ8XgCwWC7lcLnbN
53Pbj9f2crnk781/GqTb7UowGJRisSi5XE46nY5sNhvrr9frB8h4PJbr9coHejdINpu9uVwu
0SNEChIKheyu/XQ6/Q/AZDLhgzhpDeGD8EH4IHwQPggfhA/CB+GD8EH4IPy8AuR4PEosFpNE
IiHJZFLC4bDs93vr5/N5/ovhp0H0/yT6Zq5v5alUSsrlstRqNeuvVit5xuCDfOEnS2eMIt3b
/BnCX0P4IHwQPggfhA/CB+GD8EH4IPy8C6TVakmz2bQB1xdEPsiXQbT6g17T6VS0IsTf53rI
oVKp2HPSpQc+vgJSr9ftk8lgMLDPJ/wZwl9D+CB8ED4IH4QPwgfhhw/CB+HnnSB6Al7vkUhE
DoeDlEol6xcKBXneNeSDfACk3W4/Blm3bt1ut3i9Xuvr/d7m76l/cIZoaVm99JRJv98XRdJZ
02g0ZDQa8WcIfw3hg/BB+CB8ED4IH4QPwgfhg/DzcpDtdmv/Qb8XDbgXDPhbOIAP8sEZEo1G
rVCAx+MRv99vA+/z+R5t3VN/LiTAzxtBdODj8bh+MrGCAYFAwPbVFUO/Z/GH16FrCD98ED4I
P3wQPgg/fBA+CD98EH74IHwQfvggfBB++CB8EH74IHwQfvgg/PBB+CD88EH4IPzwQfgg/PBB
+CD8fCu/tkDt9Hdeg+0AAAAASUVORK5CYII='
]

{ #category : #sources }
RTDynamicStackerGrapherExample >> exampleComposing [

| composer a b |
composer := RTComposer new.
    a := RTDynamicStackedGrapher new.
    a minY: -200; maxY: 200.
    a view: composer view.
    a y: #yourself.
	a build.	
composer group: #first.

    b := RTDynamicStackedGrapher new.  
    b minY: -200; maxY: 200.
    b view: composer view.
    b y: #yourself.
	b build.
composer group: #second.

composer move: #first onTheLeftOf: #second.
composer nameGroup: #first as: 'aFirstName'.
composer nameGroup: #second as: 'aSecondName'.
composer setGeneralTitle: 'aGeneralTitle'.

composer view addMenu: 'Left' callback: [ a add: 400 atRandom - 200 ].
composer view addMenu: 'Right' callback: [ b add: 400 atRandom - 200 ].

^ composer view
]

{ #category : #icons }
RTDynamicStackerGrapherExample >> exampleComposingIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAENElEQVR4XuWc2yttXRiH93/m
zoXcy4VcoByK3JCclUiU5HwIF44JSZKc5Swh5CyJUCgXCnnX12+058quxd6fPutb2/PUas4x
11xzrfk+a8zZO8aY44fPxyeU+MEPAV8In4+ELC0tmVcoKyuzxcVFe7tDd3e3bW9v2/r6utve
39/vlldXV8YP3xcIGRkZsdvbW5OYqqoqq6ys/CXQNTU1VltbaxJRUlJiPT09Njk5abOzs3wh
XyGkqanJpqamfEVFRU7KysqKPT09+YN9cHBgR0dH7r3i4mLb3d11ZUnhh49/D+EL4cMXwhfC
hy+ED18IXwgfvhC+ED58IXwhfPhC+EL48IXw4QvhC/k8qamplp2dbTc3N5/qd4mPjzd1vkVF
RVl5ebkNDAy44ywvL1tjY6PxhfwBubm5lpSUZMfHx3ZxceEPWlZWlqWkpLhyfn6+xcbGuvXE
xETLyclxAdZyYmLCSTw9PTUJ+bm/z1uqIy4iIsIvJDMz0ySeL+QdqqurLSwszKdeybu7O1N/
vrqVY2JibGxszK6vr13PpYLb2dnptrW0tPgDrF5M1QZ1QwcS4n2Ht7/21XfwhbxDZGSkRUdH
uwAlJyebaowEqIYUFBS47Z4QkZCQ4C5Fb//x9fX1TkhcXFxAIeHh4a77eWNjwzIyMqy0tJQv
hA9fCF8IH74QvhA+fCF8IXz4QvhCAqEETAnU2tqaP3HSyPi+vj43tpcfOp9P46D39/c/jEVz
c/O/illAIWqSGB4etvb2dlMTRWtrq9XV1bkMuKOjw2W3c3NztrW1Zb29ve5Rhby8PKuoqMCI
Gh0dNT2SoaaboaEhS09Pd+e+t7dnGsCudQ1gl5D3YuY1Bf1WiJ4T0YG1rgOobamhocGNjFeN
0cGmp6ft/PzcvacfphHz+nEUIfrXq+VYV5G2tjZ7eXmxrq4uvwzx+PjomnI2NzcDxkyfkTT+
PYR/Uw8uquHz8/O2sLDgWou1zSvzhfwP6FJyeHjoXs/Pz3Z5eekve/uoz4QvJEiMj4+7+93q
6qrNzMzYzs6Ou/epzK8hfPhC+EL48IXwhfDhC+EL4cMX8hWoPYmfqYcQajr5XaZ+cnLCz9SD
hdePw8/U+fCF8IXw4QvhC+HDF8KHL4QvJNhomI2Wbx+PC3khZ2dn9je/3jsxPXFVWFjohtt4
Yt6iTD0Uz+fb1hBl65pFVaMtNYiPf8niwxfCF8KHL4QvhA9fCF8IH76QYOBl6H9Txv6thdzf
31taWprL2L2yJrXxMnW+kCChaZg0VZOmcvIy9p+T1pjg1xA+fCF8IXz4QvhC+PCF8IXw4Qv5
r3l4eLDX11fjZ+ohhKYC+ShT19zAfCFBQgMcBgcH+Zk6H74QvhA+fCF8IXz4QvjwhfCF8OEL
4QvhwxfCF8KHL4QvhA9fCB++EL4QPnwhfCF8+EK+Ef8AYYqQzBlo8q8AAAAASUVORK5CYII='
]

{ #category : #sources }
RTDynamicStackerGrapherExample >> exampleWithTextBelow [

| b |
b := RTDynamicStackedGrapher new.
b numberOfBars: 10.
b minY: -200; maxY: 200.

b y: #yourself.
 
b barShape color: (Color red alpha: 0.3).
b textBelow: #yourself.

b build.
b view addMenu: '+ 1' callback: [ b add: 400 atRandom - 200 ].
^ b view
]

{ #category : #icons }
RTDynamicStackerGrapherExample >> exampleWithTextBelowIcon [
	^ 'iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAD7klEQVR4XuWcSUszQRCG/bPB
P+BdxZvePHoSb3oRBXdFwagHN/zctyi4RxRckLiV37yNM5iYTGKik0meF4rYs2Qm9UxXd3W3
0/DxwVec1MB3AR8IX6UAyWQyNjo6anyXVBnI8PBwAKK9vZ0PJC41ZHV11Zqbm/ke4bchfPGB
8IHwxQfCB8IXHwgfCF98IHwgfPGB8MUHwgfCFx8IHwhffCB8IHzxgfCB8MUHwhcfCB8IX3wg
fCB8VRHIxMSEdXR0WGNjo/X19VlTU5NbaKfy6+srf9Fd1EDm5+dtcXHRDg8PLZFIaKGdg6Dy
2dmZ+/vi4sJGRkb4cKIMWXd3d+Z/Pj09mV/2pVWRcfrR3hNktr2dbY+PhmlDSgFiyaR9s+tr
s52dbPO2VQxkctJscDDbrq74QLKclOsgmQDk2cYHwgfCB8IHwgfCB8IHwgdS30AWFhaCzDws
U+cDibiG/EamzgcSs0ydD4TfhvCBxBrI8fH3YZr9feMDqRaQfNeqwosU+ED4QPhAYglkc3PT
ZElvmL0cIOvr67a7u2v9/f1FnTY1NeW12Vc2MzNj5QDRtba9OZN9r03x77eugFxeXtr5+bk9
PDwEDv0JEJ2vXGdra8ukl5cXC8uR3t/fXS7kd8dLBZIZGrLb21s7PT11lkqlbGlpKf5Aurq6
3E1OT0+b7CchSw4tp4bYp/wRAY9wwcms5+dn9xkcW0bIent7s5oJWY/e9KfCTz4gqgkDAwO2
trbmbMf7oanOzizTNn9/KZZ7vuw3ji31/H8rK6HnaHSiqkDa2tpcfJ6dnc0bY7/WkEJPvYZa
9M4uhZiNjQ27ublxT7/itkLNycmJpdPpgrXp66iBQlRYZ+H+/t7tP/ZyD4W/g4ODYKRB11Bo
0oNUsOaGhMiaa0MKAVGM1v7l5WU7OjoKGmABFgzVwrAOgP/9Or9Y7+3rfekB0OqZz5D7MTY2
5q4tKGggGjn2QLg32/kNp6q+nKTtPpxiTlZHoRgQfZ8crmtq7G1vby9ol1QjVdZ2NJAf5REh
QCo5tuT8qJ6A/IYqdTIfCB8IHwgfSJRA5uYs1/hAPtXa2uq6oz09Pdbd3e26kH75r4BEqZoC
Mj4+bi0tLe71svnMz9RrefV7zdUQOV5Jm/5XRC9k1kCfcgmV+TUE0obwgfCB8IHwgfCB8IHw
gfCB8IHwgUQMRCs66jpTz52nl/3h/HrFmXpvb2/RTN2fDeQrokxd06BhmTpfMWtD+OID4QPh
iw+ED4QvPhA+EL74QPjiA+ED4YsPhA+ELz4QPhC++ED4QPjiA+GLD4QPhC8+ED4QvvhA+ED4
4gPhA+GLD4QvPhA+EL6K6j+bb8xyXqkAQAAAAABJRU5ErkJggg=='
]

{ #category : #accessing }
RTDynamicStackerGrapherExample >> label [
	^ 'Dynamic stack grapher'
]
