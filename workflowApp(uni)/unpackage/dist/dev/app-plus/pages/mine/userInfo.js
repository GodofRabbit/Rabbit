
      !(function(){
        var uniAppViewReadyCallback = function(){
          setCssToHead(["body { background-color: #FFFFFF; }\n.",[1],"info,.",[1],"no-info { width: 40%; text-align: right; }\n.",[1],"name,.",[1],"info,.",[1],"no-info { display: inline-block; font-size: 14px; }\n.",[1],"name { width: 60%; color: #8b8b8b; font-weight: bold; }\n.",[1],"no-info { font-size: 12px; font-style: italic; color: gray; }\n",],undefined,{path:"./pages/mine/userInfo.wxss"})();
document.dispatchEvent(new CustomEvent("generateFuncReady", { detail: { generateFunc: $gwx('./pages/mine/userInfo.wxml') } }));
        }
        if(window.__uniAppViewReady__){
          uniAppViewReadyCallback()
        }else{
          document.addEventListener('uniAppViewReady',uniAppViewReadyCallback)
        }
      })();
      