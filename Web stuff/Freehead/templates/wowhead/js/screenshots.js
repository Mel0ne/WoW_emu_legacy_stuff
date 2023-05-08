var wh_ss;
load_ss = function()
{
		tabsRelated.setTabName(tabsRelated.tabs.length - 1, LANG.tab_screenshots + " (" + LANG.tooltip_loading + ")");
		g_ajaxIshRequest("?screenshot=getwh&type=" + g_pageInfo.type + "&typeid=" + g_pageInfo.typeId);ge('infobox-sticky-ss').innerHTML = '<span class="q10<br />">' + "<img src=\"images/loading_ss.gif\"></img>" +'</span>';
}
function ss_appendSticky() {
    var m = ge("infobox-sticky-ss");
    var i = g_pageInfo.type;
    var h = g_pageInfo.typeId;
    var k = in_array(lv_screenshots, 1, function(a) {
        return a.sticky
    });
    if (k != -1) {
        var c = lv_screenshots[k];
        var l = ce("a");
        l.href = "#screenshots:id=" + c.id;
        l.onclick = function(a) {
            ScreenshotViewer.show({screenshots: lv_screenshots,pos: k});
            return rf2(a)
        };
        var f = ce("img"), e = Math.min(150 / c.width, 150 / c.height);
        f.src = (c.wowhead==1 ? "http://static.wowhead.com/uploads/screenshots/thumb/" + c.id + ".jpg" : "images/screenshots/thumb/" + c.body.replace("gif","jpg").replace("png","jpg"));
        f.className = "border";
        ae(l, f);
        ae(m, l);
        var g = ce("div");
        var n = ce("small");
        l = ce("a");
        if (g_user.id > 0) {
            l.href = "javascript:;";
            l.onclick = ss_submitAScreenshot
        } else {
            l.href = "?account=signin"
        }
        ae(l, ct(LANG.infobox_submitone));
        ae(n, l);
        ae(n, ct(" " + String.fromCharCode(160)));
        var j = ce("b");
        ae(j, ct("|"));
        ae(n, j);
        ae(n, ct(String.fromCharCode(160) + " "));
        l = ce("a");
        l.href = "javascript:;";
        l.onclick = function() {
            tabsRelated.focus(-1);
            return false
        };
        ae(l, ct(sprintf(LANG.infobox_showall, lv_screenshots.length)));
        ae(n, l);
        ae(g, n);
        ae(m, g)
    } else {
        var l;
        if (g_user.id > 0) {
            l = '<a href="javascript:;" onclick="ss_submitAScreenshot(); return false">'
        } else {
            l = '<a href="?account=signin">'
        }
        m.innerHTML = sprintf(LANG.infobox_noneyet, l + LANG.infobox_submitone + "</a>")
    }
}
Listview.templates.screenshot = {sort: [],mode: 3,nItemsPerPage: 40,nItemsPerRow: 4,poundable: 2,columns: [],compute: function(k, e, l) {
            var u, o = new Date(k.date), f = (g_serverTime - o) / 1000;
            e.className = "screenshot-cell";
            e.vAlign = "bottom";
            var q = ce("a");
            q.href = "#screenshots:id=" + k.id;
            q.onclick = rf2;
            var v = ce("img"), t = Math.min(150 / k.width, 150 / k.height);
            v.src = (k.wowhead==1 ? "http://static.wowhead.com/uploads/screenshots/thumb/" + k.id + ".jpg" : "images/screenshots/thumb/" + k.body.replace("gif","jpg").replace("png","jpg"));
            ae(q, v);
            ae(e, q);
            var p = ce("div");
            p.className = "screenshot-cell-user"+(k.wowhead==1 ? " wowhead" : "");
            var m = (k.user != null && k.user.length);
            if (m) {
                q = ce("a");
                q.href = (k.wowhead==1 ? "http://www.wowhead.com/user=" : "?user=") + k.user;
                ae(q, ct(k.user));
                ae(p, ct(LANG.lvscreenshot_from));
                if(k.wowhead==1){
            		w = ce("img");
            		w.src = "images/wowhead.gif";
            		w.style.margin = "0";
            		w.style.border = "0";
            		ae(p, w);
            	}
                ae(p, q);
                
                ae(p, ct(" "))
            }
            var j = ce("span");
            if (m) {
                Listview.funcBox.coFormatDate(j, f, o)
            } else {
                Listview.funcBox.coFormatDate(j, f, o, 0, 1)
            }
            ae(p, j);
            ae(e, p);
            p = ce("div");
            p.style.position = "relative";
            p.style.height = "1em";
            if (g_getLocale(true) != 0 && k.caption) {
                k.caption = ""
            }
            var h = (k.caption != null && k.caption.length);
            var g = (k.subject != null && k.subject.length);
            if (h || g) {
                var r = ce("div");
                r.className = "screenshot-caption";
                if (g) {
                    var c = ce("small");
                    ae(c, ct(LANG.types[k.type][0] + LANG.colon));
                    var b = ce("a");
                    ae(b, ct(k.subject));
                    b.href = "?" + g_types[k.type] + "=" + k.typeId;
                    ae(c, b);
                    ae(r, c);
                    if (h && k.caption.length) {
                        ae(c, ct(" (...)"))
                    }
                    ae(c, ce("br"))
                }
                if (h) {
                    aE(e, "mouseover", Listview.funcBox.ssCellOver.bind(r));
                    aE(e, "mouseout", Listview.funcBox.ssCellOut.bind(r));
                    var n = ce("span");
                    n.innerHTML = k.caption;
                    ae(r, n)
                }
                ae(p, r)
            }
            aE(e, "click", Listview.funcBox.ssCellClick.bind(this, l));
            ae(e, p)
        },createNote: function(d) {
            if (typeof g_pageInfo == "object" && g_pageInfo.type > 0) {
                var c = ce("small");
                var b = ce("a");
                if (g_user.id > 0) {
                    b.href = "javascript:;";
                    b.onclick = ss_submitAScreenshot
                } else {
                    b.href = "?account=signin"
                }
                ae(b, ct(LANG.lvscreenshot_submit));
                ae(c, b);
                ae(d, c)
            }
        },onNoData: function(c) {
            if (typeof g_pageInfo == "object" && g_pageInfo.type > 0) {
                var a = "<b>" + LANG.lvnodata_ss1 + '</b><div class="pad2"></div>';
                if (g_user.id > 0) {
                    var b = LANG.lvnodata_ss2;
                    b = b.replace("<a>", '<a href="javascript:;" onclick="ss_submitAScreenshot()" onmousedown="return false">');
                    a += b
                } else {
                    var b = LANG.lvnodata_ss3;
                    b = b.replace("<a>", '<a href="?account=signin">');
                    b = b.replace("<a>", '<a href="?account=signup">');
                    a += b
                }
                c.style.padding = "1.5em 0";
                c.innerHTML = a
            } else {
                return -1
            }
        },onBeforeCreate: function() {
            if (location.hash && location.hash.match(/:id=([0-9]+)/) != null) {
                var a = in_array(this.data, parseInt(RegExp.$1), function(b) {
                    return b.id
                });
                this.rowOffset = this.getRowOffset(a);
                return a
            }
        },onAfterCreate: function(a) {
            if (a != null) {
                setTimeout((function() {
                    ScreenshotViewer.show({screenshots: this.data,pos: a})
                }).bind(this), 1)
            }
        }}
