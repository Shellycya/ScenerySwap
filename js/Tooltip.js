function showTooltip(value1, value2, ex) {
    var tooltip = document.getElementById("myToolTip");
    tooltip.style.visibility = "visible";
    var posx = 0;
    var posy = 0;
    if (!e) var e = (window.event) ? event : ex;
    if (e.pageX || e.pageY) {
        posx = e.pageX;
        posy = e.pageY;
        tooltip.style.left = posx + "px";
        tooltip.style.top = (posy - 100) + "px";
    }
    else if (e.clientX || e.clientY) {
        if (e.cancelBubble != null) e.cancelBubble = true;
        //for IE8 and earlier versions event bubbling occurs...
        posx = e.clientX + document.body.scrollLeft
               + document.documentElement.scrollLeft;
        posy = e.clientY + document.body.scrollTop + document.documentElement.scrollTop;
        tooltip.style.left = posx + "px";
        tooltip.style.top = (posy - 100) + "px";
    }
    document.getElementById("<%=lbl.ClientID%>").innerHTML =
  "X and Y Values : " + "(" + value1 + "," + value2 + ")";
}
function hide() {
    var tooltip = document.getElementById("myToolTip");
    tooltip.style.visibility = "hidden";
}