﻿!function (a) { "use strict"; return a.breakpoint = function (b) { var c = { breakpointClass: "resrc--breakpoint", prefix: "data-src-" }, d = a.extend(c, b), e = a.getElementsByClassName(d.breakpointClass), f = new RegExp("^" + d.prefix + ".*"), g = function (a, b) { return a.width - b.width }, h = function () { this.src = a.getResrcImageObject(this).eiFallbackImgPath ? a.getResrcImageObject(this).eiFallbackImgPath : a.getResrcImageObject(this).fallbackImgPath }, i = function (b) { for (var c = [], e = [], i = 0; i < b.attributes.length; i++) { var j = b.attributes[i]; f.test(j.nodeName) && c.push({ width: j.nodeName.replace(d.prefix, "").replace(/\D/g, ""), unit: j.nodeName.replace(d.prefix, "").replace(/[0-9]/g, ""), src: j.value }) } c = c.sort(g); for (var k = 0; k < c.length; k++) if (window.matchMedia && window.matchMedia("(min-width: " + c[k].width + c[k].unit + ")").matches && e.push(c[k]), !window.matchMedia) { e.push(c[c.length - 1]); break } if (e.length) { var l = e.pop(); l.src !== b.getAttribute("data-src") && (b.setAttribute("data-src", l.src), b.src = a.getResrcImageObject(b).resrcImgPath, b.onerror = h, b.removeAttribute("width"), b.removeAttribute("height")) } }, j = function (a) { if (a && a.attributes) i(a); else if (e) for (var b = 0; b < e.length; b++) i(e[b]) }; return window.addEventListener ? window.addEventListener("resize", j, !1) : window.attachEvent && window.attachEvent("onresize", j), j(), a.setElementSrc = j, a }, a }(resrc);