var ScreenshotViewer = new 
function() {
    var z, k, e, y, B, c, o, q = 0, u, b, n, i, w, x, t, h, v, j;
    function g(C) {
        var F = z[k];
        var D = Math.max(50, Math.min(618, g_getWindowSize().h - 72 - C));
        if (q != 1 || F.id || F.resize) {
            c = Math.min(772 / F.width, 618 / F.height);
            B = Math.min(772 / F.width, D / F.height)
        } else {
            c = B = 1
        }
        if (c > 1) {
            c = 1
        }
        if (B > 1) {
            B = 1
        }
        e = Math.round(B * F.width);
        y = Math.round(B * F.height);
        var E = Math.max(480, e);
        Lightbox.setSize(E + 20, y + 52 + C);
        if (Browser.ie6) {
            n.style.width = E + "px";
            if (z.length > 1) {
                w.style.height = x.style.height = y + "px"
            } else {
                t.style.height = y + "px"
            }
        }
        if (C) {
            i.firstChild.width = e;
            i.firstChild.height = y
        }
    }
    function d(E) {
        var D = z[E], C = "#screenshots:";
        if (q == 0) {
            C += "id=" + D.id
        } else {
            C += u + ":" + (E + 1)
        }
        return C
    }
    function s(F) {
        if (F && (B == c) && g_getWindowSize().h > b.offsetHeight) {
            return
        }
        b.style.visibility = "hidden";
        var C = z[k], I = (C.width > 772 || C.height > 618);
        g(0);
        var E = (C.url ? C.url: (C.wowhead==1 ? "http://static.wowhead.com/uploads/screenshots/" : "images/screenshots/") + (I ? "resized/": "normal/") + (C.wowhead==1  ? C.id + ".jpg" : C.body.replace("gif","jpg").replace("png","jpg")));
        var J = '<img src="' + E + '" width="' + e + '" height="' + y + '"';
        if (Browser.ie6) {
            J += ' galleryimg="no"'
        }
        J += ">";
        i.innerHTML = J;
        if (!F) {
            if (C.url) {
                h.href = E
            } else {
                h.href = (C.wowhead==1 ? "http://static.wowhead.com/uploads/screenshots/normal/" + C.id + ".jpg" : "images/screenshots/normal/" + C.body.replace("gif","jpg").replace("png","jpg"));
            }
            if (!C.user && typeof g_pageInfo == "object") {
                C.user = g_pageInfo.username
            }
            var L = (C.date && C.user), K = (z.length > 1);
            if (L) {
                var H = new Date(C.date), N = (g_serverTime - H) / 1000;
                var M = v.firstChild.childNodes[1];
                M.href = (C.wowhead==1 ? "http://www.wowhead.com/user=" : "?user=") + C.user;
                M.innerHTML = C.user;
                var P = v.firstChild.childNodes[3];
                while (P.firstChild) {
                    de(P.firstChild)
                }
                Listview.funcBox.coFormatDate(P, N, H);
                v.firstChild.style.display = ""
            } else {
                v.firstChild.style.display = "none"
            }
            var P = v.childNodes[1];
            if (K) {
                var O = "";
                if (L) {
                    O += LANG.dash
                }
                O += (k + 1) + LANG.lvpage_of + z.length;
                P.innerHTML = O;
                P.style.display = ""
            } else {
                P.style.display = "none"
            }
            v.style.display = (L || K ? "" : "none");
            /*if (g_getLocale(true) != 0 && C.caption) {
                C.caption = ""
            }*/
            var D = (C.caption != null && C.caption.length);
            var G = (C.subject != null && C.subject.length && C.type && C.typeId);
            if (D || G) {
                var J = "";
                if (G) {
                    J += LANG.types[C.type][0] + LANG.colon;
                    J += '<a href="?' + g_types[C.type] + "=" + C.typeId + '">';
                    J += C.subject;
                    J += "</a>"
                }
                if (D) {
                    if (G) {
                        J += LANG.dash
                    }
                    J += C.caption
                }
                j.innerHTML = J;
                j.style.display = ""
            } else {
                j.style.display = "none"
            }
            if (z.length > 1) {
                w.href = d(r(-1));
                x.href = d(r(1));
                w.style.display = x.style.display = "";
                t.style.display = "none"
            } else {
                w.style.display = x.style.display = "none";
                t.style.display = ""
            }
            location.replace(d(k))
        }
        Lightbox.reveal();
        if (j.offsetHeight > 18) {
            g(j.offsetHeight - 18)
        }
        b.style.visibility = "visible"
    }
    function r(C) {
        var D = k;
        D += C;
        if (D < 0) {
            D = z.length - 1
        } else {
            if (D >= z.length) {
                D = 0
            }
        }
        return D
    }
    function a() {
        k = r(-1);
        s();
        return false
    }
    function p() {
        k = r(1);
        s();
        return false
    }
    function m(C) {
        C = $E(C);
        switch (C.keyCode) {
            case 37:
                a();
                break;
            case 39:
                p();
                break
        }
    }
    function f() {
        s(1)
    }
    function l() {
        if (z.length > 1) {
            dE(document, "keyup", m)
        }
        if (o && q == 0) {
            if (o.indexOf(":id=") != -1) {
                o = "#screenshots"
            }
            location.replace(o)
        } else {
            location.replace("#.")
        }
    }
    function A(C, G, D) {
        if (typeof D.screenshots == "string") {
            z = g_screenshots[D.screenshots];
            q = 1;
            u = D.screenshots
        } else {
            z = D.screenshots;
            q = 0;
            u = null
        }
        b = C;
        k = 0;
        if (D.pos && D.pos >= 0 && D.pos < z.length) {
            k = D.pos
        }
        if (G) {
            C.className = "screenshotviewer";
            n = ce("div");
            n.className = "screenshotviewer-screen";
            w = ce("a");
            x = ce("a");
            w.className = "screenshotviewer-prev";
            x.className = "screenshotviewer-next";
            w.href = "javascript:;";
            x.href = "javascript:;";
            var I = ce("span");
            ae(I, ce("b"));
            ae(w, I);
            var I = ce("span");
            ae(I, ce("b"));
            ae(x, I);
            w.onclick = a;
            x.onclick = p;
            t = ce("a");
            t.className = "screenshotviewer-cover";
            t.href = "javascript:;";
            t.onclick = Lightbox.hide;
            var I = ce("span");
            ae(I, ce("b"));
            ae(t, I);
            if (Browser.ie6) {
                ns(w);
                ns(x);
                w.onmouseover = x.onmouseover = t.onmouseover = function() {
                    this.firstChild.style.display = "block"
                };
                w.onmouseout = x.onmouseout = t.onmouseout = function() {
                    this.firstChild.style.display = ""
                }
            }
            ae(n, w);
            ae(n, x);
            ae(n, t);
            i = ce("div");
            ae(n, i);
            ae(C, n);
            var H = ce("a");
            H.className = "screenshotviewer-close";
            H.href = "javascript:;";
            H.onclick = Lightbox.hide;
            ae(H, ce("span"));
            ae(C, H);
            h = ce("a");
            h.className = "screenshotviewer-original";
            h.href = "javascript:;";
            h.target = "_blank";
            ae(h, ce("span"));
            ae(C, h);
            v = ce("div");
            v.className = "screenshotviewer-from";
            var E = ce("span");
            ae(E, ct(LANG.lvscreenshot_from));
            ae(E, ce("a"));
            ae(E, ct(" "));
            ae(E, ce("span"));
            ae(v, E);
            ae(v, ce("span"));
            ae(C, v);
            j = ce("div");
            j.className = "screenshotviewer-caption";
            ae(C, j);
            var F = ce("div");
            F.className = "clear";
            ae(C, F)
        }
        o = location.hash;
        if (z.length > 1) {
            aE(document, "keyup", m)
        }
        s()
    }
    this.checkPound = function() {
        if (location.hash && location.hash.indexOf("#screenshots") == 0) {
            if (!g_listviews.screenshots) {
                var D = location.hash.split(":");
                if (D.length == 3) {
                    var E = g_screenshots[D[1]], C = parseInt(D[2]);
                    if (E && C >= 1 && C <= E.length) {
                        ScreenshotViewer.show({screenshots: D[1],pos: C - 1})
                    }
                }
            }
        }
    };
    this.show = function(C) {
        Lightbox.show("screenshotviewer", {onShow: A,onHide: l,onResize: f}, C)
    };
    DomContentLoaded.addEvent(this.checkPound)
};