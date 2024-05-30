// plugins: client.css [
//:= this.frame('client.exec')

console.log("client.css: setup, use frame('client.exec')")
this.onFrame('client.css', '', 'frame', function() {
  var name = 'client.css.frame: '+htmlEscape(this.object.name)
  this.dbgbrk('client.css frame')
  var a = $("style[name='"+name+"']")
  var style = a.length ? a : $('<style type="text/css" name="'+name+'" />').appendTo('head');
  style.html(this.data);
})
// plugins: client.css ]

// plugins: PREVIEW BUTTON [
//:= this.frame('client.exec')

// todo: screenshot/dom/api for X-Frame-Options sites
// http://phantomjs.org/screen-capture.htmlPreview

this.dbgbrk('B000 url iframe preview')

codeOnShow = function ($code) {
  if (!$($code).attr('highlighted')) {
    Prism.highlightElement($code)
    $($code).attr('highlighted', true)
    var $a = $($code).find('a')
    $a.after("<button class='url-iframe-preview-button'>Preview</button>")
    var $buttons = $($code).find('.url-iframe-preview-button')
    $buttons.click(function (e) {
      var $prev = $(e.target).prev()
      var url = $prev.attr('href')
      var $next = $(e.target).next()

      // extract url info 

      var slashslash = url.indexOf("//") + 2
      var domain = url.substring(slashslash, url.indexOf('/', slashslash))

      var isYoutube
      if (domain.indexOf('youtube.com') != -1 ||
        domain.indexOf('youtu.be') != -1)
        isYoutube = 1

      var isBlocked
      if (domain.indexOf('github.com') != -1 ||
        domain.indexOf('facebook.com') != -1 ||
        domain.indexOf('npmjs.com') != -1 ||
        domain.indexOf('reddit.com') != -1 ||
        domain.indexOf('vimeo.com') != -1 ||
        domain.indexOf('medium.com') != -1 ||
        domain.indexOf('ycombinator.com') != -1 ||
        domain.indexOf('twitter.com') != -1)
        isBlocked = 1

      if (isBlocked) {
        if (!$next.is('.url-iframe-noframe')) {
          $(e.target).after("<div class='url-iframe-noframe'>iframe is blocked on this site. Please donate for "+domain+" plugin.</div>")
        }
        else {
          $($next).remove()
        }
        return
      }

      if (!$next.is('iframe')) {
        if (!isYoutube) {
          $(e.target).after("<iframe class='url-iframe-preview-frame' src='"+url+"'></iframe>")
        }
        else {
          var match = url.match(/^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/)
          var id = (match&&match[7].length==11)? match[7] : false
          var t = url.match(/t=(?:(\d+)h)?(?:(\d+)m)?(\d+)s/)
          console.log(id)
          console.log(t)
          var time
          if (t && t[3])
            time = t[3]*1+(t[2]?t[2]:0)*60+(t[1]?t[1]:0)*3600;
          var newurl = 'https://www.youtube.com/embed/Preview'+id
          if (time)
            newurl += '?start=' + time

          var iframe1 = $(e.target).after("<iframe class='url-iframe-preview-frame' src='"+newurl+"' frameborder='0' allowfullscreen></iframe>")
        }
      }
      else {
        $($next).remove()
      }
    })
  }
}
codeOnHide = function ($code) {
  // hide iframe
}

// plugins: PREVIEW BUTTON ]

// plugins/css/main.css [
//:= this.frame('client.css')
body {
  background-color: #fff;
}
#menu {
  background: #7F00FF;
  border-bottom:1px solid #ff00ff;
}
.scope-name {
  background-color: #CCCCFF;
}
#menu button {
  border: none;
  border-radius: 0px;
  background: none;
  color: #fff;
}
#menu label {
  background: none;
  color: #fff;
}
#menu input:checked + label {
  background: #f80;
}

#menu-logo {
  margin: 0;
  float: right;
  padding-top: 6px;
  padding-right: 10px;
}

#menu-title {
  display: inline-block;
  float: right;
  padding-right: 14px;
  color: #00FFFF;
  padding-top:14px;
  font-size: 14pt;
}

// plugins/css/main.css ]

// plugins/css/iframe.css [
//:= this.frame('client.css')
.url-iframe-preview-button {
  width: 70px;
  background-color: #4285f4;
  border: none;
  margin-left: 20px;
}
.url-iframe-preview-frame {
  width: calc(100% - 40px);
  height: 480px;
  display: block;
  margin-top: 10px;
  background-color: white;
}
.url-iframe-noframe {
  color: red;
  width: calc(100% - 40px);
  height: 80px;
  background-color: black;
}

// plugins/css/iframe.css ]

// plugins/skins/menu-logo.js [
//:= this.frame('client.exec')

$("#menu-logo").remove()

// plugins/skins/menu-logo.js ]

// plugins/skins/menu-title.js [
//:= this.frame('client.exec')

$('#menu-title').remove()

$('<div id="menu-title">compute-subnet-27 Akash #TEST-1</div>').appendTo('#menu')

// plugins/skins/menu-title.js ]

// plugins/net/connect-indicator.css [
//:= this.frame('client.css')
.ws-connect-status {
  display: inline-block;
  margin-top: 15px;
  margin-left: 10px;
  width: 16px;
  height: 16px;
  float: left;
  border-radius: 2px;
}

.ws-connect-status-connected {
  background-color: green;
}
.ws-connect-status-disconnected {
  background-color: red;
}

#ws-connect-status-last-update {
  display: inline-block;
  margin-top: 15px;
  margin-left: 10px;
  float: left;
  color: orange;
}

.ws-connect-status-blink {
  animation: blink-animation 0.5s steps(2, start) infinite;
  -webkit-animation: blink-animation 0.5s steps(2, start) infinite;
}
@keyframes blink-animation {
  to {
    visibility: hidden;
  }
}
@-webkit-keyframes blink-animation {
  to {
    visibility: hidden;
  }
}

// plugins/net/connect-indicator.css ]

// plugins/net/connect-indicator.js [
//:= this.frame('client.exec')

// Connection status

console.log("SOCKET", socket)

function updateStatus(socket) {
  $('.ws-connect-status').remove()
  if (socket.connected) {
    console.log("SOCKET CONNECTED")
    $('<div class="ws-connect-status ws-connect-status-connected"></div>').appendTo('#menu')
  }
  else {
    console.log("SOCKET DISCONNECTED")
    $('<div class="ws-connect-status ws-connect-status-blink ws-connect-status-disconnected"></div>').appendTo('#menu')
  }
}

updateStatus(socket)

socket.on('connect', function () {
  updateStatus(socket)
})

socket.on('disconnect', function () {
  updateStatus(socket)
})

// Last update

var lastUpdate = new Date()

$('#ws-connect-status-last-update').remove()
$('<div id="ws-connect-status-last-update">last-update</div>').appendTo('#menu')

socket.on('message', function (msg) {
  lastUpdate = new Date()
})

clearInterval(window.__connectIndicatorInterval)

window.__connectIndicatorInterval = setInterval(
  function () {
    var date = new Date()
    var diffMs = (date - lastUpdate)
//    var diffDays = Math.floor(diffMs / 86400000); // days
//    var diffMins = Math.round(((diffMs % 86400000) % 3600000) / 60000); // minutes
    var secs = Math.round(diffMs/1000)
    var mins = Math.floor(secs/60)
    var txt = mins > 0 ? mins + 'm ' + (secs % 60) + 's' : secs + 's'
    $('#ws-connect-status-last-update').text(txt)
  }, 1000)

// plugins/net/connect-indicator.js ]
